module Game.View exposing (gameView)

import Bootstrap.Alert as Alert
import Game.Model exposing (Game)
import Game.Update exposing (..)
import Html exposing (..)


gameView : Game -> Html Msg
gameView game =
    Alert.warning [ text game.state ]
