module MusicIR
  class PhraseList < Array

    def initialize(note_queue)
      @note_queue = note_queue
    end

    def self.initial(note_queue)
      pl = PhraseList.new(note_queue)
      pl.push Phrase.new(note_queue, start_idx=0, end_idx=note_queue.length-1)
      return pl
    end

    def clone
      pl = PhraseList.new(@note_queue)
      self.each do |phrase|
        pl.push Phrase.new(@note_queue, phrase.start_idx, phrase.end_idx)
      end
      return pl
    end

    def score
      @score ||= self.map{ |phrase| phrase.score(self) }.inject(:+)
    end

    def to_s
      self.map{ |p| "#{p.start_idx}-#{p.end_idx}" }.join(", ")
    end

    # UNTESTED

    def choose_tactic
      return [ :split_all_phrases,
               :split_a_phrase,
               :merge_two_phrases,
               :shift_boundary_between_two_phrases,
               :shift_boundary_between_two_phrases,
               :shift_boundary_between_two_phrases ].sample
    end
  
    def split_a_phrase # should be useful when there's one outlier that's too long
      @score = nil # if we had scored this phrase list it's now invalidated

      orig_phrase = self[choose_phrase_idx_weighted_by_duration_deviance]
      if orig_phrase.length > 1
        new_phrase = orig_phrase.split_at_a_big_interval
        push new_phrase
        resort!
      end
    end

    def split_all_phrases # should be useful for when we zero in on a good, but too-high-level solution
      @score = nil # if we had scored this phrase list it's now invalidated

      new_phrases = []
      self.each do |orig_phrase|
        if orig_phrase.length > 1
          new_phrase = orig_phrase.split_at_a_big_interval
          new_phrases.push new_phrase
        end
      end
      concat new_phrases
      resort!
    end

    def merge_two_phrases
      @score = nil # if we had scored this phrase list it's now invalidated

      return if self.length < 2

      phrase1_idx, phrase2_idx = choose_two_phrases_weighted_by_score

      self[phrase1_idx] = Phrase.new(@note_queue, self[phrase1_idx].start_idx, self[phrase2_idx].end_idx)
      self.delete_at(phrase2_idx)
    end

    def shift_boundary_between_two_phrases
      @score = nil # if we had scored this phrase list it's now invalidated

      return if self.length < 2

      phrase1_idx, phrase2_idx = choose_two_phrases_weighted_by_score

      if self[phrase1_idx].length>1 and rand>0.5

        possible_num_notes = Array(1..(self[phrase1_idx].length-1))
        x = Markov::RandomVariable.new(Markov::LiteralAlphabet.new(possible_num_notes))
        possible_num_notes.each do |num_notes|
          x.observe!(outcome=num_notes, num_observations=1.0/num_notes)
        end
        num_notes = x.sample

        self[phrase1_idx] = Phrase.new(@note_queue, self[phrase1_idx].start_idx,             self[phrase1_idx].end_idx - num_notes)
        self[phrase2_idx] = Phrase.new(@note_queue, self[phrase2_idx].start_idx - num_notes, self[phrase2_idx].end_idx            )

      elsif self[phrase2_idx].length>1

        possible_num_notes = Array(1..(self[phrase2_idx].length-1))
        x = Markov::RandomVariable.new(Markov::LiteralAlphabet.new(possible_num_notes))
        possible_num_notes.each do |num_notes|
          x.observe!(outcome=num_notes, num_observations=1.0/num_notes)
        end
        num_notes = x.sample

        self[phrase1_idx] = Phrase.new(@note_queue, self[phrase1_idx].start_idx,             self[phrase1_idx].end_idx + num_notes)
        self[phrase2_idx] = Phrase.new(@note_queue, self[phrase2_idx].start_idx + num_notes, self[phrase2_idx].end_idx            )
      end
    end

    def median_phrase_duration
      phrase_durations = self.collect{ |p| p.duration }.sort

      median_duration = case (phrase_durations.length%2)
        when 0 then (phrase_durations[(phrase_durations.length/2)-1] + phrase_durations[phrase_durations.length/2]) / 2.0
        when 1 then phrase_durations[phrase_durations.length/2]
      end

      return median_duration
    end

    def phrase_duration_penalty_for(phrase)
      if self.length > 1
        median_duration = median_phrase_duration

        if phrase.duration > median_duration
          duration_deviance = ((phrase.duration - median_duration) / median_duration.to_f)**1.5
        else
          duration_deviance = ((median_duration - phrase.duration) / phrase.duration.to_f)**1.5
        end
      else
        duration_deviance = 0.0
      end

      duration_deviance
    end

    def phrase_cross_similarities(phrase)
      phrase_similarities = []

      if self.length > 1
        phrase_beats = MusicIR::NoteQueue.new(phrase.notes).to_beat_array
        (self-[phrase]).each do |other_phrase|
          other_phrase_beats = MusicIR::NoteQueue.new(other_phrase.notes).to_beat_array
          matrix = BeatCrossSimilarityMatrix.new(phrase_beats, other_phrase_beats)
          phrase_similarities <<  matrix.max_arithmetic_mean_of_diag(penalize_for_overhang=true)
        end
      end

      phrase_similarities
    end

  private

    def choose_two_phrases_weighted_by_score
      phrase1_idx = choose_phrase_idx_weighted_by_score
      if phrase1_idx == (self.length-1)
        phrase1_idx -= 1
      elsif (phrase1_idx > 0) and (rand > 0.5)
        phrase1_idx -= 1
      end
      phrase2_idx = phrase1_idx + 1

      return [phrase1_idx, phrase2_idx]
    end

    def choose_phrase_idx_weighted_by_duration_deviance
      choose_phrase_idx_weighted_by_lambda(lambda{|phrase| phrase_duration_penalty_for(phrase)})
    end

    def choose_phrase_idx_weighted_by_score
      choose_phrase_idx_weighted_by_lambda(lambda{|phrase| -phrase.score(self)})
    end

    def choose_phrase_idx_weighted_by_lambda(l)
      raise RuntimeError.new("can't choose phrase index for empty phrase list") if self.length==0
      return 0 if self.length==1

      scores = self.map{ |phrase| l.call(phrase) }
      min_score = scores.min
      translated_scores = scores.map{ |s| s-min_score }

      x = Markov::RandomVariable.new(Markov::LiteralAlphabet.new((0..(self.length-1)).to_a))
      translated_scores.each_with_index do |score, idx|
        avoid_zero_observations = 0.01
        x.observe!(outcome=idx, num_observations=avoid_zero_observations+score)
      end
      idx = x.sample

      raise RuntimeError.new("idx must be not be nil. #{translated_scores.inspect}") if idx.nil?
      raise RuntimeError.new("idx #{idx} must be in [0, #{self.length-1}]") if idx<0 or idx>=self.length
      return idx
    end

    def resort!
      self.sort!{ |x,y| x.start_idx <=> y.start_idx }
    end
  end

end
