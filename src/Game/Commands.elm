module Game.Commands exposing (fetchGame, fetchTime)

import Game.Model exposing (Game)
import Game.Msg exposing (Msg(..))
import Http
import Json.Decode as Decode
import Summoner.Model exposing (Summoner)


fetchGame : String -> Cmd Msg
fetchGame name =
    Cmd.batch [ fetchTime name ]


fetchTime : String -> Cmd Msg
fetchTime name =
    Http.send Init <| Http.get (fetchUrl name) decodeTime


decodeGame : Decode.Decoder Game
decodeGame =
    Decode.map3 Game
        (Decode.field "summoner" Decode.list)
        (Decode.field
            "time"
            Decode.float
        )
        (Decode.field
            "state"
            Decode.bool
        )


decodeSummoner : Decode.Decoder Summoner
decodeSummoner =
    Decode.map3 Summoner
        (Decode.field "name" Decode.string)
        (Decode.field "rank" Decode.string)
        (Decode.field "champ" Decode.string)


decodeTime : Decode.Decoder Float
decodeTime =
    Decode.at [ "time" ] Decode.float


fetchUrl : String -> String
fetchUrl =
    (++) "/api/game/"
