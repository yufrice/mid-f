module Commands exposing (fetch, updateFetch)

import Game.Commands exposing (..)
import Models exposing (..)
import Msg exposing (..)
import User.Commands exposing (..)


fetch : Model -> Cmd Msg
fetch model =
    Cmd.batch
        [ Cmd.map UpdateUser <| fetchUser model.user
        , Cmd.map UpdateGame <| fetchGame model.user.id
        ]


updateFetch : Model -> Cmd Msg
updateFetch model =
    Cmd.map UpdateGame <| updateTime model.user.id
