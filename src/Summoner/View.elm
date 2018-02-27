module Summoner.View exposing (..)

import Bootstrap.Table as Table
import Date exposing (Date, fromTime)
import Date.Format exposing (format)
import Html exposing (..)
import Msg exposing (..)
import Summoner.Model exposing (Summoner)


summonerView : List Summoner -> Date -> Html Msg
summonerView summoners date =
    Table.table
        { options = [ Table.striped, Table.hover ]
        , thead = Table.simpleThead []
        , tbody =
            Table.tbody []
                (List.map2
                    summonerRow
                    summoners
                 <|
                    List.repeat 10 date
                )
        }


timeView : Date -> Html Msg
timeView =
    text << format "%M:%S"


summonerRow : Summoner -> Date -> Table.Row Msg
summonerRow summoner date =
    Table.tr []
        [ Table.td [] [ text summoner.name ]
        , Table.td [] [ text summoner.rank ]
        , Table.td [] [ text summoner.champ ]
        , Table.td [] [ timeView date ]
        ]
