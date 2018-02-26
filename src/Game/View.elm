module Game.View exposing (gameView)

import Bootstrap.Alert as Alert
import Date exposing (Date, fromTime, minute, second)
import Game.Model exposing (Game)
import Game.Update exposing (..)
import Html exposing (..)


gameView : Game -> Html Msg
gameView game =
    case game.state of
        True ->
            text <| unix2Date <| fromTime game.time

        _ ->
            Alert.warning [ text "not gamed" ]


unix2Date : Date -> String
unix2Date time =
    (++) (toString <| minute time) <| (++) ":" <| toString <| second time
