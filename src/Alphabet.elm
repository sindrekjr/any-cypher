module Alphabet exposing (alphabetForm)

import Html exposing (Html, form, label, input, text)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import Dict exposing (get, keys)
import List exposing (map)
import Msg exposing (Msg(..))
import Cypher exposing (Cypher)


alphabetForm : Cypher -> Html Msg
alphabetForm cypher =
  form [ class "alphabet" ] (map (\k -> mapKeyValuePairToInput k (get k cypher)) (keys cypher))
    
mapKeyValuePairToInput : Char -> Maybe Char -> Html Msg
mapKeyValuePairToInput k v =
  label [ class "character" ]
    [ text (String.fromChar k)
    , input [ value (
        case v of
          Just value -> String.fromChar value
          Nothing -> ""
      ), onInput Change ] []
    ]
