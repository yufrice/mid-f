module Main exposing (main)

import Html exposing (program)
import Models exposing (..)
import Msg exposing (Msg(..))
import Subscriptions exposing (..)
import Update exposing (..)
import View exposing (..)


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



--Time.every second Increment


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
