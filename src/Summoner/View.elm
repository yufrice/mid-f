module Summoner.View exposing (..)

import Html exposing (..)
import Update exposing (..)
import Summoner.Model exposing (Summoner)

summonerView : List Summoner-> Html Msg
summonerView summoners =
    div [] [tbody [] (List.map summonerRow summoners)]

summonerRow : Summoner -> Html Msg
summonerRow summoner =
    tr []
        [ td [] [ text summoner.name]
        , td [] [ text summoner.rank]
        , td [] []
    ]