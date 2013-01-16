#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::Note do
  before do
  end

  context "new" do
    it "should take a pitch and a duration" do
      MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)).should be_an_instance_of MusicIR::Note
    end
  end

  context "pitch" do
    it "should return the pitch it was created with" do
      pitch_val = 10
      n = MusicIR::Note.new(MusicIR::Pitch.new(pitch_val), MusicIR::Duration.new(0))
      n.pitch.val.should be pitch_val
    end
  end

  context "duration" do
    it "should return the duration it was created with" do
      duration_val = 10
      n = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(duration_val))
      n.duration.val.should be duration_val
    end
  end

  context "analysis" do
    it "should return a hash that can be extended with whatever values critics want" do
      n = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(3))
      n.analysis.should be_an_instance_of Hash
    end
  end

end
