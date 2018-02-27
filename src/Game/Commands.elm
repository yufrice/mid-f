module Game.Commands exposing (fetchGame, fetchTime)

import Game.Model exposing (Game)
import Game.Msg exposing (Msg(..))
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import Summoner.Commands exposing (decodeSummoner)


fetchGame : String -> Cmd Msg
fetchGame name =
    Http.send Init <| Http.get (fetchUrl name) decodeGame


fetchTime : String -> Cmd Msg
fetchTime name =
    Http.send Update <| Http.get (fetchUrl name) decodeTime


decodeGame : Decode.Decoder Game
decodeGame =
    Decode.succeed Game
        |> required "summoners" (Decode.list decodeSummoner)
        |> required "time" Decode.float
        |> hardcoded True


decodeTime : Decode.Decoder Float
decodeTime =
    Decode.at [ "time" ] Decode.float


fetchUrl : String -> String
fetchUrl =
    (++) "/api/game/"
