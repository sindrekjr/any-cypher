module Msg exposing (Msg(..))

import Cypher exposing (Cypher)


type Msg
  = Change String | Select Cypher