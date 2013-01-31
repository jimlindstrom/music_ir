module CanDetectPhrases
  attr_accessor :phrases

  MAX_ATTEMPTS = 3

  def detect_phrases
    return false if self.length < 2 # we need >= 2 per group, and at least one group
    return false if self.map{|x| x.class}.include?(MusicIR::Rest) # FIXME:For now, we can't deal with these.

    analyze!
    @phrases = MusicIR::PhraseList.initial(self)
    attempts = MAX_ATTEMPTS.times.collect { new_phrase_detection_attempt }

    return true
  end

private

  MAX_RETRIES = 35
  MAX_ITERS   = 50

  def new_phrase_detection_attempt
    best_phrases = MusicIR::PhraseList.initial(self)

    retries = 0
    iter    = 0

    while (iter < MAX_ITERS) and (retries < MAX_RETRIES)
      tactic = best_phrases.choose_tactic

      cur_phrases = best_phrases.clone
      cur_phrases.send(tactic)

      if cur_phrases.score > best_phrases.score
        retries = 0
        best_phrases = cur_phrases
      else
        retries += 1
      end
      iter += 1
    end

    if best_phrases.score > @phrases.score
      @phrases = best_phrases
    end

    return best_phrases
  end

end

