module Game.Update exposing (..)

import Game.Model exposing (..)
import Http


type Msg
    = Init


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        Init ->
            ( game, Cmd.none )
