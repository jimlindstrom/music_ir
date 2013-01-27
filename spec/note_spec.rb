require 'spec_helper'

describe MusicIR::Note do

  describe "#new" do
    let(:duration) { MusicIR::Duration.new(3) }
    let(:pitch)    { MusicIR::Pitch.new(0) }
    context "with just a pitch and duration" do
      subject { MusicIR::Note.new(pitch, duration) }
      it { should be_a MusicIR::Note }
      its(:pitch)    { should == pitch }
      its(:duration) { should == duration }
      its(:analysis) { should == {} }
    end
    context "with a pitch, duration and analysis" do
      let(:analysis) { { :foo => "bar" } }
      subject { MusicIR::Note.new(pitch, duration, analysis) }
      it { should be_a MusicIR::Note }
      its(:pitch)    { should == pitch }
      its(:duration) { should == duration }
      its(:analysis) { should == analysis }
    end
  end

  describe ".analysis" do
    it "should return a hash that can be extended with whatever values critics want" do
      n = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(3))
      n.analysis.should be_an_instance_of Hash
    end
  end

end
