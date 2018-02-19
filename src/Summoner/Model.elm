module Summoner.Model exposing (Summoner)
import Champ.Model exposing (Champ)

type alias Summoner =
    { name : String
    , rank : String
    , champ : Champ
    }