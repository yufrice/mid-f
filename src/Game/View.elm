module Game.View exposing (gameView)

import Bootstrap.Alert as Alert
import Date exposing (Date, fromTime)
import Date.Format exposing (format)
import Game.Model exposing (Game)
import Game.Update exposing (..)
import Html exposing (..)


gameView : Game -> Html Msg
gameView game =
    case game.state of
        True ->
            timeView <| fromTime game.time

        _ ->
            Alert.warning [ text "not gamed" ]


timeView : Date -> Html Msg
timeView =
    text << format "%M:%S"
