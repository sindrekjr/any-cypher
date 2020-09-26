module Main exposing(main)

import Browser
import Html exposing (Html, Attribute, div, input, text, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Alphabet exposing (replace)
import Dict exposing (Dict)
import Cypher exposing (albhed, translate)



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model =
  { input : String
  , output : String
  , cypher : Dict Char Char
  , cyphers : List (Dict Char Char)
  }


init : Model
init =
  { input = ""
  , output = ""
  , cypher = albhed
  , cyphers = [albhed]
  }



-- UPDATE

type Msg
  = ChangeIn String | ChangeOut String


update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeIn newInput ->
      { model
      | input = newInput
      , output = translate model.cypher newInput
      }
    ChangeOut newOutput ->
      { model
      | output = newOutput
      }



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ textarea [ placeholder "Text to translate", value model.input, onInput ChangeIn ] []
    , textarea [ value model.output, onInput ChangeOut ] []
    ]
