module Cypher exposing (albhed, translate)

import Dict exposing (Dict)


translate : Dict Char Char -> String -> String
translate cypher input =
  String.map 
  ( \c -> 
    case Dict.get c cypher of
      Just value -> value
      Nothing -> c
  ) input

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
