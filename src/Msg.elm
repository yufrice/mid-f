module Msg exposing (Msg(..))

import Game.Msg
import Time exposing (Time)
import User.Update


type Msg
    = None
    | Init
    | Update Time
    | UpdateGame Game.Msg.Msg
    | UpdateUser User.Update.Msg
