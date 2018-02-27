module Summoner.View exposing (..)

import Bootstrap.Table as Table
import Date exposing (Date, fromTime, toTime)
import Date.Format exposing (format)
import Html exposing (..)
import Msg exposing (..)
import Summoner.Model exposing (Summoner)
import Time exposing (Time)


summonerView : List Summoner -> Time -> Html Msg
summonerView summoners time =
    Table.table
        { options = [ Table.striped, Table.hover ]
        , thead = Table.simpleThead []
        , tbody =
            Table.tbody []
                (List.map2
                    summonerRow
                    summoners
                 <|
                    List.repeat 10 time
                )
        }


timeView : Date -> Html Msg
timeView =
    text << format "%M:%S"


dataMap : List Time -> Date
dataMap =
    fromTime
        << List.foldr (+) 0


summonerRow : Summoner -> Time -> Table.Row Msg
summonerRow summoner time =
    Table.tr []
        [ Table.td [] [ text summoner.name ]
        , Table.td [] [ text summoner.rank ]
        , Table.td [] [ text summoner.champ ]
        , Table.td [] [ div [] [ text summoner.dSpell, timeView <| dataMap [ time, summoner.dTime ] ] ]
        , Table.td [] [ div [] [ text summoner.fSpell, timeView <| dataMap [ time, summoner.fTime ] ] ]
        ]
