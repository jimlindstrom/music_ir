module MusicIR
  
  class NoteQueue
    def length;                 @notes.length;                 end

    def first;                  @notes.first;                  end
    def last;                   @notes.last;                   end
    def [](idx);                @notes[idx];                   end

    def each_with_index(&blk);  @notes.each_with_index(&blk);  end
    def each(&blk);             @notes.each(&blk);             end
    def map(&blk);              @notes.map(&blk);              end
    def select(&blk);           @notes.select(&blk);           end

    def none?(&blk);            @notes.none?(&blk);            end
    def all?(&blk);             @notes.all?(&blk);             end
    def any?(&blk);             @notes.any?(&blk);             end
  end

end

