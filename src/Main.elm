module Main exposing (main)

import Html exposing (program)
import Time exposing (Time, second)
import Models exposing (..)
import Update exposing (..)
import View exposing (..)



init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Increment


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
