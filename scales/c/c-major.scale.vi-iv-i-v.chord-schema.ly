\language "english"
\version "2.22.2"
\include "../../util/markup.util.ly"

% -------------------------------------------------------------------------------- %
% Notation                                                                         %
% -------------------------------------------------------------------------------- %
harmonyChords = {
  \fixed c' {
    \chordmode {
      a1:m |
      f |
      c |
      g |
    }
  }
}

harmonyTreble = {
  \fixed c' {
    <a c' e'>1  |
    <f a c'>1 |
    <c e g>1 |
    <g b d'>1 |

    \break

    <a c' e> |
    <f a c'> |
    <c' e g> |
    <g b d> |

    \break 

    <c a> |
    <a f> |
    <e c> |
    <b,> |

    <e c>~ | <e c>~ | <e c> |
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

    <a,, e,>_"open voicing" |
    <f,, c,> |
    <c,, g,,> |
    <g,, d, g,> |

    <c,, g,,>~ | <c,, g,,>~ | <c,, g,,> |
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
  subtitle = \markup { \fontsize #-2 "chord schema: vi -> IV -> I -> V  ('singer songwriter')" }
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

