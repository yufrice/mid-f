module View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Form.Input as Input
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Button as Button
import Update exposing (..)
import Models exposing (Model)
import Summoner.View exposing (summonerView)

timeView model = div [] [text (toString <| model.time)]

inputView : Model -> Html Msg
inputView model = 
            div []
            [ InputGroup.config
                ( InputGroup.text 
                    [ Input.placeholder "SummonerName"
                    , Input.onInput InitName
                    ]
                )
                |> InputGroup.successors
                    [ InputGroup.button
                        [ Button.secondary
                        , Button.attrs [onClick <| Init]
                        ]
                        [ text "はい"] ]
                |> InputGroup.view
                , div [] [ text model.entry ]
            ]

view : Model -> Html Msg
view model =
   Grid.container []
    [ CDN.stylesheet
    , Grid.row []
        [ Grid.col [ Col.md8 ]
            [timeView model]
        , Grid.col [ Col.md12]
            [ inputView model ]
        ]
    ]