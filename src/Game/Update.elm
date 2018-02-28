module Game.Update exposing (..)

import Game.Model exposing (..)
import Game.Msg exposing (Msg(..))
import Summoner.Update exposing (update)


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        None ->
            ( game, Cmd.none )

        Init (Ok initGame) ->
            ( initGame, Cmd.none )

        Init (Err _) ->
            ( { game | state = False }, Cmd.none )

        Update subMsg ->
            let
                ( updateContext, contexCmd ) =
                    Summoner.Update.update subMsg game.context
            in
            ( { game | context = updateContext }, Cmd.none )
