module MusicIR
  class NoteQueue
    def ratio_of_cur_and_prev_duration(note_idx)
      if (note_idx-1) >= 0
        return @notes[note_idx+0].duration.val.to_f / @notes[note_idx-1].duration.val
      else
        return nil # undefined
      end
    end

    def ratio_of_cur_and_next_duration(note_idx)
      if (note_idx+1) < @notes.length
        return @notes[note_idx+0].duration.val.to_f / @notes[note_idx+1].duration.val
      else
        return nil # undefined
      end
    end

    def is_end_of_measure?(note_idx)
      if @notes[note_idx].analysis[:beat_position] && ((note_idx+1) < @notes.length)
        cur_note_meas  = @notes[note_idx+0].analysis[:beat_position].measure
        next_note_meas = @notes[note_idx+1].analysis[:beat_position].measure
        return (next_note_meas > cur_note_meas) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_subbeat_0?(note_idx)
      if @notes[note_idx].analysis[:beat_position]
        return (@notes[note_idx].analysis[:beat_position].subbeat == 0) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_different_from_next_chord?(note_idx)
      if ((note_idx-1) >= 0) && @notes[note_idx-1].analysis[:chord] && @notes[note_idx].analysis[:chord]
        return (@notes[note_idx-1].analysis[:chord].to_s == @notes[note_idx].analysis[:chord].to_s) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def interval_after(note_idx)
      if (note_idx+1) < @notes.length
        return (@notes[note_idx+1].pitch.val - @notes[note_idx+0].pitch.val).abs
      else
        return nil # undefined
      end
    end

    def is_repeated_pitch?(note_idx)
      if (note_idx-1) >= 0
        return (@notes[note_idx-1].pitch.val == @notes[note_idx+0].pitch.val) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def is_next_chord_tonic?(note_idx)
      if ((note_idx+1) < @notes.length) && @notes[note_idx+1].analysis[:key] && @notes[note_idx+1].analysis[:chord]
        return (@notes[note_idx+1].analysis[:key].to_s == @notes[note_idx+1].analysis[:chord].to_s) ? 1 : 0
      else
        return nil # undefined
      end
    end

    def ratio_of_abs_interval_before_vs_after(note_idx)
      if ((note_idx-1) >= 0) && ((note_idx+1) < @notes.length)
        interval_before = (@notes[note_idx+0].pitch.val - @notes[note_idx-1].pitch.val).abs
        interval_after  = (@notes[note_idx+1].pitch.val - @notes[note_idx+0].pitch.val).abs
        return (interval_before+1.0) / (interval_after+1.0)
      else
        return nil # undefined
      end
    end

    def is_same_as_next_pitch?(note_idx)
      if (note_idx+1) < @notes.length
        return (@notes[note_idx+1].pitch.val == @notes[note_idx+0].pitch.val) ? 1 : 0
      else
        return nil # undefined
      end
    end
  end
end

