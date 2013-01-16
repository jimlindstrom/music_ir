# beat_position_spec.rb

require 'spec_helper'

describe MusicIR::DurationAndBeatPosition do

  before(:each) do
    @bp = MusicIR::BeatPosition.new
    @bp.measure = nil
    @bp.beat    = 2
    @bp.subbeat = 3
    @bp.beats_per_measure = 4
    @bp.subbeats_per_beat = 4

    @d = MusicIR::Duration.new(3)
  end

  context "num_values" do
    it "should return 202752" do
      MusicIR::DurationAndBeatPosition.num_values.should == MusicIR::Duration.num_values*MusicIR::BeatPosition.num_values
    end
  end

  context "beat_position" do
    it "should return whatever you set it to" do
      dbp = MusicIR::DurationAndBeatPosition.new(@d, @bp)
      dbp.beat_position.to_hash.should == @bp.to_hash
    end
  end

  context "duration" do
    it "should return whatever you set it to" do
      dbp = MusicIR::DurationAndBeatPosition.new(@d, @bp)
      dbp.duration.val.should == @d.val
    end
  end

end
