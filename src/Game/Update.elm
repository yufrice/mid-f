module Game.Update exposing (..)

import Game.Model exposing (..)
import Http
import Time exposing (Time, millisecond)


type Msg
    = Init (Result Http.Error Time)
    | Count Time


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        Init (Ok time) ->
            ( { game | state = True, time = time }, Cmd.none )

        Init (Err _) ->
            ( { game | state = False, time = 0 }, Cmd.none )

        Count newTime ->
            ( { game | time = game.time + 1000 }, Cmd.none )
