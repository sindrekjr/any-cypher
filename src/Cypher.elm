module Cypher 
  exposing 
    ( Cypher
    , CypherInfo
    , albhed
    , all
    , getRandomCypher
    , updateCypher
    , updateCypherName
    , translate
    )


import Char exposing (isUpper, toLower)
import Dict exposing (Dict)
import List exposing (head)
import String exposing (dropLeft, fromChar, toList, toUpper)



type alias Cypher = Dict Char String

type alias CypherInfo =
  { name : String
  , pure : Bool
  , cypher : Cypher
  }

translate : Cypher -> String -> String
translate cypher input =
  case head (toList input) of
    Just character -> 
      case Dict.get (toLower character) cypher of
        Just value ->
          (if isUpper character then toUpper value else value) ++ translate cypher (dropLeft 1 input)
        Nothing -> fromChar character ++ translate cypher (dropLeft 1 input)
    Nothing -> ""

updateCypher : CypherInfo -> Char -> String -> CypherInfo
updateCypher cypher key str = 
  { cypher
  | cypher = Dict.insert key str cypher.cypher
  , pure = False
  }

updateCypherName : String -> CypherInfo -> CypherInfo
updateCypherName newName cypher =
  { cypher
  | name = newName
  }

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
  [ ('a',"y")
  , ('b',"p")
  , ('c',"l")
  , ('d',"t")
  , ('e',"a")
  , ('f',"v")
  , ('g',"k")
  , ('h',"r")
  , ('i',"e")
  , ('j',"z")
  , ('k',"g")
  , ('l',"m")
  , ('m',"s")
  , ('n',"h")
  , ('o',"u")
  , ('p',"b")
  , ('q',"x")
  , ('r',"n")
  , ('s',"c")
  , ('t',"d")
  , ('u',"i")
  , ('v',"j")
  , ('w',"f")
  , ('x',"q")
  , ('y',"o")
  , ('z',"w")
  ]

caesar : Cypher
caesar =
  Dict.fromList
  [ ('a',"x")
  , ('b',"y")
  , ('c',"z")
  , ('d',"a")
  , ('e',"b")
  , ('f',"c")
  , ('g',"d")
  , ('h',"e")
  , ('i',"f")
  , ('j',"g")
  , ('k',"h")
  , ('l',"i")
  , ('m',"j")
  , ('n',"k")
  , ('o',"l")
  , ('p',"m")
  , ('q',"n")
  , ('r',"o")
  , ('s',"p")
  , ('t',"q")
  , ('u',"r")
  , ('v',"s")
  , ('w',"t")
  , ('x',"u")
  , ('y',"v")
  , ('z',"w")
  ]
