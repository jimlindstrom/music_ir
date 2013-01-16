# midi_event_queue_spec.rb

require 'spec_helper'

describe MusicIR::NoteQueue do

  before(:each) do
  end

  describe ".tempo" do
    it "can be read and written" do
      nq = MusicIR::NoteQueue.new
      nq.tempo = 250
      nq.tempo.should == 250
    end
  end
     
  describe ".to_event_queue" do
    context "if tempo has been set" do
      before(:each) do
        @nq = MusicIR::NoteQueue.new
        @nq.tempo = 100
      end
      it "returns a EventQueue" do
        @nq.to_event_queue.should be_an_instance_of MusicIR::EventQueue
      end
      context "if it contains notes, and possibly rests" do
        before(:each) do
          @nq.push MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
          @nq.push MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(4))
          @nq.push MusicIR::Rest.new(                     MusicIR::Duration.new(3))
          @nq.push MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(2))
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
        @nq = MusicIR::NoteQueue.new
        expect { @nq.to_event_queue }.to raise_error(ArgumentError)
      end
    end
  end

#  describe "tag_with_notes_left" do
#    it "adds analysis to each note indicating how many notes follow it" do
#      vector = $meter_vectors["Bring back my bonnie to me"]
#      nq = vector[:note_queue]
#      nq.tag_with_notes_left
#      nq.map { |n| n.analysis[:notes_left] }[-6..-1].should == [ 5, 4, 3, 2, 1, 0 ]
#    end
#  end

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

end
