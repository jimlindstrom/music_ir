# beat_position_spec.rb

require 'spec_helper'

describe MusicIR::PitchClass do

  before(:each) do
  end

  context "initialize" do
    it "should take a value in 0..11 and return a new PitchClass" do
      MusicIR::PitchClass.new(0).should be_an_instance_of MusicIR::PitchClass
    end
    it "should raise an error for pitch classes < 0" do
      expect { MusicIR::PitchClass.new(-1) }.to raise_error(ArgumentError)
    end
    it "should raise an error for pitch classes > 11" do
      expect { MusicIR::PitchClass.new(12) }.to raise_error(ArgumentError)
    end
  end

  context "from_pitch" do
    it "should take a pitch and return a new PitchClass" do
      pc = MusicIR::PitchClass.from_pitch(MusicIR::Pitch.new(0))
      pc.should be_an_instance_of MusicIR::PitchClass
    end
    it "should map A0 to pitch class 0" do
      pc = MusicIR::PitchClass.from_pitch(MusicIR::Pitch.new(21))
      pc.val.should == 0
    end
    it "should map G#0 to pitch class 11" do
      pc = MusicIR::PitchClass.from_pitch(MusicIR::Pitch.new(21+11))
      pc.val.should == 11
    end
    it "should map A1 to pitch class 0" do
      pc = MusicIR::PitchClass.from_pitch(MusicIR::Pitch.new(21+12))
      pc.val.should == 0
    end
  end

  context "val" do
    it "should return whatever you initialized it to" do
      pc = MusicIR::PitchClass.new(5)
      pc.val.should == 5
    end
  end

  describe ".to_s" do
    pending
  end

  describe "#num_values" do
    subject { MusicIR::PitchClass.num_values }
    it { should be_an_instance_of Fixnum }
    it { should == 12 }
  end
end
