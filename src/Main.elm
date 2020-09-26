module Main exposing(..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Alphabet exposing (replace)



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model =
  { content : String
  }


init : Model
init =
  { content = "" }



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
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (replace model.content) ]
    , Alphabet.view
    ]


