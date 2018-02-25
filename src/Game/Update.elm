module Game.Update exposing (..)

import Game.Model exposing (..)
import Http


type Msg
    = Init (Result Http.Error String)


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        Init (Ok string) ->
            ( { game | state = string }, Cmd.none )

        Init (Err _) ->
            ( { game | state = "not gamed" }, Cmd.none )
