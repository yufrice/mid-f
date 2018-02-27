module Game.Subscription exposing (newTime)

import Game.Msg exposing (Msg(..))
import Time exposing (Time, minute, second)


newTime : Time -> Sub Msg
newTime time =
    Time.every second Count
