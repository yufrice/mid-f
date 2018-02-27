module Commands exposing (fetch, updateFetch)

import Game.Commands exposing (..)
import Models exposing (..)
import Msg exposing (..)
import User.Commands exposing (..)


fetch : Model -> Cmd Msg
fetch model =
    Cmd.batch
        [ Cmd.map UpdateId <| fetchUser model.user
        , Cmd.map UpdateGame <| fetchGame model.user.name
        ]


updateFetch : Model -> Cmd Msg
updateFetch model =
    Cmd.map UpdateGame <| fetchTime model.user.name
