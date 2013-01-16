# beat_position_spec.rb

require 'spec_helper'

describe MusicIR::PitchClassSet do

  before(:each) do
  end

  context "initialize" do
    it "should return a new PitchClass" do
      MusicIR::PitchClassSet.new().should be_an_instance_of MusicIR::PitchClassSet
    end
  end

  context "num_values" do
    it "should return 4096" do
      MusicIR::PitchClassSet.num_values.should == 4096
    end
  end

  context "add" do
    it "should put another pitch class in vals" do
      pcs = MusicIR::PitchClassSet.new()
      pcs.add(MusicIR::PitchClass.new(0))
      pcs.vals.should == [0]
    end
    it "should do nothing if the pitch class is already in vals" do
      pcs = MusicIR::PitchClassSet.new()
      pcs.add(MusicIR::PitchClass.new(0))
      pcs.add(MusicIR::PitchClass.new(0))
      pcs.vals.should == [0]
    end
  end

  context "remove" do
    it "should remove the pitch class from vals if it's already in there" do
      pcs = MusicIR::PitchClassSet.new()
      pcs.add(MusicIR::PitchClass.new(0))
      pcs.remove(MusicIR::PitchClass.new(0))
      pcs.vals.should == []
    end
    it "raise an error if the pitch class isn't in there" do
      pcs = MusicIR::PitchClassSet.new()
      expect { pcs.remove(MusicIR::PitchClass.new(0)) }.to raise_error(RuntimeError)
    end
  end

  context "vals" do
    it "should return the empty set if no values have been added" do
      pcs = MusicIR::PitchClassSet.new()
      pcs.vals.should == []
    end
    it "should contain any added values, sorted" do
      pcs = MusicIR::PitchClassSet.new()
      pcs.add(MusicIR::PitchClass.new(0))
      pcs.remove(MusicIR::PitchClass.new(0))
      pcs.add(MusicIR::PitchClass.new(4))
      pcs.add(MusicIR::PitchClass.new(1))
      pcs.vals.should == [1,4]
    end
  end

end
