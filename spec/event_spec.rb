require 'spec_helper.rb'

describe MusicIR::Event do
  describe "#new" do
    let(:duration) { MusicIR::Duration.new(3) }
    context "with just a duration" do
      subject { MusicIR::Event.new(duration) }
      it { should be_a MusicIR::Event }
      its(:duration) { should == duration }
      its(:analysis) { should == {} }
    end
    context "with a duration and analysis" do
      let(:analysis) { { :foo => "bar" } }
      subject { MusicIR::Event.new(duration, analysis) }
      it { should be_a MusicIR::Event }
      its(:duration) { should == duration }
      its(:analysis) { should == analysis }
    end
  end
end
