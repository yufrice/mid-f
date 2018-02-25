module Game.Commands exposing (fetchGame)

import Game.Model exposing (Game)
import Game.Update exposing (..)
import Http
import Json.Decode as Decode


fetchGame : Game -> Cmd Msg
fetchGame game =
    Cmd.none
