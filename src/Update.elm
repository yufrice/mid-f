module Update exposing (Msg(..), update)
import Models exposing (Model)
import Time exposing (Time)

type Msg = InitName String | Init | Increment Time

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
    Init ->
        (model, Cmd.none)
    InitName input ->
        ({model | entry = input}, Cmd.none)
    Increment time ->
        ({model | time = model.time + 1.0}, Cmd.none)