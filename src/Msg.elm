module Msg exposing (Msg(..))

import Http
import User.Update


type Msg
    = None
    | Init
    | UpdateId User.Update.Msg
    | UpdateName User.Update.Msg
