module Msg exposing (Msg(..))

import Game.Update
import Time exposing (Time)
import User.Update


type Msg
    = None
    | Init
    | Update Time
    | UpdateId User.Update.Msg
    | UpdateGame Game.Update.Msg
    | UpdateName User.Update.Msg
    | UpdateTime Game.Update.Msg
