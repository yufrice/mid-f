module Summoner.Commands exposing (decodeSummoner)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import Summoner.Model exposing (Summoner)


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
