module User.View exposing (inputView)

import Bootstrap.Form.Input as Input
import Html exposing (..)
import User.Model exposing (User)
import User.Update exposing (..)


inputView : User -> Html Msg
inputView user =
    Input.text
        [ Input.placeholder "SummonerName"
        , Input.onInput Update
        ]
