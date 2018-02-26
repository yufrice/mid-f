module Msg exposing (Msg(..))

import Game.Update
import Http
import User.Update


type Msg
    = None
    | Init
    | UpdateId User.Update.Msg
    | UpdateGame Game.Update.Msg
    | UpdateName User.Update.Msg
    | UpdateTime Game.Update.Msg
