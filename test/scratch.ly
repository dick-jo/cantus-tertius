\language "english"
\version "2.22.2"

\header {
  title = "Souk Byzantium"
}

\score {
    \new Voice \relative c' {
    \set midiInstrument = #"flute"
    

    \clef treble
    \time 4/4
    \tempo "Moderato" 4 = 120
    \key d \major

    \accidentalStyle teaching
    \set Staff.pedalSustainStyle = #'bracket


    d8(\sustainOn a')\sustainOff c-sharp d c-sharp a g a
    d, a' c-sharp\sustainOn c-sharp16( d16)( c-sharp8)\sustainOff a g8~ g8

    d8( a') c-sharp d d16( c-sharp)( a8) g16( a) c-sharp8
    d16( c-sharp) a8 g a d16( c-sharp) b8 a~ a
    
    }

  \layout {}
  \midi {}  
}

