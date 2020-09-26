module Stylesheet exposing (stylesheet)

import Html exposing (Html, node)
import Html.Attributes exposing (attribute)


stylesheet : Html msg
stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "/css/stylesheet.css"
            ]

        children =
            []
    in
        node tag attrs children
