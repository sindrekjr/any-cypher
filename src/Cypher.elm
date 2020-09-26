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
