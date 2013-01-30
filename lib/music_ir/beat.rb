#!/usr/bin/env ruby

module MusicIR

  $beat_similarity_cache = { }
  
  class Beat
    attr_accessor :prev_note, :cur_note # FIXME: why are these accessible?
  
    def hash_key # FIXME: why isn't this private?
      key = ""

      if @prev_note.nil?
        key += "nil"
      elsif @prev_note.class == MusicIR::Rest
        key += "Rest"
      else
        key += "#{@prev_note.pitch.val}"
      end

      if @cur_note.class == MusicIR::Rest
        key += ",Rest:#{@cur_note.duration.val}"
      else
        key += ",#{@cur_note.pitch.val}:#{@cur_note.duration.val}"
      end

      return key
    end
   
    def similarity_to(b) # returns 1 for identical; 0 for totally different
      return 0.00 if b.nil?

      # see if we've already cached this
      cache_key = self.hash_key + ";" + b.hash_key
      return $beat_similarity_cache[cache_key] if !$beat_similarity_cache[cache_key].nil?

      # get similarity
      beat_similarity = @cur_note.similarity_to b.cur_note

      # store it to the cache
      $beat_similarity_cache[cache_key] = beat_similarity
      return beat_similarity
    end
  
  end

end
