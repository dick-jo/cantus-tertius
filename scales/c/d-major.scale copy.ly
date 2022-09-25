\language "english"
\version "2.22.2"

% -------------------------------------------------------------------------------- %
% Song                                                                             %
% -------------------------------------------------------------------------------- %
scale = {
  \fixed d' {
    c4^"c"_"TONIC" d^"d"_"SUPER"_"TONIC" e^"e"_"MEDIANT" f^"f"_"SUB"_"DOMINANT" g^"g"_"DOMINANT" a^"a"_"SUB"_"MEDIANT" b^"b"_"LEADING"_"TONE" c'^"c"_"TONIC"
  }
}

% -------------------------------------------------------------------------------- %
% melody = { 
%   \fixed c' {
%     c'1^"C" | g^"G(IV)" |
%   }
% }

harmonyHi = {
  \fixed c' {
    <g> | <e> |  
  }
}

harmonyLo = {
  \relative {
    <c e> | <b d> |
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

  #(layout-set-staff-size 35)
  #(define fonts
  (make-pango-font-tree "JetBrainsMono Medium"
                        "Nimbus Sans, Nimbus Sans L"
                        "DejaVu Sans Mono"
                        (/ staff-height pt 20 )))

\context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/64)
    \override TextScript.font-size = #-8
  }
}

\paper {
  #(set-paper-size "a3")
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
  subtitle = \markup { \fontsize #-2 "major scale" }
}

% Scale %
\score { 
<<
  \new StaffGroup \with {
    \omit TimeSignature
  }
  <<
      \new Staff {
        \key c \major    
        \clef treble

        << \scale >> 
  }  
  >>
>>
}

% Chords %
\score {  
<<  
  % Melody %
  \new Staff \with {
    midiInstrument = "violin"
    \omit TimeSignature
    % instrumentName = \markup { \fontsize #-6 \rotate #90 "flute" }
  } { << \melody  >> }


  % Harmony %
  \new StaffGroup \with {
    \omit TimeSignature
      midiInstrument = "violin"
    % instrumentName = \markup { \fontsize #-6 \rotate #90 "string" }
  } 
  <<
    \time 4/4

    % Treble %
    \new Staff {   
      \clef treble
      \key c \major  
      \once \hide Score.MetronomeMark % Hide for midi
      \tempo 4 = 120

      << \harmonyHi >>      
    }

    % Bass %
    \new Staff {
      \clef bass
      \key c \major  
      
      << \harmonyLo >>
    }    
  >>  
>>

  \layout {}
  \midi {}  
}


% -------------------------------------------------------------------------------- %
% Meta                                                                             %
% -------------------------------------------------------------------------------- %
% \header {
%   title = "C"
%   subtitle = \markup { \fontsize #-2 "major scale" }
% }


