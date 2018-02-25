module User.Update exposing (Msg(..), update)

import Http
import User.Model exposing (User)


type Msg
    = Update String
    | Fetch (Result Http.Error String)


update : Msg -> User -> ( User, Cmd Msg )
update msg user =
    case msg of
        Update string ->
            ( { user | name = string }, Cmd.none )

        Fetch (Ok string) ->
            ( { user | state = "", rank = string }, Cmd.none )

        Fetch (Err _) ->
            ( { user | state = "UserNotFound", rank = "" }, Cmd.none )
