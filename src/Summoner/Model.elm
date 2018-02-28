module Summoner.Model exposing (Context, Summoner)

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


type alias Context =
    { uri : String
    , version : String
    , time : Time
    , state : Bool
    }
