module Msg exposing (Msg(..))

import Game.Msg
import Time exposing (Time)
import User.Update


type Msg
    = None
    | Init
    | Update Time
    | UpdateId User.Update.Msg
    | UpdateGame Game.Msg.Msg
    | UpdateName User.Update.Msg
    | UpdateTime Game.Msg.Msg
