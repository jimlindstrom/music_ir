#!/usr/bin/env ruby

require 'spec_helper'

describe MusicIR::Interval do
  before do
  end

  context "new" do
    it "should take an integer from -127 to 127" do
      MusicIR::Interval.new(-127).should be_an_instance_of MusicIR::Interval
    end
    it "should take an integer from -127 to 127" do
      MusicIR::Interval.new(127).should be_an_instance_of MusicIR::Interval
    end
    it "raise an error on integers < -127" do
      expect { MusicIR::Interval.new(-128) }.to raise_error(ArgumentError)
    end
    it "raise an error on integers > 127" do
      expect { MusicIR::Interval.new(128) }.to raise_error(ArgumentError)
    end
  end

  context "num_values" do
    it "should return 255" do
      MusicIR::Interval.num_values.should == 255
    end
  end

  context "calculate" do
    it "should return a new Interval" do
      p1 = MusicIR::Pitch.new(0)
      p2 = MusicIR::Pitch.new(10)
      MusicIR::Interval.calculate(p1, p2).should be_an_instance_of MusicIR::Interval
    end
    it "should calculate the difference between the first pitch and the second pitch" do
      p1 = MusicIR::Pitch.new(0)
      p2 = MusicIR::Pitch.new(10)
      MusicIR::Interval.calculate(p1, p2).val.should equal 10
    end
  end

  context "val" do
    it "should get the value of the interval" do
      p = MusicIR::Interval.new(10)
      p.val.should equal 10
    end
  end

  context "set_val" do
    it "should set the value of the interval" do
      p = MusicIR::Interval.new(10)
      p.set_val(5)
      p.val.should equal 5
    end
  end

  context "similarity_to" do
    it "should return 0.0 when compared to nil" do
      i1 = MusicIR::Interval.new(1)
      i1.similarity_to(nil).should be_within(0.01).of(0.0)
    end
    it "should return 0.0 when compared to a radically different interval" do
      i1 = MusicIR::Interval.new(0)
      i2 = MusicIR::Interval.new(10)
      i1.similarity_to(i2).should be_within(0.01).of(0.0)
    end
    it "should return 1.0 when compared to itself" do
      i1 = MusicIR::Interval.new(1)
      i2 = MusicIR::Interval.new(1)
      i1.similarity_to(i2).should be_within(0.01).of(1.0)
    end
  end

end
