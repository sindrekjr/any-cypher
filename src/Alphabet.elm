module Alphabet exposing (alphabetForm)

import Html.Attributes exposing (class, value)
import Html exposing (Html, form, label, input, text)
import Dict exposing (Dict)
import List exposing (map)
import Msg exposing (Msg)


alphabetForm : Dict Char Char -> Html Msg
alphabetForm cypher =
  form [ class "alphabet" ] (map (\k -> mapKeyValuePairToInput k (Dict.get k cypher)) (Dict.keys cypher))
    
mapKeyValuePairToInput : Char -> Maybe Char -> Html msg
mapKeyValuePairToInput k v =
  label [ class "character" ]
    [ text (String.fromChar k)
    , input [ value (
        case v of
          Just value -> String.fromChar value
          Nothing -> ""
      ) ] []
    ]
