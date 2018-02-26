module Game.Commands exposing (fetchGame)

import Game.Model exposing (Game)
import Game.Update exposing (..)
import Http
import Json.Decode as Decode
import Time exposing (Time)


fetchGame : String -> Cmd Msg
fetchGame name =
    Http.send Init <| Http.get (fetchUrl name) decodeJson


decodeJson : Decode.Decoder Float
decodeJson =
    Decode.at [ "time" ] Decode.float


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/game/"
