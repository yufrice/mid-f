module Game.Msg exposing (Msg(..))

import Http
import Time exposing (Time, millisecond)


type Msg
    = Init (Result Http.Error Time)
    | Count Time
