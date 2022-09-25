% -------------------------------------------------------------------------------- %
% Markup                                                                           %
% -------------------------------------------------------------------------------- %
\layout {
  indent = 0.0
  orientation = landscape
  \set Staff.pedalSustainStyle = #'bracket
  \accidentalStyle teaching

  #(layout-set-staff-size 25)
  #(define fonts
  (make-pango-font-tree "JetBrainsMono Medium"
                        "JetBrainsMono Medium"
                        "JetBrainsMono Medium"
                        (/ staff-height pt 20 )))

  \context {
    \Score 
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/256)
      \override TextScript.font-size = #-8
      \override ChordName.font-size = #-3
    
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
                        "JetBrainsMono Medium"
                        "JetBrainsMono Medium"
                        (/ staff-height pt 20 )))
}