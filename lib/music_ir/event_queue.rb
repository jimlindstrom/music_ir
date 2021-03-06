#!/usr/bin/env ruby

module MusicIR

  class EventQueue < Array
    def clear
      while !empty?
        a=pop
      end
    end

    def enqueue(e)
      raise ArgumentError, "MusicIR::EventQueue only accepts MusicIR::Event items" if !e.is_a?(MusicIR::MidiEvent)
      push(e)
    end

    def get_pitches
      select{|x| x.message==MusicIR::MidiEvent::NOTE_ON }.map{|x| x.pitch }
    end

    def get_interonset_intervals
      return select{|x| x.message==MusicIR::MidiEvent::NOTE_ON }.map{|x| x.timestamp }.each_cons(2).map{ |a,b| b-a }
    end

    def get_last_duration
      last_note_on = select{ |x| x.message==MusicIR::MidiEvent::NOTE_ON}.last
      last_note_off = select{ |x| (x.message==MusicIR::MidiEvent::NOTE_OFF) && (x.pitch==last_note_on.pitch) }.last

      return last_note_off.timestamp - last_note_on.timestamp
    end

    def get_durations
      durations = []

      self.each_with_index do |e1, idx|
        if e1.message==MusicIR::MidiEvent::NOTE_ON
          e2=self[idx..-1].find{ |x| x.message==MusicIR::MidiEvent::NOTE_OFF and x.pitch==e1.pitch }
          durations.push e2.timestamp - e1.timestamp
        end
      end

      return durations
    end
  end

end

