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

  describe ".similarity_to" do
    let(:note) { MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(1)) }

    context "when compared to itself" do
      subject { note.similarity_to(note) }
      it { should be_within(0.01).of(1.0) }
    end
    context "when compared to nil" do
      subject { note.similarity_to(nil) }
      it { should be_nil }
    end
    context "when compared to a rest of the same duration" do
      let(:rest) { MusicIR::Rest.new(MusicIR::Duration.new(1)) }
      subject { note.similarity_to(rest) }
      it { should be > 0.0 }
    end
    context "when compared to a radically different note" do
      really_different_note = MusicIR::Note.new(MusicIR::Pitch.new(100), MusicIR::Duration.new( 100))
      subject { note.similarity_to(really_different_note) }
      it { should be < 0.1 }
    end
  end

end
