module User.View exposing (inputView, userView)

import Bootstrap.Alert as Alert
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


userView : User -> Html Msg
userView user =
    case String.isEmpty user.state of
        True ->
            text user.rank

        _ ->
            Alert.warning [ text user.state ]
