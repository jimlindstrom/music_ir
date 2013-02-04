# MusicIR

MusicIR is a music information retrieval package for ruby. Its key features are:

* Quantizing MIDI performances ("snapping" them to its best guess at eighth notes, quarter notes, etc)
* Estimating the meter (time signature) of a phrase
* Estimating the harmonic context (the implied chords, the underlying key) of a phrase
* Estimating the phrasing of a piece.

Current limitations:

* Only represents a single stream of notes
* Does not fully handle rests yet. (Some methods assume legato, back-to-back notes.)

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

    include MusicIR
    
    # define some pitch values
    PG4  =        67
    PA4  =        69
    PB4  =        71
    PC5  =        72
    PD5  =        74
    
    # first phrase of Bach's Minuet in G
    notes = []
    notes << Note.new(Pitch.new(PD5), Duration.new(2))
    notes << Note.new(Pitch.new(PG4), Duration.new(1))
    notes << Note.new(Pitch.new(PA4), Duration.new(1))
    notes << Note.new(Pitch.new(PB4), Duration.new(1))
    notes << Note.new(Pitch.new(PC5), Duration.new(1))
    notes << Note.new(Pitch.new(PD5), Duration.new(2))
    notes << Note.new(Pitch.new(PG4), Duration.new(2))
    notes << Note.new(Pitch.new(PG4), Duration.new(2))
    nq = NoteQueue.new(notes)

    if nq.meter # because sometimes the meter is ambiguous
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

### Meter Estimation

MusicIR estimates a NoteQueue's meter by performing an autocorrelation on the phrase. The resulting vector
is compared against reference vectors for every supported meter. (These were generated by taking the mean
of vectors with known meters, including both Bach chorale melodies and the melodies of a set of folk songs.)
The similarity between vectors is multiplied by prior probabilities for each meter (based on the same data
set). Whichever meter has the highest resulting "likelihood" (using the term fairly un-rigorously) is
returned. Further processing, based on a beat similarity matrix, is then done to align the notes to beats, 
given the estimated meter.

### Key Estimation

MusicIR can estimated both NoteQueue's key, and the chords implied by each note. To do this, it uses a hidden
markov model (HMM). The observable outputs of the model are pitches. The hidden states of the model are the 
pitches' underlying/implied chords (24 of them. 12 pitch classes. Major and minor versions of each). Given some
statistics about the probability of a chord occurring in a given key, and about the probability of one chord
transitioning to another (both these sets of stats come from: <http://research.microsoft.com/en-us/um/people/dan/chords/>),
and given some stats about the probability of a melody note occurring in the context of a certain chord in a certain
key (made up. but good enough.), the HMM picks the key and implied chords that maximize the likelihood of observing
the given set of melody notes. The HMM implementation is: <https://github.com/dtkirsch/hmm>.

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
