module Commands exposing (fetch)

import Game.Commands exposing (..)
import Http
import Json.Decode as Decode
import Models exposing (..)
import Msg exposing (..)
import User.Commands exposing (..)


fetch : Model -> Cmd Msg
fetch model =
    --Cmd.map UpdateId <| fetchUser model.user
    Cmd.batch
        [ Cmd.map UpdateId <| fetchUser model.user
        , Cmd.map UpdateGame <| fetchGame model.user.name
        ]
