# midi_in_port_spec.rb

require 'spec_helper'

#describe MusicIR::InPort, :midi_tests => true do
#  
#  before(:each) do
#    MusicIR::Loopback.create
#  end
#  
#  after(:each) do
#    @inport.close if !@inport.nil?
#    @inport = nil if !@inport.nil?
#    @outport.close if !@outport.nil?
#    @outport = nil if !@outport.nil?
#
#    MusicIR::Loopback.destroy
#  end
#   
#  describe "#initialize" do
#    it "throws an error if you specify an invalid midi port" do
#      @clock = MusicIR::Clock.new(0)
#      expect { @inport = MusicIR::InPort.new("Invalid MIDI port", @clock) }.to raise_error(ArgumentError)
#    end
#
#    it "succeeds if you specify a valid midi port" do
#      @clock = MusicIR::Clock.new(0)
#      @inport = MusicIR::InPort.new("VirMIDI 1-1", @clock)
#      @inport.nil?.should be_false
#    end
#  end
#
#  describe "#blocking_read" do
#    it "waits until a single event is received, and then returns it" do
#      Thread.abort_on_exception = true
#      @clock = MusicIR::Clock.new(0)
#      @inport = MusicIR::InPort.new("VirMIDI 1-1", @clock)
#      @outport = MusicIR::OutPort.new("VirMIDI 1-0")
#      @reading=false
#      @thread_id = Thread.new do
#        while !@reading do 
#          sleep 0.1 
#        end
#        sleep 0.2
#        @event = MusicIR::NoteOnEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#        sleep 0.1
#        @event = MusicIR::NoteOffEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#      end
#      @reading=true
#      @evt = @inport.blocking_read
#      @evt.message == MusicIR::Event::NOTE_ON
#      @thread_id.join
#    end
#
#    it "sets the midi clock, upon receiving the first event" do
#      Thread.abort_on_exception = true
#      @clock = MusicIR::Clock.new(0)
#      @inport = MusicIR::InPort.new("VirMIDI 1-1", @clock)
#      @outport = MusicIR::OutPort.new("VirMIDI 1-0")
#      @reading=false
#      @thread_id = Thread.new do
#        while !@reading do 
#          sleep 0.1 
#        end
#        sleep 0.05
#        @event = MusicIR::NoteOnEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#        sleep 0.05
#        @event = MusicIR::NoteOffEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#      end
#      @reading=true
#      @evt = @inport.blocking_read
#      @clock.is_ready?.should be_true
#      @thread_id.join
#    end
#  end
#
#  describe "#read_with_timeout" do
#    it "returns nil if no event comes before the timeout" do
#      @clock = MusicIR::Clock.new(0)
#      @inport = MusicIR::InPort.new("VirMIDI 1-1", @clock)
#      @outport = MusicIR::OutPort.new("VirMIDI 1-0")
#      @evt = @inport.read_with_timeout
#      @evt.should == nil
#    end
#
#    it "reads an event if it occurs before the timeout" do
#      Thread.abort_on_exception = true
#      @clock = MusicIR::Clock.new(0)
#      @inport = MusicIR::InPort.new("VirMIDI 1-1", @clock)
#      @outport = MusicIR::OutPort.new("VirMIDI 1-0")
#      @reading=false
#      @thread_id = Thread.new do
#        while !@reading do 
#          sleep 0.1 
#        end
#        sleep 0.2
#        @event = MusicIR::NoteOnEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#        sleep 0.1
#        @event = MusicIR::NoteOffEvent.new({:pitch=>100, :velocity=>100, :timestamp=>0})
#        @outport.write(@event)
#      end
#      @reading=true
#      @evt = @inport.read_with_timeout
#      @evt.message == MusicIR::Event::NOTE_ON
#      @thread_id.join
#    end
#  end
#
#end
