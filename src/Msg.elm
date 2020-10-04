module Msg 
  exposing 
    ( Msg(..) )


-- Modules
import Cypher exposing (Cypher)



type Msg
  = Write String
  | Select Cypher
  | ChangeCypher Char String
  | ChangeName String
  | Save Cypher