module Summoner.Model exposing (Summoner)

import Time exposing (Time)


type alias Summoner =
    { name : String
    , rank : String
    , champ : String
    , dSpell : String
    , dTime : Time
    , fSpell : String
    , fTime : Time
    , modit : Time
    }
