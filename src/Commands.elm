module Commands exposing (fetch)

import Http
import Json.Decode as Decode
import Models exposing (..)
import Msg exposing (..)
import User.Commands exposing (..)


fetch : Model -> Cmd Msg
fetch model =
    Cmd.map UpdateId <| fetchId model.user
