\language "english"
\version "2.22.2"

% -------------------------------------------------------------------------------- %
% Song                                                                             %
% -------------------------------------------------------------------------------- %

harmonyHi = {
  \fixed c' {
    <e c'>1^"(I)"^"C"^"Drop 2 & 4" | <f d'>^"(ii)"^"Dm" | <g e'>^"(iii)"^"Em" | <a f'>^"(IV)"^"F" |
    <b, d' g'>^"(V)"^"G" | <e c' a'>^"(vi)"^"Am" | <f d' b'>^"(vii)"^"B°" | <c g e' c''>^"C" |
  }
}

harmonyMid = {
  \fixed c { 
    g1 | a | b | c' |
    g | a | b | r |
    % 

    
  } 
}

harmonyLo = {
  \fixed c { 
    c1 | d | e | f |
    | | | |
    % 

  } 
}

% -------------------------------------------------------------------------------- %
% Voicings                                                                         %
% -------------------------------------------------------------------------------- %
voiceHarmonyHi = {
  \new Voice = "violin" {
    \voiceOne
    \set midiInstrument = #"synthstrings 1"

    << \harmonyHi >>
  }
}

voiceHarmonyMid = {
  \new Voice = "viola" {
    \voiceTwo
    \set midiInstrument = #"viola"

    << \harmonyMid>>
  }
}

voiceHarmonyLo = {
  \new Voice = "cello" { 
    \set midiInstrument = #"cello"
    \voiceThree
    
    << \harmonyLo >>
    }
}

% -------------------------------------------------------------------------------- %
% Formatting                                                                       %
% -------------------------------------------------------------------------------- %
\layout {
  indent = 0.0
  orientation = landscape
  \set Staff.pedalSustainStyle = #'bracket
  \accidentalStyle teaching

  #(layout-set-staff-size 25)
  #(define fonts
  (make-pango-font-tree "JetBrainsMono Medium"
                        "Nimbus Sans, Nimbus Sans L"
                        "DejaVu Sans Mono"
                        (/ staff-height pt 20 )))

  \context {
    \Score 
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2048)
      \override TextScript.font-size = #-8
    
  }
}

\paper {
  #(set-paper-size "a4")

  % Vertical spacing
  system-system-spacing =
  #'((basic-distance . 16) 
      (minimum-distance . 8)
      (padding . 1)
      (stretchability . 60))

  #(define fonts
  (make-pango-font-tree "JetBrainsMono Medium"
                        "Nimbus Sans, Nimbus Sans L"
                        "DejaVu Sans Mono"
                        (/ staff-height pt 20 )))
}

% -------------------------------------------------------------------------------- %
% Score                                                                            %
% -------------------------------------------------------------------------------- %
\header {
  title = "C"
  subtitle = \markup { \fontsize #-2 "major scale (Open voicings)" }
}

\score {  
<<  
  % Harmony %
  \new PianoStaff \with {
    \omit TimeSignature
  } 
  <<
    \time 4/4

    % Treble %
    \new Staff {   
      \clef treble
      \key c \major  
      \once \hide Score.MetronomeMark % Hide for midi
      \tempo 4 = 240
      << \voiceHarmonyHi >>      
    }

    % Bass %
    \new Staff {
      \clef bass
      \key c \major        
      << \voiceHarmonyMid \\ \voiceHarmonyLo >>
    }    
  >>    
>>

  \layout {}
  \midi {
    \context {
      \Voice
      \consists "Staff_performer" 
    }
  }  
}
