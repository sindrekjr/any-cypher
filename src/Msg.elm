module Msg exposing (Msg(..))

import Cypher exposing (CypherInfo)


type Msg
  = Write String | Select CypherInfo | Change Char String