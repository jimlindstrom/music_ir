# MusicIR

MusicIR is a music information retrieval package for ruby. You can represent a single stream of notes (multiple streams coming eventually) and then perform meter detection and phrase detection, calculate beat similarity matrices, etc.

## Installation

Add this line to your application's Gemfile:

    gem 'music_ir'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install music_ir

## Usage

Here's an example of detecting the a phrase's meter:

    require 'music_ir'
    
    # define some pitch values
    PG4  =        67
    PA4  =        69
    PB4  =        71
    PC5  =        72
    PD5  =        74
    
    # first phrase of Bach's Minuet in G
    nq = MusicIR::NoteQueue.new
    nq.tempo = 80
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2))
    nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2))

    if nq.detect_meter
      puts nq.meter.val # => {:beats_per_measure=>2, :beat_unit=>4, :subbeats_per_beat=>1}
      puts nq.first.analysis[:beat_position].to_hash.inspect # => {:measure=>0, :beat=>0, :subbeat=>0}
    end
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## More Details on Implementation

### Beat Detection

MusicIR does beat detection by calculating a song's Beat Similarity Matrix (see <http://scholar.google.com/scholar?q=beat+similarity+matrix>).
BSMs are similar to autocorrelation.  Where autocorrelation works on a list of scalars, similarity matrices 
work on a list of complex features (i.e. vectors).  First, you define a similarity function for each vector 
element (pitch, duration, inteval, etc).  You can use this to define a function that compares the similarity 
of any two beats.  Finally, using that function, you can generate a 2D matrix of the similarity of each beat 
to every other beat.  The strength of a given periodicity at various beat period (2 beats, 3 beats, etc) can 
be computed as the sum of the diagonal that many beats from the main diagnoal.

In addition to being a fairly effective means of detecting a fragment's time signature, beat similarity
matrices are interesting as visualizations of rhythmic structure in songs:
<http://jimlindstrom.github.com/InteractiveMidiImproviser/>
