module Game.Model exposing (Game, initGame)

import Summoner.Model exposing (Summoner)
import Time exposing (Time)


type alias Game =
    { summoners : List Summoner
    , time : Time
    , state : Bool
    }


initGame : Game
initGame =
    { summoners = []
    , time = 0
    , state = False
    }
