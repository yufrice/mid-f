module User.Commands exposing (fetchUser)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import User.Model exposing (..)
import User.Update exposing (..)


fetchUser : User -> Cmd Msg
fetchUser user =
    Http.send Fetch <| Http.get (fetchUrl user.name) decodeUser


decodeUser : Decode.Decoder User
decodeUser =
    Decode.succeed User
        |> required "name" Decode.string
        |> required "id" Decode.int
        |> required "rank" Decode.string
        |> hardcoded ""


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/id/"
