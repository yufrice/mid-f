module Models exposing (Model, initModel)

import Game.Model exposing (Game, initGame)
import Summoner.Model exposing (Summoner)
import User.Model exposing (User)


type alias Model =
    { user : User
    , game : Game
    }


initUser : User
initUser =
    { name = ""
    , rank = ""
    , state = ""
    }


initModel : Model
initModel =
    { user = initUser
    , game = initGame
    }
