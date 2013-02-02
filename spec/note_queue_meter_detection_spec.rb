require 'spec_helper'

describe MusicIR::NoteQueue do

  describe ".meter" do
    context "when the note queue is metrically clear and only contains notes" do
      before(:each) do
        vector = $meter_vectors["Bring back my bonnie to me"]
        @nq = vector[:note_queue]
      end
      it "returns a Meter" do
        @nq.meter.should be_a MusicIR::Meter
      end
    end
    context "when the note queue is metrically ambiguous" do
      before(:each) do
        vector = $meter_vectors["Bring back my bonnie to me"]
        nq = vector[:note_queue]
        @nq = MusicIR::NoteQueue.new(nq[0..0]) # something so short it's guaranteed to be metrically ambiguous
      end
      it "returns nil" do
        @nq.meter.should be_nil
      end
    end
    context "when the note queue is metrically clear and contains notes and rests" do
      before(:each) do
        notes = []
        5.times do
          notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(3))
          notes << MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(2))
          notes << MusicIR::Rest.new(                       MusicIR::Duration.new(1))
        end
        @nq = MusicIR::NoteQueue.new(notes)
        @nq.tempo = 100
      end
      it "returns a Meter" do
        @nq.meter.should be_a MusicIR::Meter
      end
    end
    context "when run over all training vectors" do
      it "detects the meter of >85% the time" do
        successes     = []
        failures      = []
        num_successes = 0
        $meter_vectors.keys.sort.each do |key|
          vector = $meter_vectors[key]
          $log.info "\tTrying to detect meter for: #{key}" if $log
          @nq = vector[:note_queue]
          @nq.analyze_harmony! if @nq.none?{ |n| n.is_a?(MusicIR::Rest) }
          if @nq.meter
            if @nq.meter.val == vector[:meter].val
              if @nq.first.analysis[:beat_position].to_hash.inspect == vector[:first_beat_position].to_hash.inspect
                num_successes += 1
                successes.push "%-34s" % "\"#{key}\"" 
              else
                failures.push ("%-34s" % "\"#{key}\"" ) + 
                              "wrong initial beat   (" + 
                              @nq.first.analysis[:beat_position].to_hash.inspect.gsub(/:measure=>0, /, "") + " != " +
                              vector[:first_beat_position].to_hash.inspect.gsub(/:measure=>0, /, "") + ")"
              end
            else
              calced_subbeats_per_measure =  @nq.meter.beats_per_measure * @nq.meter.subbeats_per_beat
              actual_subbeats_per_measure =  vector[:meter].beats_per_measure * vector[:meter].subbeats_per_beat
              error_direction = calced_subbeats_per_measure > actual_subbeats_per_measure ? ">" : "<"
              failures.push ("%-34s" % "\"#{key}\"" ) + 
                            "wrong time signature (" + 
                            @nq.meter.val.inspect.gsub(/, :beat_unit=>4/, "").gsub(/_per[A-Za-z_]*/, '') + 
                            " #{error_direction} " +
                            vector[:meter].val.inspect.gsub(/, :beat_unit=>4/, "").gsub(/_per[A-Za-z_]*/, '') + ")"
            end
          else
            failures.push "\"#{key}\": failed to find a meter"
          end
        end
  
        if failures.length > 0 and $log
          $log.info "\n" +
                    "\tsuccesses:\n" +
                    "\t\t" + successes.join("\n\t\t") +
                    "\n" +
                    "\tfailures:\n" +
                    "\t\t" + failures.join("\n\t\t")
        end
  
        success_rate = num_successes.to_f / $meter_vectors.keys.length
        success_rate.should be >= 0.85
      end
    end
  end

end
