module Game.Commands exposing (fetchGame, updateTime)

import Game.Model exposing (Game)
import Game.Msg exposing (Msg(..))
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import Summoner.Commands exposing (..)


fetchGame : Int -> Cmd Msg
fetchGame id =
    Http.send Init <| Http.get (fetchUrl <| toString id) decodeGame


decodeGame : Decode.Decoder Game
decodeGame =
    Decode.succeed Game
        |> required "summoners" (Decode.list decodeSummoner)
        |> required "cdn" decodeContext
        |> hardcoded True


updateTime : Int -> Cmd Msg
updateTime id =
    Cmd.map Update <| fetchTime id


fetchUrl : String -> String
fetchUrl =
    (++) "/api/game/"
