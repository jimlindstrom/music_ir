require 'spec_helper'

describe MusicIR::NoteQueue do

  describe ".phrases" do
    before(:each) do
      @vector = $phrasing_vectors["Bring back my bonnie to me"]
      @nq = @vector[:note_queue]
    end
    context "when the note queue is clearly phrased" do
      it "returns a PhraseList" do
        @nq.phrases.should be_a MusicIR::PhraseList
      end
    end
    context "when the note queue is ambiguously phrased" do
      it "returns nil" do
        @nq = MusicIR::NoteQueue.new(@nq[0..0]) # something so short it's guaranteed to be ambiguously phrased
        @nq.phrases.should be_nil
      end
    end
    context "when the note queue contains rests" do
      before(:each) do
        notes = []
        notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
        notes << MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(4))
        notes << MusicIR::Rest.new(                       MusicIR::Duration.new(3))
        notes << MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(2))
        @nq = MusicIR::NoteQueue.new(notes)
        @nq.tempo = 100
      end
      it "returns nil" do # meaning .. not handled yet.
        @nq.phrases.should be_nil
      end
    end
  end

  describe ".phrases" do
    before(:all) do
      @false_pos    = 0
      @false_neg    = 0
      @true_pos     = 0
      @exp_true_pos = 0

      @successes = []
      @failures  = []

      $phrasing_vectors.keys.sort.each do |key|
        $log.info "\tTrying to detect phrases for: #{key}" if $log
        vector = $phrasing_vectors[key]
        nq = vector[:note_queue]
        nq.analyze_harmony! if nq.none?{ |n| n.is_a?(MusicIR::Rest) }

        actual_boundaries = vector[:phrase_boundaries].collect{ |p| p[:start_idx] }
        calced_boundaries = if nq.phrases
          nq.phrases.map{ |p| p.start_idx }
        else
          [ ]
        end

        @false_pos    += (calced_boundaries - actual_boundaries).length # switch to using actual boundaries
        @false_neg    += (actual_boundaries - calced_boundaries).length
        @true_pos     += (actual_boundaries & calced_boundaries).length
        @exp_true_pos += actual_boundaries.length

        if nq.phrases and (calced_boundaries == actual_boundaries)
          @successes.push "#{key}"
        elsif nq.phrases and (calced_boundaries != actual_boundaries)
          @failures.push "%-34s" % "\"#{key}\"" +
                         "calculated: #{calced_boundaries.inspect} != expected: #{actual_boundaries.inspect}"
        else # !nq.phrases
          @failures.push "%-34s" % "\"#{key}\"" +
                         "failed"
        end
      end

      if @failures.length > 0 and $log
        $log.info "\n" +
                  "\tsuccesses:\n" + 
                  "\t\t" + @successes.join("\n\t\t") +
                  "\n" +
                  "\tfailures:\n" +
                  "\t\t" + @failures.join("\n\t\t")
      end
    end

    it "should produce the expected phrase list > 50% of the time" do
      pct_success = @successes.length / $phrasing_vectors.keys.length.to_f
      pct_success.should be > 0.50
    end
    it "should include 95% of all actual boundary candidates" do
      pct_found = @true_pos / @exp_true_pos.to_f
      pct_found.should be > 0.95 
    end
    it "should include wrong boundary candidates less than 5% of the time" do
      pct_extra = @false_pos / @exp_true_pos.to_f
      pct_extra.should be < 0.05
    end
  end

end
