\language "english"
\version "2.22.2"
\include "../../util/markup.util.ly"

% -------------------------------------------------------------------------------- %
% Notation                                                                         %
% -------------------------------------------------------------------------------- %
harmonyChords = {
  \fixed c' {
    \chordmode {
      c1 |
      a:m |
      f |
      g |
    }
  }
}

harmonyTreble = {
  \fixed c' {
    <c e g>1 |
    <a c' e'>1 |
    <f a c'>1 |
    <g b d'>1 |

    \break

    <g e c'>1 |
    <e a c'>1 |
    <f a c'>1 |
    <d g b>1 |

    \break

    <e c'> |
    <c' a> |
    <a f> |
    <b g> |

    <e c'>~ | <e c'>~ | <e c'> |


  }
}

harmonyBass = {
\fixed c' {
    s1_"closed voicing" |
    s1 |
    s1 |
    s1 |

    s1_"closed voicing, voice leading (vertically optimised)" |
    s1 |
    s1 |
    s1 |

    <c, g,>_"open voicing" |
    <a,, e,> |
    <f, c,> |
    <g, d,> |

    <c, g,>~ | <c, g,>~ |<c, g,> |
    
    
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
  subtitle = \markup { \fontsize #-2 "chord schema: I -> vi -> IV -> V ('doo wop')" }
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

