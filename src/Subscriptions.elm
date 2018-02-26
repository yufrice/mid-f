module Subscriptions exposing (subscriptions)

import Game.Subscription exposing (newTime)
import Models exposing (Model)
import Msg exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map UpdateTime <| Game.Subscription.newTime model.game.time
