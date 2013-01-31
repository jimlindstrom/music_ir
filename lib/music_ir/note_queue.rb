#!/usr/bin/env ruby

module MusicIR
  
  class NoteQueue < Array
    LOGGING = false

    include CanDetectMeter
    include CanDetectPhrases
    include CanDetectKey
  
    def self.from_event_queue(evq)
      iois = evq.get_interonset_intervals + [ evq.get_last_duration ]
      ioi_array = MusicIR::IOIArray.new(iois.dup)
      q_ret = ioi_array.quantize!
  
      notes = NoteQueue.new
      notes.tempo = q_ret[:q]

      iois.zip(evq.get_durations).zip(evq.get_pitches).map{|x| x.flatten}.each do |ioi, duration, pitch|
        note_dur = (duration         / q_ret[:q]).round
        rest_dur = ((ioi - duration) / q_ret[:q]).round

        if note_dur < 0 or note_dur >= Duration.num_values
          puts "can't convert event queue to note queue due to bogus ioi: #{note_dur}"
          return nil 
        elsif pitch < 0 or pitch >= Pitch.num_values
          puts "can't convert event queue to note queue due to bogus pitch: #{pitch}"
          return nil 
        else
          notes.push Note.new(Pitch.new(pitch), Duration.new(note_dur))
        end

        next if rest_dur < 1

        if rest_dur < 0 or rest_dur >= Duration.num_values
          puts "can't convert event queue to note queue due to bogus ioi: #{rest_dur}"
          return nil 
        else
          notes.push Rest.new(Duration.new(rest_dur))
        end
      end
      
      return notes
    end
  
    def to_event_queue
      raise ArgumentError.new("tempo must be set") if @tempo.nil? 

      duration_to_timestamp = 60.0 / @tempo * 200.0
  
      eq = MusicIR::EventQueue.new
      timestamp = 0
      self.each do |note|
        case note
          when MusicIR::Note
            eq.enqueue MusicIR::NoteOnEvent.new({
                         :pitch     => note.pitch.val,
                         :velocity  => 100,
                         :timestamp => timestamp })
      
            timestamp += note.duration.val * duration_to_timestamp
            eq.enqueue MusicIR::NoteOffEvent.new({
                         :pitch     => note.pitch.val,
                         :velocity  => 100,
                         :timestamp => timestamp })
          when MusicIR::Rest
            timestamp += note.duration.val * duration_to_timestamp
          else
            raise RuntimeError.new("unexpected class: #{note.class}")
        end
  
      end 
  
      return eq
    end
  
    def beat_array
      beats = []
      prev = nil
      self.each do |note|
        b = MusicIR::Beat.new
        b.prev_note = prev
        b.cur_note = note
        beats.push b
  
        (note.duration.val-1).times do
          beats.push nil
        end
  
        prev = note
      end
      return beats
    end

    def analyze!
      return if !@have_done_analysis.nil?    
      @have_done_analysis = true
  
      tag_with_notes_left
      create_intervals
    end

    def ratio_of_cur_and_prev_duration(note_idx)
      if (note_idx-1) >= 0
        return self[note_idx+0].duration.val.to_f / self[note_idx-1].duration.val
      else
        return nil # undefined
      end
    end

    def ratio_of_cur_and_next_duration(note_idx)
      if (note_idx+1) < self.length
        return self[note_idx+0].duration.val.to_f / self[note_idx+1].duration.val
      else
        return nil # undefined
      end
    end

    def is_end_of_measure?(note_idx)
      if self[note_idx].analysis[:beat_position] && ((note_idx+1) < self.length)
        cur_note_meas  = self[note_idx+0].analysis[:beat_position].measure
        next_note_meas = self[note_idx+1].analysis[:beat_position].measure
        return (next_note_meas > cur_note_meas) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_subbeat_0?(note_idx)
      if self[note_idx].analysis[:beat_position]
        return (self[note_idx].analysis[:beat_position].subbeat == 0) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_different_from_next_chord?(note_idx)
      if ((note_idx-1) >= 0) && self[note_idx-1].analysis[:chord] && self[note_idx].analysis[:chord]
        return (self[note_idx-1].analysis[:chord].to_s == self[note_idx].analysis[:chord].to_s) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def interval_after(note_idx)
      if (note_idx+1) < self.length
        return (self[note_idx+1].pitch.val - self[note_idx+0].pitch.val).abs
      else
        return nil # undefined
      end
    end

    def is_repeated_pitch?(note_idx)
      if (note_idx-1) >= 0
        return (self[note_idx-1].pitch.val == self[note_idx+0].pitch.val) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_next_chord_tonic?(note_idx)
      if ((note_idx+1) < self.length) && self[note_idx+1].analysis[:key] && self[note_idx+1].analysis[:chord]
        return (self[note_idx+1].analysis[:key].to_s == self[note_idx+1].analysis[:chord].to_s) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def ratio_of_abs_interval_before_vs_after(note_idx)
      if ((note_idx-1) >= 0) && ((note_idx+1) < self.length)
        interval_before = (self[note_idx+0].pitch.val - self[note_idx-1].pitch.val).abs
        interval_after  = (self[note_idx+1].pitch.val - self[note_idx+0].pitch.val).abs
        return (interval_before+1.0) / (interval_after+1.0)
      else
        return nil # undefined
      end
    end

    def is_same_as_next_pitch?(note_idx)
      if (note_idx+1) < self.length
        return (self[note_idx+1].pitch.val == self[note_idx+0].pitch.val) ? 1 : 0
      else
        return nil # undefined
      end
    end

  private
  
    def tag_with_notes_left
      self.each_with_index do |item, idx|
        item.analysis[:notes_left] = self.length - 1 - idx
      end
    end

    def create_intervals
      prev = nil
      self.each do |cur|
        if !prev.nil?
          i = MusicIR::Interval.calculate(prev.pitch, cur.pitch)
          prev.analysis[:interval_after] = i
          cur.analysis[:interval_before] = i

          di = MusicIR::DistanceInterval.new(prev, cur)
          prev.analysis[:distance_interval_after] = di
          cur.analysis[:distance_interval_before] = di
        end
        prev = cur
      end
    end


  end

end

