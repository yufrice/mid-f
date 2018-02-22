module User.Update exposing (Msg(..), update)

import User.Model exposing (User)


type Msg
    = Update String


update : Msg -> User -> ( User, Cmd Msg )
update msg model =
    case msg of
        Update string ->
            ( { model | name = string }, Cmd.none )
