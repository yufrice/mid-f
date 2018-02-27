module Subscriptions exposing (subscriptions)

import Game.Subscription exposing (newTime)
import Models exposing (Model)
import Msg exposing (Msg(..))
import Time exposing (Time, minute)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map UpdateGame <|
            Game.Subscription.newTime model.game.time
        , gameUpdate model
        ]


gameUpdate : Model -> Sub Msg
gameUpdate model =
    case model.game.state of
        True ->
            Time.every minute Update

        False ->
            Sub.none
