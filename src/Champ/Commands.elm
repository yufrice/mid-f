module Champ.Commands exposing (decodeChamp)

import Champ.Model exposing (Champ)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)


decodeChamp : Decode.Decoder Champ
decodeChamp =
    Decode.succeed Champ
        |> required "name" Decode.string
