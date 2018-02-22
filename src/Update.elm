module Update exposing (Msg(..), update)

import Models exposing (Model)
import User.Update


--import Time exposing (Time)


type Msg
    = None
    | Init
    | InitName User.Update.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        Init ->
            ( model, Cmd.none )

        InitName subMsg ->
            let
                ( updateUser, userCmd ) =
                    User.Update.update subMsg model.user
            in
            ( { model | user = updateUser }, Cmd.none )
