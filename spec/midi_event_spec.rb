require 'spec_helper'

describe MusicIR::MidiEvent do
     
  describe ".initialize" do
    it "takes a message and a timestamp, and creates a new MusicIR::MidiEvent" do
      @event = MusicIR::MidiEvent.new(message=MusicIR::MidiEvent::NOTE_ON, timestamp=123)
      @event.should be_an_instance_of MusicIR::MidiEvent
    end
    it "raises an error if the Midi event isn't valid" do
      expect { @event = MusicIR::MidiEvent.new(message=-1, timestamp=0) }.to raise_error(ArgumentError)
    end
    it "raises an error if the timestamp is negative" do
      expect { @event = MusicIR::MidiEvent.new(message=MusicIR::MidiEvent::NOTE_ON, timestamp=-1) }.to raise_error(ArgumentError)
    end
  end
      
  describe ".message" do
    it "returns whatever you initialized it to" do
      @event = MusicIR::MidiEvent.new(message=MusicIR::MidiEvent::NOTE_ON, timestamp=123)
      @event.message.should == MusicIR::MidiEvent::NOTE_ON
    end
  end

  describe ".timestamp" do
    it "returns whatever you initialized it to" do
      @event = MusicIR::MidiEvent.new(message=MusicIR::MidiEvent::NOTE_ON, timestamp=123)
      @event.timestamp.should == 123
    end
  end

end

describe MusicIR::NoteOnEvent do
  describe ".initialize" do
    pending
  end
end

describe MusicIR::NoteOffEvent do
  describe ".initialize" do
    pending
  end
end

describe MusicIR::KeySigEvent do
  describe ".initialize" do
    pending
  end

  describe ".num_flats" do
    pending
  end

  describe ".is_major" do
    pending
  end
end

