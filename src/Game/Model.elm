module Game.Model exposing (Game, initGame)

import Summoner.Model exposing (Context, Summoner)
import Time exposing (Time)


type alias Game =
    { summoners : List Summoner
    , context : Context
    , state : Bool
    }


initContext : Context
initContext =
    { uri = ""
    , version = ""
    , time = 0
    }


initGame : Game
initGame =
    { summoners = []
    , context = initContext
    , state = False
    }
