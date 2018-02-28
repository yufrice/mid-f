module Game.Subscription exposing (newTime)

import Game.Model exposing (Game)
import Game.Msg exposing (Msg(..))
import Summoner.Subscription exposing (newTime)


newTime : Game -> Sub Msg
newTime game =
    Sub.map Update <|
        Summoner.Subscription.newTime game.context.time
