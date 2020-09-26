module Alphabet exposing (replace, view)
import Html.Attributes exposing (placeholder)
import Html exposing (div, h5, input, text)

replace : String -> String
replace input = 
  String.reverse input


-- VIEW

view =
  div []
    [ h5 [] [ text "Alphabet"]
    , input [ placeholder "a" ] []
    ]
    
