# beat_spec.rb

require 'spec_helper'

describe MusicIR::Beat do
  describe ".similarity_to" do
    before(:all) do
      n0 = MusicIR::Note.new(MusicIR::Pitch.new(50), MusicIR::Duration.new(1))
      n1 = MusicIR::Note.new(MusicIR::Pitch.new(52), MusicIR::Duration.new(2))
      @b = MusicIR::Beat.new
      @b.prev_note = n0
      @b.cur_note  = n1
    end

    it "should return 1.0 when compared to itself" do
      @b.similarity_to(@b).should be_within(0.01).of(1.0)
    end
    it "should return 0.0 when compared to nil" do
      @b.similarity_to(nil).should be_within(0.01).of(0.0)
    end
    it "should return > 0.0 when compared to a rest of the same duration" do
      n0 = MusicIR::Note.new(MusicIR::Pitch.new(100), MusicIR::Duration.new(2))
      r  = MusicIR::Rest.new(                       MusicIR::Duration.new(2))
      @b2 = MusicIR::Beat.new
      @b2.prev_note = n0
      @b2.cur_note  = r
      @b.similarity_to(@b2).should be > 0.0
    end
    it "should return 0.0 when compared to a radically different beat" do
      n0 = MusicIR::Note.new(MusicIR::Pitch.new(100), MusicIR::Duration.new( 2))
      n1 = MusicIR::Note.new(MusicIR::Pitch.new( 10), MusicIR::Duration.new(20))
      @b2 = MusicIR::Beat.new
      @b2.prev_note = n0
      @b2.cur_note  = n1

      @b.similarity_to(@b2).should be_within(0.01).of(0.0)
    end
  end
end
