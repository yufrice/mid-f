module Game.View exposing (gameView)

import Bootstrap.Alert as Alert
import Date exposing (Date, fromTime)
import Date.Format exposing (format)
import Game.Model exposing (Game)
import Game.Msg exposing (Msg(..))
import Html exposing (..)
import Summoner.View exposing (summonerView)


gameView : Game -> Html Msg
gameView game =
    case game.state of
        True ->
            div []
                [ timeView <| fromTime game.context.time
                , Html.map (\_ -> None) <| summonerView game.summoners game.context
                ]

        _ ->
            Alert.warning [ text "not gamed" ]


timeView : Date -> Html Msg
timeView =
    text << format "%M:%S"
