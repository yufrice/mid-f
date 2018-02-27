module View exposing (view)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Navbar as Navbar
import Game.View exposing (gameView)
import Html exposing (..)
import Html.Attributes exposing (class, href, value)
import Html.Lazy exposing (lazy2)
import Models exposing (Model)
import Msg exposing (..)
import User.Model exposing (User)
import User.View exposing (inputView, userView)


initView : { model | user : User } -> Html Msg
initView model =
    div
        [ class "input-group" ]
        [ Html.map UpdateName (inputView model.user)
        , span [ class "input-group-btn" ]
            [ Button.button [ Button.outlineSuccess, Button.attrs [ class "ml-1" ], Button.onClick Init ] [ text "" ] ]
        ]


view : Model -> Html Msg
view model =
    lazy2
        div
        []
        [ CDN.stylesheet
        , Grid.container []
            [ div [ class "navbar navbar-default" ]
                [ a [ class "navbar-brand d-inline-block align-top", href "#" ] [ text "" ]
                ]
            ]
        , Grid.container []
            [ Grid.row [ Row.middleXs ]
                [ Grid.col []
                    [ initView model ]
                , Grid.col []
                    [ Html.map (\_ -> None) (userView model.user) ]
                ]
            ]
        , Grid.container []
            [ Grid.row [ Row.middleXs ]
                [ Grid.col []
                    [ Html.map (\_ -> None) (gameView model.game) ]
                ]
            ]
        ]
