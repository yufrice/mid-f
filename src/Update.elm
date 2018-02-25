module Update exposing (update)

import Commands exposing (..)
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

        UpdateId subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )

        UpdateName subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )
