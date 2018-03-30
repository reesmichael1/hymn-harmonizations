\version "2.18.2"
\header {
  title = "Jesus Christ is Risen Today"
  arranger = "Michael Rees"
  tagline = ""
}
\paper {
  #(set-paper-size "letter")
}
keyTime = { \key c \major \time 4/4 }
ManualOneMusic = \relative c' {
  c4 e g c, f a a g
  e8 f g c, f4 e8 f e4 d c2
  c4 e g c, f a a g
  e8 f g c, f4 e8 f e4 d c2
  < d g b >8. < g b d > 16 < g b d > 8. < g b d g > 16 < g b d g > 4. r8
  < g c e g >4 < a d f a > < ais cis e g ais > 2
  b8 c d g, c4 b8 c b4 a g2
  g8 a b g c4 e, f a a g
  c8-> b-> c-> g-> a-> b-> c-> d-> c4 < b d g b > < c e g c >2\fermata
}
ManualTwoMusic = \relative c {
  < e g c >2 < d g b > < d f bes > < c f a >
  < c ees aes >  < b d g > < bes des ges > < a c f >
  < g c e > < g bes ees > < a d f > < cis e a >
  < c e g > < d g b > < e g bes > < c e a >
  < d g b >8.^\markup{I} < d g b d > 16 < d g b d > 8. < d g b d > 16 < d g b d > 4. r8
  < g c e >4 < a d f > < g ais cis e g > 2
  < g b d >2 < g c e > < a c d > < g c d >4 ~ < g b d >
  < f b d>2 < e g c> < f a c > 2. ~ < e g c >4 
  < g c e >8-> < g b d >-> < g c e >4->
  < a c f >8-> < g b e>-> < a c e >-> < a c f >-> 
  < g c e g >4 < d g b d > < c e g c >2\fermata
}

PedalMusic = \relative c {
  c2 b bes a aes g ges f 
  e ees d cis c b' bes a
  g2. g8 f e4 d cis2
  d' a d4 d, g2 f e4 c'8 b
  a4 f c2
  < c c'>8-> <d d'>-> <e e'>-> <c c'>-> 
  < f f'>-> < e e' >-> < a a' >-> < f f' >-> 
  < g g'>2 < c, g''>\fermata
}

dynamics = {
  \crescHairpin
  s1\ff | s | s | s |
  s | s | s | s | 
  s | s | s | s | 
  s | s | s\<-"molto rit."  | s4 s4 s2\fff
}

\markup { 
  \general-align #X #LEFT
  \column{
    \line{\bold I. Solo Reed, Full Organ}
    \line{\bold{II}: Full with Mixtures}
    \line{\bold{Ped}: Full Organ}
  } 
}

\score {
  <<
    \new PianoStaff <<
      \new Staff \with {
        instrumentName = #"I"
        midiInstrument = #"Church Organ"
      }  <<
        \keyTime
        \clef "treble"
        \new Voice {
          \ManualOneMusic
        }
      \new Dynamics {
        \dynamics
      }
      >> % end Manual I
      \new Staff \with {
        instrumentName = #"II" 
        midiInstrument = #"Church Organ"
        \override VerticalAxisGroup.staff-staff-spacing.stretchability = 3
      } <<
        \keyTime
        \clef "bass"
        \new Voice {
          \ManualTwoMusic
        }
      >> % end Manual II
    >> % end PianoStaff
    \new Staff \with {
      instrumentName = #"Ped." 
      midiInstrument = #"Church Organ"
    } <<
      \keyTime
      \clef "bass"
      \new Voice {
        \PedalMusic
      }
    >>
  >>
  \layout {} 

  \midi {
    \tempo 4 = 100
  }
}
