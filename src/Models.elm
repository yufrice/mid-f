module Models exposing (Model, initModel)

import Game.Model exposing (Game, initGame)
import User.Model exposing (User)


type alias Model =
    { user : User
    , game : Game
    }


initUser : User
initUser =
    { name = ""
    , id = 0
    , rank = ""
    , state = ""
    }


initModel : Model
initModel =
    { user = initUser
    , game = initGame
    }
