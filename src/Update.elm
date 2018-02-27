module Update exposing (update)

import Commands exposing (..)
import Game.Update
import Models exposing (Model)
import Msg exposing (Msg(..))
import User.Update


--import Time exposing (Time)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        Init ->
            ( model, fetch model )

        Update _ ->
            ( model, updateFetch model )

        UpdateId subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )

        UpdateGame subMsg ->
            let
                ( updateGame, gameCmd ) =
                    Game.Update.update subMsg model.game
            in
            ( { model | game = updateGame }, Cmd.none )

        UpdateName subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )

        UpdateTime subMsg ->
            let
                ( updateGame, userCmd ) =
                    Game.Update.update subMsg model.game
            in
            ( { model | game = updateGame }, Cmd.none )
