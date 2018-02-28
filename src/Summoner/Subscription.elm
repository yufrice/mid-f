module Summoner.Subscription exposing (newTime)

import Summoner.Update exposing (Msg(..))
import Time exposing (Time, second)


newTime : Time -> Sub Msg
newTime time =
    Time.every second Count
