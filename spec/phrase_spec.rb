#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::Phrase do
  let(:nq) { $phrasing_vectors["Bring back my bonnie to me"][:note_queue] }

  describe ".new" do
    context "if the indices are in bounds" do
      subject { MusicIR::Phrase.new(nq, idx1=2, idx2=8) }
      it { should be_a MusicIR::Phrase }
    end
    context "if the indices are out of bounds" do
      it "should raise an error" do
        expect { MusicIR::Phrase.new(nq, idx1=-1, idx2=8) }.to raise_error
      end
      it "should raise an error" do
        expect { MusicIR::Phrase.new(nq, idx1=1, idx2=nq.length) }.to raise_error
      end
    end
    context "if the indices are out of order" do
      it "should raise an error" do
        expect { MusicIR::Phrase.new(nq, idx1=5, idx2=3) }.to raise_error
      end
    end
  end

  describe ".notes" do
    let(:idx1) { 2 }
    let(:idx2) { 8 }
    let(:p) { MusicIR::Phrase.new(nq, idx1, idx2) }
    subject { p.notes }

    it { should be_a MusicIR::NoteQueue }
    it "should return the notes included in this phrase" do
      expected_notes = nq[idx1..idx2].map{ |n| [ n.pitch.val, n.duration.val ] }
      subject.map{ |n| [ n.pitch.val, n.duration.val ] }.should == expected_notes
    end
  end

  describe ".duration" do
    let(:idx1) { 2 }
    let(:idx2) { 8 }
    let(:p) { MusicIR::Phrase.new(nq, idx1, idx2) }
    subject { p.duration }

    it { should be_a Float }
    #it { should be_a Fixnum }
    it { should == nq[idx1..idx2].map{ |x| x.duration.val }.inject(:+) }
  end

  describe ".length" do
    let(:idx1) { 2 }
    let(:idx2) { 8 }
    let(:p) { MusicIR::Phrase.new(nq, idx1, idx2) }
    subject { p.length }

    it { should be_a Fixnum }
    it { should == Array(idx1..idx2).length }
  end

  describe ".score" do
    context "given an analyzed notequeue" do
      let(:phrase_list) { MusicIR::PhraseList.new(nq) }

      before do
        phrase_list << MusicIR::Phrase.new(nq, 0, 2)
        phrase_list << MusicIR::Phrase.new(nq, 2, nq.length-1)
      end

      subject { phrase_list.first.score(phrase_list) }

      it { should be_a Float }
    end
  end

  describe ".split_at_a_big_interval" do
    context "for phrases with 0 or 1 notes" do
      let(:one_note_phrase) { MusicIR::Phrase.new(nq, idx1=2, idx2=2) }
      it "should raise an error" do
        expect { one_note_phrase.split_at_a_big_interval }.to raise_error
      end
    end
    context "for phrases with 2 or more notes" do
      let(:two_note_phrase) { MusicIR::Phrase.new(nq, idx1=2, idx2=3) }
      let(:six_note_phrase) { MusicIR::Phrase.new(nq, idx1=2, idx2=7) }

      it "should return a new phrase" do
        two_note_phrase.split_at_a_big_interval.should be_an_instance_of MusicIR::Phrase
      end
      it "should decrement its own ending index by at least 1" do
        old_end_idx = two_note_phrase.end_idx
        two_note_phrase.split_at_a_big_interval
        two_note_phrase.end_idx.should be < old_end_idx
      end
      it "should return a new phrase starting right after the newly-split current phrase" do
        p2 = six_note_phrase.split_at_a_big_interval
        six_note_phrase.end_idx.should == (p2.start_idx-1)
      end
      it "should return a new phrase ending at the end of the original phrase" do
        old_end_idx = six_note_phrase.end_idx
        p2 = six_note_phrase.split_at_a_big_interval
        p2.end_idx.should == old_end_idx
      end
    end
  end

end
