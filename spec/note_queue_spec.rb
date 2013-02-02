# midi_event_queue_spec.rb

require 'spec_helper'

describe MusicIR::NoteQueue do

  before(:each) do
  end

  describe ".tempo" do
    it "can be read and written" do
      nq = MusicIR::NoteQueue.new([])
      nq.tempo = 250
      nq.tempo.should == 250
    end
  end
     
  describe ".to_event_queue" do
    context "if tempo has been set" do
      before(:each) do
        @nq = MusicIR::NoteQueue.new([])
        @nq.tempo = 100
      end
      it "returns a EventQueue" do
        @nq.to_event_queue.should be_an_instance_of MusicIR::EventQueue
      end
      context "if it contains notes, and possibly rests" do
        before(:each) do
          notes = []
          notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
          notes << MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(4))
          notes << MusicIR::Rest.new(                       MusicIR::Duration.new(3))
          notes << MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(2))
          @nq = MusicIR::NoteQueue.new(notes)
          @nq.tempo = 100
          @eq = @nq.to_event_queue
        end
        it "converts each note (not rest) into a note_on / note_off pair" do
          @eq.map{ |x| x.message }.should == [MusicIR::MidiEvent::NOTE_ON, MusicIR::MidiEvent::NOTE_OFF]*3
        end
        it "gives each note_on/note_off the right pitch" do
          @eq.map{ |x| x.pitch }.should == [1,1, 2,2, 3,3]
        end
        it "sets each note_on/note_off's timestamp to be the sum of all preceding durations, times the tempo" do
          expected_timestamps = []
          expected_timestamps.push (0        )*100 # 0
          expected_timestamps.push (0+1      )*100 # 100

          expected_timestamps.push (0+1      )*100 # 100
          expected_timestamps.push (0+1+4    )*100 # 500

          expected_timestamps.push (0+1+4+3  )*100 # 800
          expected_timestamps.push (0+1+4+3+2)*100 # 1000
          @eq.map{ |x| x.timestamp }.should == expected_timestamps
        end
      end
    end
    context "if tempo has not been set" do
      it "raises an error" do
        @nq = MusicIR::NoteQueue.new([])
        expect { @nq.to_event_queue }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".from_event_queue" do
    before (:all) do
      @test_events = [
        MusicIR::NoteOnEvent.new( { :pitch => 40, :velocity => 100, :timestamp => 1000 }),
        MusicIR::NoteOffEvent.new({ :pitch => 40, :velocity => 100, :timestamp => 2000 }),
  
        MusicIR::NoteOnEvent.new( { :pitch => 42, :velocity => 100, :timestamp => 2000 }),
        MusicIR::NoteOffEvent.new({ :pitch => 42, :velocity => 100, :timestamp => 3000 }),
  
        MusicIR::NoteOnEvent.new( { :pitch => 44, :velocity => 100, :timestamp => 3000 }),
        MusicIR::NoteOffEvent.new({ :pitch => 44, :velocity => 100, :timestamp => 4000 }) ]

      @evq = MusicIR::EventQueue.new
      @test_events.each { |e| @evq.enqueue e }
      @nq = MusicIR::NoteQueue.from_event_queue(@evq)
    end

    it "returns a NoteQueue" do
      @nq.class.should == MusicIR::NoteQueue
    end
    it "converts the event queue into notes with the correct pitches" do
      @nq.map { |x| x.pitch.val }.should == [40, 42, 44]
    end
    it "converts the event queue into notes with the correct quantized duration" do
      @nq.map { |x| x.duration.val }.should == [1, 1, 1]
    end
    it "calculates tempo" do
      @nq.tempo.should == 1000
    end

    context "if there are gaps in the quantized durations" do
      before(:all) do
        @test_events_with_gap = [
          MusicIR::NoteOnEvent.new( { :pitch => 40, :velocity => 100, :timestamp => 1000 }),
          MusicIR::NoteOffEvent.new({ :pitch => 40, :velocity => 100, :timestamp => 2000 }),
    
          MusicIR::NoteOnEvent.new( { :pitch => 42, :velocity => 100, :timestamp => 2000 }),
          MusicIR::NoteOffEvent.new({ :pitch => 42, :velocity => 100, :timestamp => 3000 }),
    
          MusicIR::NoteOnEvent.new( { :pitch => 44, :velocity => 100, :timestamp => 4000 }),
          MusicIR::NoteOffEvent.new({ :pitch => 44, :velocity => 100, :timestamp => 5000 }),
    
          MusicIR::NoteOnEvent.new( { :pitch => 45, :velocity => 100, :timestamp => 5000 }),
          MusicIR::NoteOffEvent.new({ :pitch => 45, :velocity => 100, :timestamp => 6000 }) ]
      end
      it "inserts rests where there are gaps" do
        evq = MusicIR::EventQueue.new
        @test_events_with_gap.each { |e| evq.enqueue e }
        nq = MusicIR::NoteQueue.from_event_queue(evq)
  
        nq.map { |x| x.class }.should == [MusicIR::Note, MusicIR::Note, MusicIR::Rest, MusicIR::Note, MusicIR::Note]
      end
    end
  end

  describe ".to_beat_array" do
    before(:each) do
      notes = []
      notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
      notes << MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(4))
      notes << MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(2))
      notes << MusicIR::Rest.new(                       MusicIR::Duration.new(2))
      @nq = MusicIR::NoteQueue.new(notes)
      @nq.tempo = 100
    end
    it "returns an array containing one element per beat" do
      @nq.to_beat_array.length.should == (1+4+2+2)
    end
    it "returns an array containing Beats where there are note onsets" do
      @nq.to_beat_array[0+1+4].should be_an_instance_of MusicIR::Beat
    end
    it "returns an array containing Beats where there are rest onsets" do
      @nq.to_beat_array[0+1+4+2].should be_an_instance_of MusicIR::Beat
    end
    it "returns an array containing nils where there aren't note onsets" do
      @nq.to_beat_array[0+2].nil?.should be_true
    end
  end


  describe ".ratio_of_cur_and_prev_duration" do
    pending
  end

  describe ".ratio_of_cur_and_next_duration" do
    pending
  end

  describe ".is_end_of_measure?" do
    pending
  end

  describe ".is_subbeat_0?" do
    pending
  end

  describe ".is_different_from_next_chord?" do
    pending
  end

  describe ".interval_after" do
    pending
  end

  describe ".is_repeated_pitch?" do
    pending
  end

  describe ".is_next_chord_tonic?" do
    pending
  end

  describe ".ratio_of_abs_interval_before_vs_after" do
    pending
  end

  describe ".is_same_as_next_pitch?" do
    pending
  end

end
