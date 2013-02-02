$meter_vectors = {}
$phrasing_vectors = {}

###############################################################################
# MusicIR::Notes
###############################################################################

PFs3 = PGb3 = 54
PG3  =        55
PGs3 = PAb3 = 56
PA3  =        57
PAs3 = PBb3 = 58
PB3  =        59

PC4  =        60
PCs4 = PDb4 = 61
PD4  =        62
PDs4 = PEb4 = 63
PE4  =        64
PF4  =        65
PFs4 = PGb4 = 66
PG4  =        67
PGs4 = PAb4 = 68
PA4  =        69
PAs4 = PBb4 = 70
PB4  =        71

PC5  =        72
PCs5 = PDb5 = 73
PD5  =        74
PDs5 = PEb5 = 75
PE5  =        76
PF5  =        77
PFs5 =        78
PG5  =        79

###############################################################################
# My Bonnie Lies Over The Ocean
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			0		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		3

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # o-			4	
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # -ver		5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		6

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # o-			7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(4)) # -cean		8		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			9		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		12

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # o-			13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # -ver		14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # the		15

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(5)) # sea		16		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			17		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		20

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # o-			21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # -ver		22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		23

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # o-			24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(4)) # -cean		25		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # so			26		++
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # bring		27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # back		28
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # my			29

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		30
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			32

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(6)) # me			33		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # bring		34		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # back		35

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # bring		36

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # back		37		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # oh			38		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bring		39
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # back		40
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # my			41
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		42
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		43
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			44
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # me,		45
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # to			46
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # me			47		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # bring		48		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # back		49

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # bring		50

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # back		51		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # oh			52		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bring		53
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # back		54
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # my			55
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		56
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		57
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			58
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(6)) # me			59		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 80

m = MusicIR::Meter.new(3, 4, 1) # 3/4 time, quarter note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: beat 3 
b.subbeat     = 0 # 0-based: first subbeat
b.beats_per_measure = 3 # 0-based: beat 3 
b.subbeats_per_beat = 1 # 0-based: first subbeatision

$meter_vectors["Bring back my bonnie to me"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 25 })
phrases.push({ :start_idx => 26, :end_idx => 33 })
phrases.push({ :start_idx => 34, :end_idx => 37 })
phrases.push({ :start_idx => 38, :end_idx => 47 })
phrases.push({ :start_idx => 48, :end_idx => 51 })
phrases.push({ :start_idx => 52, :end_idx => 59 })

$phrasing_vectors["Bring back my bonnie to me"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }



###############################################################################
# Battle Hymn of the Republic
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # mine		 0		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # eyes		 1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # have		 2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # seen		 3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(1)) # the		 4
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # glo-		 5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # -ry		 6
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # of			 7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # the		 8

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # com-		 9
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # -ing		10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # of			11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # the		12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # lord;		13		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # he			14		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # is			15

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # tramp-		16
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -ling		17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # out		18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # the		19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # vint-		20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # -age		21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # where		22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		23

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # grapes		24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # of			25
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # wrath		26
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(1)) # are		27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(4)) # stor'd;	28		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # he			29		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # hath		30

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # loosed		31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # the		32
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # fate-		33
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(1)) # -ful		34
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # light-		35
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # -ning		36
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # of			37
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # his		38

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # ter-		39
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # -ri-		40
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # -ble		41
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # swift		42
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # sword;		43		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # his		44		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(4)) # truth		45
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(4)) # is			46
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # march-		47
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(4)) # -ing		48

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(16)) # on		49		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 100

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: beat 4 
b.subbeat     = 3 # 0-based: last subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # 4th of quarter notes

$meter_vectors["Battle hymn of the republic"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 28 })
phrases.push({ :start_idx => 29, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 49 })

$phrasing_vectors["Battle hymn of the republic"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Bach - Minuet in G
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2))		#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		#  3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		#  4
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) 		#  5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		#  6
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		#  7	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(2)) 		#  8	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		#  9
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) 		# 10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) 		# 11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs5),MusicIR::Duration.new(1)) 		# 12
  
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new(2)) 		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		# 14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		# 15	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) 		# 16	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) 		# 17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		# 18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1))		# 20	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) 		# 21	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		# 22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		# 24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 25	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new(2)) 		# 26	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		# 28
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 29
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 30

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(6))		# 31	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 80

m = MusicIR::Meter.new(3, 4, 2) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 3 # 3 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Bach Minuet in G"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  7 })
phrases.push({ :start_idx =>  8, :end_idx => 15 })

# Any of these continuations seems plausible:

#phrases.push({ :start_idx => 16, :end_idx => 20 })
#phrases.push({ :start_idx => 21, :end_idx => 25 })
#phrases.push({ :start_idx => 26, :end_idx => 31 })

phrases.push({ :start_idx => 16, :end_idx => 25 })
phrases.push({ :start_idx => 26, :end_idx => 31 })

#phrases.push({ :start_idx => 16, :end_idx => 20 })
#phrases.push({ :start_idx => 21, :end_idx => 25 })
#phrases.push({ :start_idx => 26, :end_idx => 30 })
#phrases.push({ :start_idx => 31, :end_idx => 31 })

$phrasing_vectors["Bach Minuet in G"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Somewhere over the rainbow
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(4)) # some-		 0		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # -where		 1

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # ov-		 2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # -er		 3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		 4
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # rain-		 5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # -bow		 6		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(4)) # way		 7		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(4)) # up			 8

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(8)) # high		 9		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new(4)) # there's	10		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(4)) # a			11

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # land		12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(1)) # that		13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(1)) # I			14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # heard		15
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(2)) # of			16		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(2)) # once		17		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new(1)) # in			18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(1)) # a			19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(2)) # lu-		20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # -la-		21

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(8)) # -by		22		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 60

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Somewhere over the rainbow"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 22 })

$phrasing_vectors["Somewhere over the rainbow"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# This train is bound for glory
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		 0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(4)) # train		 1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # is 		 2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(3)) # bound		 3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # for		 4
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # glo-		 5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ry		 6

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		 7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(14)) # train	 8	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		 9	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) # train		10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2)) # is 		11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5 ),MusicIR::Duration.new(3)) # bound		12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1)) # for		13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # glo-		14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # -ry		15

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		16
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(14)) # train	17	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		18	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) # train		19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2)) # is 		20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5 ),MusicIR::Duration.new(3)) # bound		21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1)) # for		22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # glo-		23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # -ry		24	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # don't		25	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # take		26
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # no-		27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # -thing	28
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # but		29
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # the		30
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(1)) # right-	31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(1)) # -eous		32
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # an'		33
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # the		34
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # ho-		35
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ly		36	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		37	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(4)) # train		38
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # is 		39
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(3)) # bound		40
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # for		41
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # glo-		42
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ry		43

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		44
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(14)) # train	45	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 100

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # half of quarter notes

$meter_vectors["This train is bound for glory"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 17 })

#phrases.push({ :start_idx => 18, :end_idx => 24 })
#phrases.push({ :start_idx => 25, :end_idx => 36 })
phrases.push({ :start_idx => 18, :end_idx => 36 }) # this keeps the phrase lengths the same...

phrases.push({ :start_idx => 37, :end_idx => 45 })

$phrasing_vectors["This train is bound for glory"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Bach Minuet (2)
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2)) 	#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  2

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2))		#  3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		#  4
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		#  5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(2))		#  6	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(2)) 	#  7	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(2))		#  9

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) 	# 10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(2))		# 11	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		# 12	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(1))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		# 14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		# 15
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(1))		# 16	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2))		# 17	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(1))		# 18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		# 19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(1))		# 21	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(2))		# 22	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1))		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4  ),MusicIR::Duration.new(1))		# 24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(2))		# 25

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(6)) 	# 26	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 50

m = MusicIR::Meter.new(3, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 3 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Bach Minuet (2)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 21 })
phrases.push({ :start_idx => 22, :end_idx => 26 })

$phrasing_vectors["Bach Minuet (2)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

###############################################################################
# Amazing Grace
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  1

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  4

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  5	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  6	++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		#  7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  8

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 4))		#  9	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 10	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 11

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 14

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 15
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 16

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(10))		# 17	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 18	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 19

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 22

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 23	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 24	++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 25
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 26

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 4))		# 27	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 28	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 29

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 30
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 32

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 33
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 34

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(12))		# 35	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 50

m = MusicIR::Meter.new(3, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 1 # 0-based: second eighth note
b.beats_per_measure = 3 # 3 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Amazing Grace"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  5 })
phrases.push({ :start_idx =>  6, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 17 })
phrases.push({ :start_idx => 18, :end_idx => 23 })
phrases.push({ :start_idx => 24, :end_idx => 35 })

$phrasing_vectors["Amazing Grace"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

###############################################################################
# Ode to Joy
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  0 ++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		#  3

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		#  4
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  6
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  7

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  9
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 11

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 14 --

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 15 ++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 16
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 18

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 25
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 26

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 28
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 29 --

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 30 ++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 32
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 33

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 34
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 35
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 36
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 37
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 38

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 39
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 40
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 41
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 42
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 43

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 44
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 45
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 46 --

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 47 ++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 48
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 49
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 50

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 51
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 52
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 53
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 54

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 55
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 56
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 57
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 58

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 59
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 60
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 61 --

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 70

m = MusicIR::Meter.new(4, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eight not
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes (eighth notes)

$meter_vectors["Ode to Joy"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 14 })
phrases.push({ :start_idx => 15, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 46 })
phrases.push({ :start_idx => 47, :end_idx => 61 })

$phrasing_vectors["Ode to Joy"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Auld Lang Syne
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		#  0  ++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 1))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		#  3
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  4

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		#  5
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  6
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  9

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 12
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 13

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 14  --
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 15  ++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 16
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 19

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 24

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 25
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 1))		# 26
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 28

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 6))		# 29  --
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 30  ++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 31
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 32
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 33
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 34

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 35
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 36
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 37
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 38

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 39
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 40
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 41
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 42

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 43 --
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 44 ++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 45
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 46
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 47
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 48

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 49
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 50
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 51
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 52
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 53

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 54
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 1))		# 55
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 56
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 57

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 8))		# 58 --

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 90

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: fourth beat
b.subbeat     = 0 # 0-based: first eight note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes (eighth notes)

$meter_vectors["Auld Lang Syne"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 14 })
phrases.push({ :start_idx => 15, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 58 })

$phrasing_vectors["Auld Lang Syne"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Oh my darling, Clementine
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		#  0   In		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  1   a

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  2   ca-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		#  3   vern,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		#  4   in
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   a

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  6   can-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  7   yon,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  8   ex-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  8   ca-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		#  9   va-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 10   ting
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 11   for
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 12   a

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 13   mine,	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 14   Dwelt	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 15   a

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 16   mi-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 17   ner
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 18   for-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 19   ty

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 20   nin-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 21   er
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 22   and
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 23   his

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 24   daugh-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 25   ter,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 26   Clem-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 27   en-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 28   tine.	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 29   Oh		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 30   my

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 31   dar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 32   ling,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 33   oh
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 34   my

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 35   dar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 36   ling,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 37   oh
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 38   my

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		# 39   dar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 40   ling
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 41   Clem-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 42   en-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 43   tine,	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 44   You		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 45   are

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 6))		# 46   Lost
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 47   and
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 48   gone
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 49   for-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 50   ev-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 51   er.
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 52   Dread-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 53   ful

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 54   sor-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 55   ry,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 56   Clem-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 57   en-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 58   tine.	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 100

m = MusicIR::Meter.new(3, 4, 4) # 3/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 0 # 0-based: first eight note
b.beats_per_measure = 3 # 4 beats
b.subbeats_per_beat = 4 # quarter of quarter notes (sixteenth notes)

$meter_vectors["Clementine"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 28 })
phrases.push({ :start_idx => 29, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 58 })

$phrasing_vectors["Clementine"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# When the saints...
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  0   Oh		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  1   when
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  2   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  3   saints

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		#  4   
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  5   go
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  6   mar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  7   ching

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  8   in.	

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		#  9   			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 10   Oh		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 11   when
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 12   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 13   saints
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 14   go

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 15   mar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 16   ching

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 17   in.

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		# 18   			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 19   Oh		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 20   Lord
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 21   I

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 22   want
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 23   to

notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 24   be
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   in
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 26   that

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 27   num-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 28   ber.

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		# 29   			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 30   Oh		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 31   when
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 32   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 33   saints
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 34   go

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 35   mar-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 36   ching

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 37   in.		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 40

m = MusicIR::Meter.new(4, 4, 1) # 4/4 time, quarter note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 1 # quarter notes

$meter_vectors["When the Saints"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 37 })

$phrasing_vectors["When the Saints"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Battle Cry of Freedom
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  0   Yes			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  1   we'll

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  2   ral-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  3   ly
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		#  4   'round
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  5   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  6   flag,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		#  7   boys,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  8   we'll

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  9   ral-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 10   ly
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 11   once
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 12   a-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 13   gain.		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 14   Shout-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 15   ing
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 16   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		# 17   batt-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 18   le
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 19   cry
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 20   of

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 8))		# 21   Free-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 22   dom!			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23   We			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 24   will

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 25   ral-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 26   ly
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 27   from
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 28   hill-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 29   side
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 30   we'll

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 31   gath-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 32   er
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 33   from
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 34   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 35   plain.		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 36   Shout-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 37   ing
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 38   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		# 39   batt-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 40   le
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 41   cry
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 42   of

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 43   Free-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 44   dom!			--
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 45   				++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 46   The

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 47   Un-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 48   ion
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 49   for-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 50   ev-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		# 51   er!
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 52   Hur-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 53   ah,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 54   boys,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 55   hur-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 8))		# 56   ah!			--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 57   Down			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 58   with
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 59   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 60   trai-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 6))		# 61   tor,

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 62   Up
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 63   with
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 64   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 65   star!		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 66   While		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 67   we

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 68   ral-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 69   ly
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 70   round
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 71   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 72   flag,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 73   boys,

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 74   ral-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 75   ly
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 76   once
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 77   a-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 78   gain.		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 79   Shout-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 80   ing
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 81   the
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 82   Batt-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 83   le
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 84   cry
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 85   of

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 86   Free-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 87   dom!			--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 90

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # sixteenth notes

$meter_vectors["Battle Cry of Freedom"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 35 })
phrases.push({ :start_idx => 36, :end_idx => 44 })
phrases.push({ :start_idx => 45, :end_idx => 56 })
phrases.push({ :start_idx => 57, :end_idx => 65 })
phrases.push({ :start_idx => 66, :end_idx => 78 })
phrases.push({ :start_idx => 79, :end_idx => 87 })

$phrasing_vectors["Battle Cry of Freedom"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Yesterday (Beatles)   -- FIXME: there are some accidentals wrong, toward the end
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  0   Yes-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  1   ter-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 6))		#  2   day	

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		#  3   --		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  4   all		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   my
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		#  6   trou-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		#  7   bles
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		#  8   seem
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  9   so

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		# 10   far
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 11   a-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		# 12   way.

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 13   --		--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 14   Now		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 15   it
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 16   looks
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 17   as
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 18   though
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 19   they're

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 20   here
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 21   to
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 22   stay.	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23   Oh		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 24   I
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   be-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 26   lieve
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 27   in

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 28   yes-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 29   ter-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 5))		# 30   day.		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 50

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Yesterday (Beatles)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  3 })
phrases.push({ :start_idx =>  4, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 30 })

$phrasing_vectors["Yesterday (Beatles)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Yellow Submarine
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  0   In			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		#  1   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 5))		#  2   town
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  3   where
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  4   I
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   was

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 6))		#  6   born			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  7   lived		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  8   a

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  9   ma-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 10   a-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 11   n
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 12   who
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 13   sailed
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 14   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 15   sea;			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 16   and			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 17   he

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 5))		# 18   told
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 19   us
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 20   of
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 21   his

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 6))		# 22   life			--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 23   in			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 24   the

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   la-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 26   a-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 27   nd
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 28   of
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 29   sub-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 30   mar-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 31   ines.		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 60

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: 4th beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Yellow Submarine"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 15 })
phrases.push({ :start_idx => 16, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 31 })

$phrasing_vectors["Yellow Submarine"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Nowhere Man
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  0   He's		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  1   a
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		#  2   real

notes << MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		#  3   no-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		#  4   whe-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   re
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  6   man,
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		#  7   ..		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  8   sit-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  9   ting
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 10   in
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 11   his

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 12   no-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13   o-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 14   whe-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 15   re
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 2))		# 16   land
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 17   ..		--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 18   mak-		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 19   ing
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 20   all-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 21   ll
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22   his

notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 23   no-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 24   o-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 25   where
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 26   plans	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 27   for		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 3))		# 28   no-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 29   bod-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 30   y.
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 31   ..		

notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		# 32   ..		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 50

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Nowhere Man"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  7 })
phrases.push({ :start_idx =>  8, :end_idx => 17 })
phrases.push({ :start_idx => 18, :end_idx => 26 })
phrases.push({ :start_idx => 27, :end_idx => 32 })

$phrasing_vectors["Nowhere Man"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Ask Me Now
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		#  3 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		#  4 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		#  5 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		#  6
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		#  7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 2))		#  9 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 10 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 11 	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 2))		# 12	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 2))		# 14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 15
notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 4))		# 16
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 17

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 8))		# 18	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 19	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 2))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 2))		# 21
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 22 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs3),MusicIR::Duration.new( 2))		# 23 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 6))		# 24 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 2))		# 25
notes << MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 2))		# 26
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 27
notes << MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 1))		# 28 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 29 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 30 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 6))		# 31 	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PDb5),MusicIR::Duration.new( 2))		# 32	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 33	
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGb4),MusicIR::Duration.new( 2))		# 34
notes << MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		# 35 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 1))		# 36 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 37 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb3),MusicIR::Duration.new( 6))		# 38 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new(12))		# 39	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 90

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # eighth notes

$meter_vectors["Ask Me Now (Monk)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 31 })
phrases.push({ :start_idx => 32, :end_idx => 39 })

$phrasing_vectors["Ask Me Now (Monk)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# In a Sentimental Mood
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		#  3 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		#  4 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  5 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new(10))		#  6	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  7	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new( 1))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  9
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		# 10
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 11
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 12

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 7))		# 15	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 16	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 1))		# 19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 20
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 21

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 5))		# 22
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 25

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 6))		# 26	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 27	++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 4))		# 28
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 29

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 8))		# 30	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 60

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 1 # 0-based: second beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["In a Sentimental Mood"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 15 })
phrases.push({ :start_idx => 16, :end_idx => 26 })
phrases.push({ :start_idx => 27, :end_idx => 30 })

$phrasing_vectors["In a Sentimental Mood"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Monk's Mood
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  0	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		#  1
notes << MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 1))		#  2
notes << MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 1))		#  3 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  4 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(10))		#  5 	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		#  6	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  7
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  8
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		#  9 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 1))		# 10 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 8))		# 11	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 12	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs4),MusicIR::Duration.new( 1))		# 13
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 14
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 15 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 16 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 17
notes << MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		# 18
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 19
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGb4),MusicIR::Duration.new( 2))		# 20 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 21 	--

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 22	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 23
notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 24
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 25 
notes << MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 26 

notes << MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 27	--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 50

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Monk's Mood"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  5 })
phrases.push({ :start_idx =>  6, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 21 })
phrases.push({ :start_idx => 22, :end_idx => 27 })

$phrasing_vectors["Monk's Mood"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# All My Loving (Beatles)
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  0	Close	++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		#  1	your
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 5))		#  2	eyes

notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		#  3	and
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  4	I'll
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  5	kiss

notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 5))		#  6	you,	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		#  7	to-		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		#  8	mor-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		#  9	row
notes << MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		# 10	I'll
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 11	miss

notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 5))		# 12	you.	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 13	Re-		++

notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 14	mem-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 15	ber
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 16	I'll

notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 17	al-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 18	wa-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 19	ays
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 20	be
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 8))		# 21	true.	--

#notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22	And		++
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 2))		# 23	then
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 4))		# 24	while
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs3),MusicIR::Duration.new( 2))		# 25	I'm
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 26	a-
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 5))		# 27	way,	--
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 28	I'll	++
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		# 29	write
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		# 30	home
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		# 31	ev-
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 1))		# 32	ery
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 33	da-
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 4))		# 34	ay,		--
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 35	And		++
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 36	I'll
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		# 37	send
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 38	all
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 39	my
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 40	lov-
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 4))		# 41	in'
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 42	to
#
#notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 43	you		--
#

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 90

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["All My Loving"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 12 })
phrases.push({ :start_idx => 13, :end_idx => 21 })
#phrases.push({ :start_idx => 22, :end_idx => 27 })
#phrases.push({ :start_idx => 28, :end_idx => 34 })
#phrases.push({ :start_idx => 35, :end_idx => 43 })

$phrasing_vectors["All My Loving"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# In My Life (Beatles)
###############################################################################

notes = []

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  0	There		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		#  1	are

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  2	pla-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  3	ces
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  4	I
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		#  5	re-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		#  6	mem-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		#  7	ber			
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		#  8				--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  9	all			++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 10	my

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		# 11	li-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 12	i-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 13	i-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 14	ife
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 15	though

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 16	some
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 17	have
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 6))		# 18	changed.	--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 19	Some		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 20	for-

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 21	ev-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 22	er,
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 23	not
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		# 24	for

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		# 25	bet-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 26	ter
notes << MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		# 27				--
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 28	some		++
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 29	have

notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		# 30	go-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 31	o-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 32	o-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 33	one
notes << MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 34	and

notes << MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 35	some
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 36	re-
notes << MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 6))		# 37	main.		--

nq = MusicIR::NoteQueue.new(notes)
nq.tempo = 100

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: fourth beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # sixteenth notes

$meter_vectors["In My Life"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 27 })
phrases.push({ :start_idx => 28, :end_idx => 37 })

$phrasing_vectors["In My Life"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

