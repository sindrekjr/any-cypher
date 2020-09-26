module Main exposing(main)

import Browser
import Html exposing (Html, Attribute, div, input, text, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Cypher exposing (Cypher, getRandomCypher, translate)



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model =
  { input : String
  , output : String
  , cypher : Cypher
  }


init : Model
init =
  { input = ""
  , output = ""
  , cypher = getRandomCypher
  }



-- UPDATE

type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model
      | input = newInput
      , output = translate model.cypher.cypher newInput
      }



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ textarea [ placeholder "Text to translate", value model.input, onInput Change ] []
    , textarea [ value model.output, readonly True ] []
    ]
