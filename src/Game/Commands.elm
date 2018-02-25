module Game.Commands exposing (fetchGame)

import Game.Model exposing (Game)
import Game.Update exposing (..)
import Http
import Json.Decode as Decode


fetchGame : Game -> Cmd Msg
fetchGame game =
    Cmd.none


decodeJson : Decode.Decoder String
decodeJson =
    Decode.at [ "time" ] Decode.string


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/game/"
