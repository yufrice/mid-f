module Summoner.View exposing (..)

import Bootstrap.Table as Table
import Date exposing (Date, fromTime, toTime)
import Date.Format exposing (format)
import Html exposing (..)
import Html.Attributes exposing (src, style)
import Msg exposing (..)
import Summoner.Model exposing (Context, Summoner)
import Time exposing (Time)


summonerView : List Summoner -> Context -> Html Msg
summonerView summoners context =
    Table.table
        { options = [ Table.striped, Table.hover ]
        , thead = Table.simpleThead []
        , tbody =
            Table.tbody []
                (List.map2
                    summonerRow
                    summoners
                 <|
                    List.repeat 10 context
                )
        }


timeView : Date -> Html Msg
timeView =
    text << format "%M:%S"


srcView : List String -> Attribute Msg
srcView =
    src
        << flip String.append ".png"
        << String.join "/"


champView : String -> Context -> Html Msg
champView champ context =
    img
        [ srcView [ context.uri, context.version, "img/champion", champ ]
        , style
            [ ( "height", "50px" )
            , ( "weight", "100%" )
            ]
        ]
        []


spellView : String -> Context -> Html Msg
spellView spell context =
    img
        [ srcView [ context.uri, context.version, "img/spell", spell ]
        , style
            [ ( "height", "40px" )
            , ( "weight", "100%" )
            ]
        ]
        []


dataMap : List Time -> Date
dataMap =
    fromTime
        << List.foldr (+) 0


summonerRow : Summoner -> Context -> Table.Row Msg
summonerRow summoner context =
    Table.tr []
        [ Table.td [] [ text summoner.name ]
        , Table.td [] [ text summoner.rank ]
        , Table.td [] [ champView summoner.champ context ]
        , Table.td [] [ div [] [ spellView summoner.dSpell context, timeView <| dataMap [ context.time, summoner.dTime ] ] ]
        , Table.td [] [ div [] [ spellView summoner.fSpell context, timeView <| dataMap [ context.time, summoner.fTime ] ] ]
        ]
