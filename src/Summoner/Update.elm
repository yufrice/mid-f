module Summoner.Update exposing (Msg(..), update)

import Http
import Summoner.Model exposing (Context)
import Time exposing (Time)


type Msg
    = Fetch (Result Http.Error Float)
    | Count Time


update : Msg -> Context -> ( Context, Cmd Msg )
update msg context =
    case msg of
        Fetch (Ok newTime) ->
            ( { context | time = newTime }, Cmd.none )

        Fetch (Err _) ->
            ( { context | time = 0 }, Cmd.none )

        Count newTime ->
            ( { context | time = context.time + 1000 }, Cmd.none )
