module User.Commands exposing (fetchId)

import Http
import Json.Decode as Decode
import User.Model exposing (..)
import User.Update exposing (..)


fetchId : User -> Cmd Msg
fetchId user =
    Http.send Fetch <| Http.get (fetchUrl user.name) decodeJson


decodeJson : Decode.Decoder String
decodeJson =
    Decode.at [ "rank" ] Decode.string



--decodeJson =


fetchUrl : String -> String
fetchUrl =
    (++) "/api/users/id/"
