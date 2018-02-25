module Models exposing (Model, initModel)

import Champ.Model exposing (Champ)
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
    , id = ""
    , rank = ""
    , state = ""
    }


initModel : Model
initModel =
    { user = initUser
    , game = initGame
    }
