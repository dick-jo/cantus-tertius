\language "english"
\version "2.22.2"
\include "../util/markup.util.ly"

% -------------------------------------------------------------------------------- %
% Notation                                                                         %
% -------------------------------------------------------------------------------- %

harmonyTreble = {
  \fixed c' {
    <c c>1^"Perfect consonances"_"P1"| <c g>_"P5"| <c c'>_"P8" | \bar "|."
    \break
    <c e-flat>^"Imperfect consonances"_"m3" | <c e>_"M3"| <c a-flat>_"m6" | <c a>_"M6" \bar "|."
    \break
    <c d-flat>^"Dissonances"_"m2" | <c d>_"M2" | <c b-flat>_"m7" | <c b>_"M7" | <c f-sharp>_"A4"_"(One semitone"_"more than a"_"perfect interval)" | <c g-flat>_"d5"_"(One semitone"_"less than a"_"perfect interval)" 

  }
}




% -------------------------------------------------------------------------------- %
% Voicings                                                                         %
% -------------------------------------------------------------------------------- %
voiceHarmonyTreble = {
  \new Voice {
    \set midiInstrument = #"synthstrings 1"
    \harmonyTreble
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
    \tempo 4 = 200

    << \voiceHarmonyTreble >>
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
  title = "Consonance and Dissonance"
  subtitle = \markup { \fontsize #-3 "" }
}

\score {
<<

  % Notation
  \new PianoStaff \with {
    \omit TimeSignature
  } 
  <<
    \new Staff = "up" {
      \key c \major
      << \voiceHarmonyTreble >>
    }

  >>

>>

\layout {}
}

