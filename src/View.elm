module View exposing (view)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Game.View exposing (gameView)
import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Lazy exposing (lazy2)
import Models exposing (Model)
import Msg exposing (..)
import User.View exposing (inputView)


--timeView model = div [] [text (toString <| model.time)]
--, div [] [ text model.entry ]
--, div [] [ text "test" ]


initView model =
    div
        [ class "input-group" ]
        [ Html.map UpdateName (inputView model.user)
        , span [ class "input-group-btn" ]
            [ Button.button [ Button.outlineSuccess, Button.attrs [ class "ml-1" ], Button.onClick Init ] [ text "" ] ]
        ]


view : Model -> Html Msg
view model =
    lazy2 Grid.container
        []
        [ CDN.stylesheet
        , Grid.row []
            [ Grid.col []
                [ initView model ]
            , Grid.col []
                [ Html.map (\_ -> None) (gameView model.game) ]
            , Grid.col []
                [ text model.user.rank ]
            , Grid.col []
                [ text model.user.state ]
            ]
        ]
