module Alphabet exposing (replace, view)

import Html.Attributes exposing (placeholder)
import Html exposing (Html, div, h5, input, text)
import Dict exposing (Dict)

replace : String -> String
replace input = 
  String.reverse input


-- VIEW

view : Dict String String -> Html String
view cypher =
  div []
    [ h5 [] [ text "Alphabet"]
    , input [ placeholder "a" ] []
    ]
    
