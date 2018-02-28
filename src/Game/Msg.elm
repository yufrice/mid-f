module Game.Msg exposing (Msg(..))

import Game.Model exposing (..)
import Http
import Summoner.Update


type Msg
    = None
    | Init (Result Http.Error Game)
    | Update Summoner.Update.Msg
