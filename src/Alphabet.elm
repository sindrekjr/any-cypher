module Alphabet 
  exposing 
    ( form )


import Html exposing (Html, label, input, text)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import Dict exposing (get, keys)
import List exposing (map)

-- Modules
import Cypher exposing (Cypher)
import Msg exposing (Msg(..))



form : Cypher -> Html Msg
form cypher =
  Html.form [ class "alphabet" ] (map (\k -> mapKeyValuePairToInput k (get k cypher.subs)) (keys cypher.subs))
    
mapKeyValuePairToInput : String -> Maybe String -> Html Msg
mapKeyValuePairToInput k v =
  label [ class "character" ]
    [ text k
    , input [ value (
        case v of
          Just value -> value
          Nothing -> ""
      ), onInput (\c -> ChangeCypher k c) ] []
    ]
