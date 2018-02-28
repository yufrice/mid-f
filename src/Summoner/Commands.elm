module Summoner.Commands exposing (decodeContext, decodeSummoner, fetchTime)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import Summoner.Model exposing (Context, Summoner)
import Summoner.Update exposing (..)


decodeSummoner : Decode.Decoder Summoner
decodeSummoner =
    Decode.succeed Summoner
        |> required "name" Decode.string
        |> required "rank" Decode.string
        |> required "champ" Decode.string
        |> required "dSpell" Decode.string
        |> required "dTime" Decode.float
        |> required "fSpell" Decode.string
        |> required "fTime" Decode.float
        |> required "modit" Decode.float


decodeContext : Decode.Decoder Context
decodeContext =
    Decode.succeed Context
        |> required "uri" Decode.string
        |> required "version" Decode.string
        |> required "time" Decode.float
        |> hardcoded True


fetchTime : Int -> Cmd Msg
fetchTime id =
    Http.send Fetch <| Http.get (fetchUrl <| toString id) decodeTime


decodeTime : Decode.Decoder Float
decodeTime =
    Decode.at [ "time" ] Decode.float


fetchUrl : String -> String
fetchUrl =
    (++) "/api/game/"
