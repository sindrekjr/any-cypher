module Msg exposing (Msg(..))

import Cypher exposing (CypherInfo)


type Msg
  = Write String
  | Select CypherInfo
  | ChangeCypher Char String
  | ChangeName String
  | SaveCypher CypherInfo