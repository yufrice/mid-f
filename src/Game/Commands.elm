module Game.Commands exposing (fetchGame)

import Game.Model exposing (Game)
import Game.Update exposing (..)
import Http
import Json.Decode as Decode


fetchGame : String -> Cmd Msg
fetchGame name =
    Http.send Init <| Http.get (fetchUrl name) decodeJson


decodeJson : Decode.Decoder String
decodeJson =
    Decode.at [ "state" ] Decode.string


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/game/"
