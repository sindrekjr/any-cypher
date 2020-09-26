module Main exposing(main)

import Browser
import Html exposing (Html, button, div, h1, input, nav, section, text, textarea)
import Html.Attributes exposing (autofocus, class, id, placeholder, readonly, value)
import Html.Events exposing (onClick, onInput)
import List exposing (map)
import Cypher exposing (Cypher, all, getRandomCypher, translate)
import Stylesheet exposing (stylesheet)


-- MAIN
main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
type alias Model =
  { input : String
  , output : String
  , cypher : Cypher
  , allCyphers : List Cypher
  }

init : Model
init =
  { input = ""
  , output = ""
  , cypher = getRandomCypher
  , allCyphers = all
  }



-- UPDATE
type Msg
  = Change String | Select Cypher

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model
      | input = newInput
      , output = translate model.cypher.cypher newInput
      }
    Select newCypher ->
      { model
      | cypher = newCypher
      }



-- VIEW
view : Model -> Html Msg
view model =
  div [ class "wrapper" ]
    [ stylesheet
    , section [ class "left" ] 
      [ h1 [ class "title"] [ text "Anycypher" ]
      , cypherNav model.allCyphers
      ]
    , section [ class "right" ]
        [ div [] 
          [ input [] []
          , textarea [ placeholder "Text to translate", value model.input, onInput Change, autofocus True ] []
          ]
        , outputField model model.cypher
        ]
    ]



-- NAV
cypherNav : List Cypher -> Html Msg
cypherNav cyphers =
  nav [] (map (\cypher -> button [ onClick (Select cypher) ] [ text cypher.name ] ) cyphers)


outputField : Model -> Cypher -> Html msg
outputField model cypher =
  div []
    [ input [ id "name", value cypher.name ] []
    , textarea [ value (translate cypher.cypher model.input), readonly True ] []
    ]
