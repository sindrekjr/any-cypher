module Msg 
  exposing 
    ( Msg(..) )


-- Modules
import Cypher exposing (Cypher)



type Msg
  = Write String
  | Select Cypher
  | ChangeCypher String String
  | ChangeName String
  | Save Cypher