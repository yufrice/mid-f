module Game.Update exposing (..)

import Game.Commands exposing (..)
import Game.Model exposing (..)
import Game.Msg exposing (Msg(..))


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        None ->
            ( game, Cmd.none )

        Init (Ok initGame) ->
            ( initGame, Cmd.none )

        Init (Err _) ->
            ( { game | state = False, time = 0 }, Cmd.none )

        Update (Ok time) ->
            ( { game | time = time }, Cmd.none )

        Update (Err _) ->
            ( { game | state = False, time = 0 }, Cmd.none )

        Count newTime ->
            ( { game | time = game.time + 1000 }, Cmd.none )
