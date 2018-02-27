module Game.Msg exposing (Msg(..))

import Game.Model exposing (..)
import Http
import Time exposing (Time, millisecond)


type Msg
    = Init (Result Http.Error Game)
    | Update (Result Http.Error Time)
    | Count Time
