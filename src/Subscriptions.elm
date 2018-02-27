module Subscriptions exposing (subscriptions)

import Game.Subscription exposing (newTime)
import Models exposing (Model)
import Msg exposing (Msg(..))
import Time exposing (Time, minute)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map UpdateTime <| Game.Subscription.newTime model.game.time
        , Time.every minute Update
        ]
