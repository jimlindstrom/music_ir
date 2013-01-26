require 'spec_helper'

describe MusicIR::Chord do

  before(:each) do
  end

  describe "#new" do
    context "given a valid pitch class and mode"do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      subject { MusicIR::Chord.new(pitch_class, mode) } 
      it { should be_an_instance_of MusicIR::Chord }
      it "should set pitch class" do
        subject.pitch_class.val.should ==  pitch_class.val
      end
      it "should set the mode" do
        subject.mode.should == mode
      end
    end
  end

  describe ".to_s" do
    context "given a valid pitch class and mode" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      let(:chord) { MusicIR::Chord.new(pitch_class, mode) } 
      context "when use_flats == true or isn't specified" do
        subject { chord.to_s }
        it { should be_an_instance_of String }
        it { should == "Dbmajor" }
      end
      context "when use_flats == false" do
        subject { chord.to_s(use_flats=false) }
        it { should be_an_instance_of String }
        it { should == "C#major" }
      end
    end
  end

end
