module Main exposing (main)

import Html exposing (program)
import Models exposing (..)
import Time exposing (Time, second)
import Update exposing (..)
import View exposing (..)


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--Time.every second Increment


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
