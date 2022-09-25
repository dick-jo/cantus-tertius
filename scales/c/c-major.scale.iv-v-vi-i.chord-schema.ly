\language "english"
\version "2.22.2"
\include "../../util/markup.util.ly"

% -------------------------------------------------------------------------------- %
% Notation                                                                         %
% -------------------------------------------------------------------------------- %
harmonyChords = {
  \fixed c' {
    \chordmode {
      f1 |
      g |
      a:m |
      c |

    }
  }
}

harmonyTreble = {
  \fixed c' {
    <f a c'>1 |
    <g b d> |
    <a c' e'> |
    <c e g> |
    
    \break

    <f a c'> |
    <g b d> |
    <a c' e> |
    <c' e g> |

    \break |

    <a f> |
    <b g> |
    <c' a> |
    <e c'>|
  }
}

harmonyBass = {
\fixed c' {
    s1_"closed voicing" |
    s1 |
    s1 |
    s1 |

    %

    s1_"closed voicing, voice leading (vertically optimised)" |
    s1 |
    s1 |
    s1 |

    %

    <f,, c,>_"open voicing" |
    <g,, d,> |
    <a,, e,> |
    <c, g,> |
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

voiceHarmonyBass = {
  \new Voice {
    \set midiInstrument = #"synthstrings 1"
    \harmonyBass
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
  
  \new Staff = "down" {
    \key c \major
    \clef bass

    << \voiceHarmonyBass >>
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
  title = "C"
  subtitle = \markup { \fontsize #-3 "chord schema: IV -> V -> vi -> I  ('hopsctoch')" }
}

\score {
<<

  % Chords
  \new ChordNames {
    \harmonyChords
  }

  % Notation
  \new PianoStaff \with {
    \omit TimeSignature
  } 
  <<
    \new Staff = "up" {
      \key c \major
      << \voiceHarmonyTreble >>
    }

    \new Staff = "down" {
      \key c \major
      \clef bass
      << \voiceHarmonyBass >>
    }

  >>

>>

\layout {}
}

