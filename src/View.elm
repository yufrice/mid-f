module View exposing (view)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Form.Input as Input
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onClick, onInput)
import Models exposing (Model)
import Summoner.View exposing (summonerView)
import Update exposing (..)
import User.View exposing (inputView)


--timeView model = div [] [text (toString <| model.time)]
--, div [] [ text model.entry ]
--, div [] [ text "test" ]


initView model =
    div
        [ class "input-group" ]
        [ Html.map InitName (inputView model.user)
        , span [ class "input-group-btn" ]
            [ Button.button [] [ text "" ] ]
        ]


view : Model -> Html Msg
view model =
    Grid.container []
        [ CDN.stylesheet
        , Grid.row []
            [ Grid.col [ Col.md8 ]
                [ text model.user.name ]
            , Grid.col [ Col.md10 ]
                [ initView
                    model
                ]
            ]
        ]
