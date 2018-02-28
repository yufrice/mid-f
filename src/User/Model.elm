module User.Model exposing (User)


type alias User =
    { name : String
    , id : Int
    , rank : String
    , state : String
    }
