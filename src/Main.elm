module Main exposing(main)

import Browser
import Html exposing (Html, Attribute, div, input, text)
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
  { content : String
  , cypher : Dict Char Char
  , cyphers : List (Dict Char Char)
  }


init : Model
init =
  { content = ""
  , cypher = albhed
  , cyphers = [albhed]
  }



-- UPDATE

type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to translate", value model.content, onInput Change ] []
    , div [] [ text (translate model.cypher model.content) ]
    ]
