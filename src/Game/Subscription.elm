module Game.Subscription exposing (newTime)

import Game.Update exposing (Msg(..))
import Time exposing (Time, second)


newTime : Time -> Sub Msg
newTime time =
    Time.every second Count
