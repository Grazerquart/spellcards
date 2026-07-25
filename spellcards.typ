// to compile 'typst compile spellcards.typ --format png --ppi 300 {0p}'
  // a8 is fairly close to xteink screen size
  // "eu-business-card"	A paper that is 85.0 × 55.0 millimeters in size. might be closer?
#set page(
  paper: "a8",
  margin: 1em
)
#set text(
  size: .5em
)
#let spell_list = csv(
  "Spells.csv",
  row-type: dictionary,
)
#{for spell in spell_list [
    = #spell.Name #h(1fr) #spell.Source | #spell.Page
    #line(length: 100%)
    * #spell.Level | #spell.School | #spell.Components *
    / Casting time: #spell.at("Casting Time") 
    / Duration: #spell.Duration 
    / Range: #spell.Range
    #context [
      #set text(size: .9em)
      #spell.Text
    ]
    #if "" != spell.at("At Higher Levels") [
      #set text(size: .9em)
      #line(length: 100%)
      / At Higher Levels: #spell.at("At Higher Levels")
    ]
    #pagebreak()
  ]
}
