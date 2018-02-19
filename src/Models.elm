module Models exposing (Model, initModel)

import Summoner.Model exposing (Summoner)
import Champ.Model exposing (Champ)
import Time exposing (Time)


type alias Model =
    { summoners : List Summoner
    , time : Time
    , entry : String
    , summonerId : String
    }

c : Champ
c =
    { name = "malp"
    , ultCd = 60
    }

s : Summoner
s =
    { name = "test"
    , rank = "Bronze"
    , champ = c
    }


initModel : Model
initModel =
    { summoners = [s, s, s]
    , time = 0
    , entry = ""
    , summonerId = ""
    }
