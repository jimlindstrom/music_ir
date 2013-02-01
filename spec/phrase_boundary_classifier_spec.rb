require 'spec_helper.rb'

describe MusicIR::PhraseBoundaryClassifier do
  let(:pbc) { MusicIR::PhraseBoundaryClassifier.instance }
  let(:nq) { $phrasing_vectors["Bring back my bonnie to me"][:note_queue] }

  describe "#instance" do
    subject { MusicIR::PhraseBoundaryClassifier.instance }
    it { should == MusicIR::PhraseBoundaryClassifier.instance }
  end

  describe "#num_factors" do
    subject { MusicIR::PhraseBoundaryClassifier.num_factors }
    it { should == 10 }
  end

  describe ".factors" do
    let(:note_idx) { 3 }
    subject { pbc.factors(nq, note_idx) }
    it { should be_an Array }
    its(:length) { should == MusicIR::PhraseBoundaryClassifier.num_factors }
    it "should contain fixnums, floats and nils" do
      subject.all?{ |x| [NilClass, Fixnum, Float].should include(x.class) }.should be_true
    end
  end

  describe ".is_end_of_phrase_boundary?" do
    let(:note_idx) { 3 }
    subject { pbc.is_end_of_phrase_boundary?(nq, note_idx) }
    it "returns true or false" do
      [true,false].should include(subject)
    end
  end

  describe ".end_of_phrase_boundary_strength" do
    let(:note_idx) { 3 }
    subject { pbc.end_of_phrase_boundary_strength(nq, note_idx) }
    it { should be_a Float }
  end

  describe ".end_of_phrase_indices" do
    subject { pbc.end_of_phrase_indices(nq) }
    it { should be_an Array }
    it "should contain indices of notes for which .is_end_of_phrase_boundary is true" do
      subject.all?{ |note_idx|  pbc.is_end_of_phrase_boundary?(nq, note_idx) }.should be_true
    end
  end
end
