module Update exposing (update)

import Commands exposing (..)
import Game.Update
import Models exposing (Model)
import Msg exposing (Msg(..))
import User.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        Init ->
            ( model, fetch model )

        Update _ ->
            ( model, updateFetch model )

        UpdateGame subMsg ->
            let
                ( updateGame, gameCmd ) =
                    Game.Update.update subMsg model.game
            in
            ( { model | game = updateGame }, Cmd.none )

        UpdateUser subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )
