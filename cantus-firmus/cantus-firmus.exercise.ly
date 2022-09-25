\language "english"
\version "2.22.2"
\include "../util/markup.util.ly"

% -------------------------------------------------------------------------------- %
% Notation                                                                         %
% -------------------------------------------------------------------------------- %
harmonyChords = {
  \fixed c' {
    \chordmode {
      % 
    }
  }
}

% ---

cantusFirmi = {
  \fixed c' {
    c1_"starts on"_"1deg" f^"TONIC->P4"_"LEAP->"_"(TONIC->P4)" \glissando e^"TONIC->M3"_"LEAP"_"(E/3deg->P4)" a^"TONIC->M6"^"[CLIMAX]" \glissando g^"TONIC->P5" \glissando f^"TONIC->P4" \glissando e^"TONIC->M3" \glissando d^"TONIC->M2*"^"[SUPERTONIC]"^"(step)"_"approach final"_"tonic by step" \glissando c_"ends on"_"1deg" |

    \break

    c \glissando | f \glissando | d \glissando | a \glissando | g \glissando | f \glissando | e \glissando | d  \glissando| c\breve  |

    \break

    c1 \glissando  | f \glissando  | e \glissando  | a \glissando  | g \glissando  | f \glissando  | e \glissando  | d \glissando  | c\breve |
  }
}

counterpointTreble = {
  \fixed c' {
    s1 | s | s | s | s | s | s | s | s |

    e' \glissando | d' \glissando | c' \glissando | c' \glissando | b \glissando | d' \glissando | g \glissando | b \glissando | c'\breve  |

    %
  }
}

counterpointBass = {
\fixed c' {
    s1_"-> Length of ~8-16 notes / Begin and end on 1deg"
    _"-> All note-to-note progressions are melodic consonances"
    _"-> Dynamic range usually no greater than a 10th (maximum an octave)"
    _"-> Single climax: high point appearing only once" 
    _"-> Mostly stepwise motion (limited leaps)" 
    _"-> Any (large) leaps (> 4th/5th) followed by step in opposing direction" 
    _"-> No more than 2 leaps in a row, no consecutive leaps in same direction" 
    _"-> Leading tone progresses to tonic" 
    _"-> Leaping up is more important than leaping down - 'what goes up must come down'" 
    |
    
    | s | s | s | s | s | s | s | s |
    
    %

    s_"(Counterpoint response by Franz Schubert)"
    _"...observes all other rules, but in addition:"
    _"-> Can begin on 1deg, 3deg or 5deg (when written above cantus firmi ...below must begin on 1deg)"
    _"-> Counterpoint is allowed to repeat tones (if appropriate)"
    _"-> Must not create any dissonant harmonic intervals with the underlying cantus firmi"
    _"-> Must not use direct motion to approach a perfect consonance"
    _"* Imperfect consonances are ideal for creating forward flow"
    _"* Contrary motion between counterpoint and cantus firmi is generally desirable"
    _"...(vs direct motion ie 'parallell' - same direction same intervals - or 'similar' - same direction, not same intervals - motion)"
    -"...Oblique motion (one voice moves, other remains stationary) is not totally contrary, but still superior to direct motion"
    |

    | s | s | s | s | s | s | s | s | s |

    c, \glissando 
    _"(Counterpoint below the cantus firmi)"
    _"-> Starts on tonic"
    _"-> Aiming for a climactic low-point (instead of a high-point climax)" 
    |

    d, \glissando | c,~ \glissando | c, \glissando | e, \glissando | a,,~ \glissando | a,, \glissando | b,, \glissando | c,\breve |  
  }
}

% -------------------------------------------------------------------------------- %
% Voicings                                                                         %
% -------------------------------------------------------------------------------- %
voiceCantusFirmi = {
  \new Voice {
    \set midiInstrument = #"synthstrings 1"
    \cantusFirmi
  }
}

voiceCounterpointTreble = {
  \new Voice {
    \voiceTwo
    \set midiInstrument = #"synthstrings 1"
    \counterpointTreble
  }
}

voiceCounterpointBass = {
  \new Voice {
    \set midiInstrument = #"synthstrings 1"
    \counterpointBass
  }
}

% -------------------------------------------------------------------------------- %
% Live Score                                                                       %
% -------------------------------------------------------------------------------- %
\markup \vspace #1

\score {  
<< 

  \new PianoStaff \with {
    \omit TimeSignature
  } 
  <<
  \new Staff = "up" {  
    \key c \major
    \once \hide Score.MetronomeMark % Hide for midi
    \tempo 4 = 280

    << \voiceCantusFirmi \\ \voiceCounterpointTreble >>
  }
  
  \new Staff = "down" {
    \key c \major
    \clef bass

    << \voiceCounterpointBass >>
  }
  >>

>>

  \midi {
    \context {
      \Staff
      \remove "Staff_performer" 
    }
    \context {
      \Voice
      \consists "Staff_performer"
    }
  }  
}

% -------------------------------------------------------------------------------- %
% Engraving Score                                                                  %
% -------------------------------------------------------------------------------- %
\header {
  title = "Cantus Firmus"
  subtitle = \markup { \fontsize #-3 "Antonio Salieri" }
}

\score {
<<

  \new PianoStaff \with {
    \omit TimeSignature
  } 
  <<
  \new Staff = "up" {  
    \key c \major
    \once \hide Score.MetronomeMark % Hide for midi
    \tempo 4 = 280

    << \voiceCantusFirmi \\ \voiceCounterpointTreble >>
  }
  
  \new Staff = "down" {
    \key c \major
    \clef bass

    << \voiceCounterpointBass >>
  }
  >>

>>

\layout {}
}

