module Main exposing (main)


import Browser exposing (Document)
import Html exposing (Html, div, h1, input, nav, section, text, textarea)
import Html.Attributes exposing (autofocus, class, hidden, placeholder, readonly, type_, value)
import Html.Events exposing (onClick, onInput)
import List exposing (append, map)

-- Modules
import Alphabet exposing (form)
import Cypher exposing (Cypher, substitute)
import Msg exposing (Msg(..))
import Stylesheet exposing (stylesheet)



-- MAIN
main : Program () Model Msg
main =
  Browser.document { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL
type alias Model =
  { input : String
  , output : String
  , cypher : Cypher
  , allCyphers : List Cypher
  }

init : flags -> (Model, Cmd Msg)
init _ =
  ( { input = ""
    , output = ""
    , cypher = Cypher.random
    , allCyphers = Cypher.all
    }
  , Cmd.none
  )



-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Write newInput ->
      ( { model
        | input = newInput
        , output = substitute model.cypher newInput
        }
      , Cmd.none
      )
    Select newCypher ->
      ( { model
        | cypher = newCypher
        }
      , Cmd.none
      )
    ChangeCypher key newValue ->
      ( { model
        | cypher = Cypher.change model.cypher key newValue
        }
      , Cmd.none
      )
    ChangeName newName ->
      ( { model
        | cypher = Cypher newName model.cypher.pure model.cypher.subs
        }
      , Cmd.none
      )
    Save newCypher ->
      ( { model
        | allCyphers = append model.allCyphers [{ newCypher | pure = True }]
        }
      , Cmd.none
      )



-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW
view : Model -> Document Msg
view model =
  { title = "Anycypher"
  , body = 
      [ div [ class "wrapper" ]
          [ stylesheet
          , section [ class "left" ] 
            [ h1 [ class "title"] [ text "Anycypher" ]
            , nav [] 
              (map (\cypher -> 
                input 
                [ if cypher == model.cypher then class "selected" else class "select"
                , type_ "button"
                , value cypher.name
                , onClick (Select cypher)
                ] [] ) model.allCyphers)
            ]
          , section [ class "right" ]
              [ section [ class "top" ]
                [ inputField model
                , outputField model.input model.cypher
                ]
              , section [ class "bottom" ]
                [ form model.cypher ]
              ]
          ]
      ]
  }
  



inputField : Model -> Html Msg
inputField model =
  div [ class "textarea-wrapper" ]
    [ div [ class "textarea-head" ] 
      [ input [ class "name", value "English", readonly True ] []
      ]
    , textarea [ autofocus True, placeholder "Text to translate", value model.input, onInput Write] []
    ]

outputField : String -> Cypher -> Html Msg
outputField inp cypher =
  div [ class "textarea-wrapper" ]
    [ div [ class "textarea-head" ] 
      [ input [ class "name", value cypher.name, readonly cypher.pure, onInput ChangeName ] []
      , input [ type_ "button", value "Save", hidden cypher.pure, onClick (Save cypher) ] []
      ]
    , textarea [ value (substitute cypher inp), readonly True ] []
    ]
