module MusicIR

  class MidiEvent
    attr_reader :message, :timestamp

    # message type constants
    VALID_EVENTS = [ NOTE_ON  = 144,
                     NOTE_OFF = 128,
                     KEY_SIG  = 0xFF59 ]
    META = 0xFF

    def initialize(message, timestamp)
      raise ArgumentError.new("#{message} is not a valid event}") if !VALID_EVENTS.include?(message)
      raise ArgumentError.new("timestamp must be nonnegative") if timestamp < 0
      @message   = message
      @timestamp = timestamp
    end
  end

  class NoteEvent < MidiEvent
    attr_accessor :pitch, :velocity

    def initialize(message, timestamp, pitch, velocity)
      super(message, timestamp)
      raise ArgumentError if pitch.nil?
      raise ArgumentError if velocity.nil?
      @pitch    = pitch
      @velocity = velocity
    end
  end

  class NoteOnEvent < NoteEvent
    def initialize(opts)
      return if opts.nil?
      raise ArgumentError if (opts.keys-[:pitch,:velocity,:timestamp]) != []
      super(MidiEvent::NOTE_ON, opts[:timestamp], opts[:pitch], opts[:velocity])
    end
  end

  class NoteOffEvent < NoteEvent
    def initialize(opts)
      return if opts.nil?
      raise ArgumentError if (opts.keys-[:pitch,:velocity,:timestamp]) != []
      super(MidiEvent::NOTE_OFF, opts[:timestamp], opts[:pitch], opts[:velocity])
    end
  end

  class KeySigEvent < MidiEvent
    attr_accessor :num_flats, :is_major

    # FF 59 02 sf mi 
    def initialize(opts)
      return if opts.nil?
      raise ArgumentError if (opts.keys-[:num_flats,:is_major,:timestamp]) != []
      super(MidiEvent::KEY_SIG, opts[:timestamp])
      @num_flats = opts[:num_flats]
      @is_major  = (opts[:is_major] == 0)
    end
  end

end
