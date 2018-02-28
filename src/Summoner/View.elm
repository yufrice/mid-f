module Summoner.View exposing (..)

import Bootstrap.Table as Table
import Date exposing (Date, fromTime, toTime)
import Date.Format exposing (format)
import Html exposing (..)
import Html.Attributes exposing (class, src)
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


champView : List String -> Attribute Msg
champView =
    src
        << (++) "http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/"
        << String.concat
        << List.reverse
        << List.append [ ".png" ]


dataMap : List Time -> Date
dataMap =
    fromTime
        << List.foldr (+) 0


summonerRow : Summoner -> Context -> Table.Row Msg
summonerRow summoner context =
    Table.tr []
        [ Table.td [] [ text summoner.name ]
        , Table.td [] [ text summoner.rank ]
        , Table.td [] [ div [] [ img [ champView [ summoner.champ ], class "img-fluid" ] [], text summoner.champ ] ]
        , Table.td [] [ div [] [ text summoner.dSpell, timeView <| dataMap [ context.time, summoner.dTime ] ] ]
        , Table.td [] [ div [] [ text summoner.fSpell, timeView <| dataMap [ context.time, summoner.fTime ] ] ]
        ]
