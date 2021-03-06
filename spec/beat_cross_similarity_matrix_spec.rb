#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::BeatCrossSimilarityMatrix do
  context "new" do
    before(:each) do
      vector = $phrasing_vectors["Bring back my bonnie to me"]
      nq = vector[:note_queue]
      @beat_array1 = nq.to_beat_array
  
      vector = $phrasing_vectors["This train is bound for glory"]
      nq = vector[:note_queue]
      @beat_array2 = nq.to_beat_array
    end
    it "should take two beat arrays and return a cross similarity matrix" do
      MusicIR::BeatCrossSimilarityMatrix.new(@beat_array1, @beat_array2).should be_an_instance_of MusicIR::BeatCrossSimilarityMatrix
    end
    it "should take two beat arrays (possibly containing rests) and return a cross similarity matrix" do
      notes = []
      notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
      notes << MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(2))
      notes << MusicIR::Rest.new(                     MusicIR::Duration.new(1))
      @beat_array1 = MusicIR::NoteQueue.new(notes).to_beat_array

      MusicIR::BeatCrossSimilarityMatrix.new(@beat_array1, @beat_array1).should be_an_instance_of MusicIR::BeatCrossSimilarityMatrix
    end
  end

  context "max_arithmetic_mean_of_diag" do

    context "this train" do
      before(:all) do
        @vector = $phrasing_vectors["This train is bound for glory"]
        @nq = @vector[:note_queue]

        @correct_pl = MusicIR::PhraseList.new(@nq)
        @vector[:phrase_boundaries].each do |p|
          @correct_pl.push MusicIR::Phrase.new(@nq, p[:start_idx], p[:end_idx])
        end

        @incorrect_pl = MusicIR::PhraseList.new(@nq)
        @incorrect_pl.push MusicIR::Phrase.new(@nq, 10, 16)
        @incorrect_pl.push MusicIR::Phrase.new(@nq, 12, 18)
        @incorrect_pl.push MusicIR::Phrase.new(@nq, 17, 25)
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (this train 1)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[0].notes).to_beat_array
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[1].notes).to_beat_array
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[0].notes).to_beat_array
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (this train 2)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[0].notes).to_beat_array
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[3].notes).to_beat_array
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[1].notes).to_beat_array
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (this train 3)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[1].notes).to_beat_array
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[3].notes).to_beat_array
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[2].notes).to_beat_array
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end
    end

    context "somewhere over" do
      before(:all) do
        @vector = $phrasing_vectors["Somewhere over the rainbow"]
        @nq = @vector[:note_queue]

        @correct_pl = MusicIR::PhraseList.new(@nq)
        @vector[:phrase_boundaries].each do |p|
          @correct_pl.push MusicIR::Phrase.new(@nq, p[:start_idx], p[:end_idx])
        end

        @incorrect_pl = MusicIR::PhraseList.new(@nq)
        @incorrect_pl.push MusicIR::Phrase.new(@nq,  1,  7)
        @incorrect_pl.push MusicIR::Phrase.new(@nq,  9, 11)
        @incorrect_pl.push MusicIR::Phrase.new(@nq, 12, 22)
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (somewhere 1)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[0].notes).to_beat_array
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[2].notes).to_beat_array
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[0].notes).to_beat_array
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (somewhere 2)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[0].notes).to_beat_array
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[3].notes).to_beat_array
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[1].notes).to_beat_array
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end

      it "should return >= 20% higher similarity for real phrases than for fake phrases (somewhere 3)" do
        beat_array1 = MusicIR::NoteQueue.new(  @correct_pl[0].notes).to_beat_array #   7- 9
        beat_array2 = MusicIR::NoteQueue.new(  @correct_pl[2].notes).to_beat_array #  10-16
        beat_array3 = MusicIR::NoteQueue.new(@incorrect_pl[2].notes).to_beat_array #  12-21
  
        m12 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array1, beat_array2)
        m23 = MusicIR::BeatCrossSimilarityMatrix.new(beat_array2, beat_array3)
  
        s12 = m12.max_arithmetic_mean_of_diag 
        s23 = m23.max_arithmetic_mean_of_diag 
  
        s12.should be >= 1.20*s23
      end
    end

  end

end
