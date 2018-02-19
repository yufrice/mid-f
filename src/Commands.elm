module Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Models exposing (..)
import Update exposing (..)


fetchId : String -> Cmd Msg
fetchId name =
    Cmd.none
