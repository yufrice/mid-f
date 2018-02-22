module User.View exposing (inputView)

import Bootstrap.Form.Input as Input
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (..)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)
import Summoner.View exposing (summonerView)
import User.Model exposing (User)
import User.Update exposing (..)


inputView : User -> Html Msg
inputView user =
    Input.text
        [ Input.placeholder "SummonerName"
        , Input.onInput Update
        ]
