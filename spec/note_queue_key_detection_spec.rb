#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::NoteQueue do
  describe ".analyze_harmony!" do
    before(:all) do
	vector = [ MusicIR::NoteOnEvent.new({  :pitch => 71, :velocity => 96, :timestamp => 3072}),
			MusicIR::NoteOffEvent.new({ :pitch => 71, :velocity => 0, :timestamp => 4096}),
			MusicIR::NoteOnEvent.new({  :pitch => 71, :velocity => 96, :timestamp => 4096}),
			MusicIR::NoteOffEvent.new({ :pitch => 71, :velocity => 0, :timestamp => 5120}),
			MusicIR::NoteOnEvent.new({  :pitch => 73, :velocity => 96, :timestamp => 5120}),
			MusicIR::NoteOffEvent.new({ :pitch => 73, :velocity => 0, :timestamp => 6144}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 6144}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 7168}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 7168}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 8192}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 8192}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 11264}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 11264}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 12288}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 12288}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 13312}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 13312}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 14336}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 14336}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 15360}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 15360}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 16384}),
			MusicIR::NoteOnEvent.new({  :pitch => 73, :velocity => 96, :timestamp => 16384}),
			MusicIR::NoteOffEvent.new({ :pitch => 73, :velocity => 0, :timestamp => 19456}),
			MusicIR::NoteOnEvent.new({  :pitch => 73, :velocity => 96, :timestamp => 19456}),
			MusicIR::NoteOffEvent.new({ :pitch => 73, :velocity => 0, :timestamp => 20480}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 20480}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 21504}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 21504}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 22528}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 22528}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 23552}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 23552}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 24576}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 24576}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 26624}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 26624}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 27648}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 27648}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 28672}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 28672}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 29696}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 29696}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 30720}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 30720}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 31744}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 31744}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 32768}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 32768}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 34816}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 34816}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 35840}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 35840}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 36864}),
			MusicIR::NoteOnEvent.new({  :pitch => 81, :velocity => 96, :timestamp => 36864}),
			MusicIR::NoteOffEvent.new({ :pitch => 81, :velocity => 0, :timestamp => 37888}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 37888}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 38912}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 38912}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 39936}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 39936}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 40960}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 40960}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 43008}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 43008}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 44032}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 44032}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 45056}),
			MusicIR::NoteOnEvent.new({  :pitch => 78, :velocity => 96, :timestamp => 45056}),
			MusicIR::NoteOffEvent.new({ :pitch => 78, :velocity => 0, :timestamp => 46080}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 46080}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 47104}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 47104}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 48128}),
			MusicIR::NoteOnEvent.new({  :pitch => 76, :velocity => 96, :timestamp => 48128}),
			MusicIR::NoteOffEvent.new({ :pitch => 76, :velocity => 0, :timestamp => 48640}),
			MusicIR::NoteOnEvent.new({  :pitch => 74, :velocity => 96, :timestamp => 48640}),
			MusicIR::NoteOffEvent.new({ :pitch => 74, :velocity => 0, :timestamp => 49152}),
			MusicIR::NoteOnEvent.new({  :pitch => 73, :velocity => 96, :timestamp => 49152}),
			MusicIR::NoteOffEvent.new({ :pitch => 73, :velocity => 0, :timestamp => 51200}),
			MusicIR::NoteOnEvent.new({  :pitch => 71, :velocity => 96, :timestamp => 51200}),
			MusicIR::NoteOffEvent.new({ :pitch => 71, :velocity => 0, :timestamp => 52224}) ]

      event_queue = MusicIR::EventQueue.new
      vector.each { |e| event_queue.enqueue e } 
      @notes = MusicIR::NoteQueue.from_event_queue(event_queue)
      @notes.analyze_harmony!
    end

    subject { @notes }

    it "should set a key for each note" do
      subject.all?{ |note| note.analysis[:key].class == MusicIR::Chord }.should be_true
    end

    it "should set the right key for the first  note" do
      subject.first.analysis[:key].to_s.should == "Dmajor"
    end

    it "should set a harmonic context for each note" do
      subject.all?{ |note| note.analysis[:chord].class == MusicIR::Chord }.should be_true
    end

    it "should set the right chord for the first note" do
      subject.first.analysis[:chord].to_s.should == "Bminor"
    end
  end
end
