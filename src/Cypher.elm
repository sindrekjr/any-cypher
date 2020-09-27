module Cypher exposing (Cypher, CypherInfo, albhed, all, getRandomCypher, updateCypher, translate)

import Dict exposing (Dict)
import List exposing (head)



type alias Cypher = Dict Char Char

type alias CypherInfo =
  { name : String
  , pure : Bool
  , cypher : Cypher
  }

translate : Cypher -> String -> String
translate cypher input =
  String.map 
  ( \c -> 
    case Dict.get c cypher of
      Just value -> value
      Nothing -> c
  ) input

updateCypher : CypherInfo -> String -> CypherInfo
updateCypher cypher str = cypher


all : List CypherInfo
all = 
  [ { name = "Al Bhed", pure = True, cypher = albhed }
  , { name = "Caesar", pure = True, cypher = caesar }
  ]

getRandomCypher : CypherInfo
getRandomCypher = 
  case head all of 
    Just value -> value
    Nothing -> { name = "Empty", pure = False, cypher = Dict.fromList [] }

albhed : Cypher
albhed = 
  Dict.fromList
  [ ('a','y')
  , ('b','p')
  , ('c','l')
  , ('d','t')
  , ('e','a')
  , ('f','v')
  , ('g','k')
  , ('h','r')
  , ('i','e')
  , ('j','z')
  , ('k','g')
  , ('l','m')
  , ('m','s')
  , ('n','h')
  , ('o','u')
  , ('p','b')
  , ('q','x')
  , ('r','n')
  , ('s','c')
  , ('t','d')
  , ('u','i')
  , ('v','j')
  , ('w','f')
  , ('x','q')
  , ('y','o')
  , ('z','w')
  ]

caesar : Cypher
caesar =
  Dict.fromList
  [ ('a','x')
  , ('b','y')
  , ('c','z')
  , ('d','a')
  , ('e','b')
  , ('f','c')
  , ('g','d')
  , ('h','e')
  , ('i','f')
  , ('j','g')
  , ('k','h')
  , ('l','i')
  , ('m','j')
  , ('n','k')
  , ('o','l')
  , ('p','m')
  , ('q','n')
  , ('r','o')
  , ('s','p')
  , ('t','q')
  , ('u','r')
  , ('v','s')
  , ('w','t')
  , ('x','u')
  , ('y','v')
  , ('z','w')
  ]
