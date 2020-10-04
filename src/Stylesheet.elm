module Stylesheet 
  exposing 
    ( stylesheet )

import Html exposing (Html, node)
import Html.Attributes exposing (attribute)



stylesheet : Html msg
stylesheet =
  let tag = "link"
      attrs =
        [ attribute "rel" "stylesheet"
        , attribute "href" "css/styles.css"
        ]
      children =
        []
    in node tag attrs children
