module User.Commands exposing (fetchUser)

import Http
import Json.Decode as Decode
import User.Model exposing (..)
import User.Update exposing (..)


fetchUser : User -> Cmd Msg
fetchUser user =
    Http.send Fetch <| Http.get (fetchUrl user.name) decodeJson


decodeJson : Decode.Decoder String
decodeJson =
    Decode.at [ "rank" ] Decode.string


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/id/"
