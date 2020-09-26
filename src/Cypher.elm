module Cypher exposing (Cypher, albhed, all, getRandomCypher, translate)

import Dict exposing (Dict)
import List exposing (head)


type alias Cypher =
  { name : String
  , cypher : Dict Char Char
  }

translate : Dict Char Char -> String -> String
translate cypher input =
  String.map 
  ( \c -> 
    case Dict.get c cypher of
      Just value -> value
      Nothing -> c
  ) input

all : List Cypher
all = 
  [ { name = "Al Bhed", cypher = albhed }
  , { name = "Caesar", cypher = caesar }
  ]

getRandomCypher : Cypher
getRandomCypher = 
  case head all of 
    Just value -> value
    Nothing -> { name = "Empty", cypher = Dict.fromList [] }

albhed : Dict Char Char
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

caesar : Dict Char Char
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
