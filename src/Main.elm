module Main exposing(main)

import Browser
import Html exposing (Html, button, div, h1, input, nav, section, text, textarea)
import Html.Attributes exposing (autofocus, class, id, placeholder, readonly, value)
import Html.Events exposing (onClick, onInput)
import List exposing (map)
import Alphabet exposing (alphabetForm)
import Cypher exposing (CypherInfo, all, getRandomCypher, updateCypher, translate)
import Msg exposing (Msg(..))
import Stylesheet exposing (stylesheet)


-- MAIN
main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
type alias Model =
  { input : String
  , output : String
  , cypher : CypherInfo
  , allCyphers : List CypherInfo
  }

init : Model
init =
  { input = ""
  , output = ""
  , cypher = getRandomCypher
  , allCyphers = all
  }



-- UPDATE
update : Msg -> Model -> Model
update msg model =
  case msg of
    Write newInput ->
      { model
      | input = newInput
      , output = translate model.cypher.cypher newInput
      }
    Select newCypher ->
      { model
      | cypher = newCypher
      }
    Change key newValue ->
      { model
      | cypher = updateCypher model.cypher key newValue
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
        [ section [ class "top" ]
          [ inputField model
          , outputField model.input model.cypher
          ]
        , section [ class "bottom" ]
          [ alphabetForm model.cypher.cypher ]
        ]
    ]



-- NAV
cypherNav : List CypherInfo -> Html Msg
cypherNav cyphers =
  nav [] (map (\cypher -> button [ onClick (Select cypher) ] [ text cypher.name ] ) cyphers)


inputField : Model -> Html Msg
inputField model =
  div [ class "textarea-wrapper" ]
    [ input [ value "English", readonly True ] []
    , textarea [ autofocus True, placeholder "Text to translate", value model.input, onInput Write] []
    ]

outputField : String -> CypherInfo -> Html Msg
outputField inp cypher =
  div [ class "textarea-wrapper" ]
    [ input [ id "name", value cypher.name, readonly cypher.pure ] []
    , textarea [ value (translate cypher.cypher inp), readonly True ] []
    ]
