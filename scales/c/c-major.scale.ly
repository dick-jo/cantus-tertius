\language "english"
\version "2.22.2"

% -------------------------------------------------------------------------------- %
% Scale                                                                            %
% -------------------------------------------------------------------------------- %
scale = {
  \fixed d' {
    c4^"c"_"TONIC" d^"d"_"SUPER"_"TONIC" e^"e"_"MEDIANT" f^"f"_"SUB"_"DOMINANT" g^"g"_"DOMINANT" a^"a"_"SUB"_"MEDIANT" b^"b"_"LEADING"_"TONE" c'^"c"_"TONIC"
  }
}

% -------------------------------------------------------------------------------- %
% Tracking                                                                         %
% -------------------------------------------------------------------------------- %

harmonyHi = {
  \fixed c' {
    <c e g>1^"c-e-g"^"(I)"^"C"  | <d f a>^"d-f-a"^"(ii)"^"Dm" | <e g b>1^"e-g-b"^"(iii)"^"Em"  | <f a c'>^"f-a-c"^"(IV)"^"F" |
    <g b d'>1^"g-b-d"^"(V)"^"G"  | <a c' e'>^"a-c-e"^"(vi)"^"Am" | <b d' f'>1^"b-d-f"^"(vii°)"^"B°"  | <c' e' g'> | 
    \break
    <c e g b>^"c-e-g-b"^"(I7)"^"CM7" | <d f a c'>^"d-f-a-c"^"(ii7)"^"Dm7" | <e g b d'>^"e-g-b-d"^"(iii7)"^"Em7" | <f a c' e'>^"f-a-c-e"^"(IV7)"^"FM7" | 
    <g b d' f'>^"g-b-d-f"^"(V7)"^"G7" | <a c' e' g'>^"a-c-e-g"^"(vi7)"^"Am7" | <b d' f' a'>^"b-d-f-a"^"(viiø7)"^"Bø7" | <c' e' g' b'> | 
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

% -------------------------------------------------------------------------------- %
% Formatting                                                                       %
% -------------------------------------------------------------------------------- %
\layout {
  indent = 0.0
  \accidentalStyle teaching

  \context {
    \Score 
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2048)
      \override TextScript.font-size = #-8    
  }

  #(layout-set-staff-size 25)
  #(define fonts
  (make-pango-font-tree "JetBrainsMono Medium"
                        "Nimbus Sans, Nimbus Sans L"
                        "DejaVu Sans Mono"
                        (/ staff-height pt 20 )))
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

% Chords (closed) %
\score {  
<<  
  % Harmony %
  \new PianoStaff \with {
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

      % Tempo%
      \once \hide Score.MetronomeMark % Hide for midi
      \tempo 4 = 240

      << \voiceHarmonyHi >>      
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
