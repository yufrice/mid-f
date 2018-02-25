'use strict';
import Router from 'koa-router';
import request from 'request';
import fetch from 'node-fetch';
import json from 'koa-json';
import {options, URL} from './url.mjs';

export const game = new Router({
    prefix: '/game'
});

game.get('/', (ctx, next) => {
    ctx.body = 'game';
});

game.get('/:id',
    (async (ctx, next) => {
        const url = URL.game + ctx.params.id;
    try {
        const response = await fetch(url, options);
        console.log(response.status);
        if (response.status == 200) {
            const json = await response.json();
            ctx.status = 400;
            ctx.summoners = [];
            for(let item of json.participants){
                const rankUrl = URL.rank + item.summonerId;
                const rankRes = await fetch(rankUrl, options);
                const rankJson = await rankRes.json();
                if(rankJson[0]){
                    ctx.rank = await rankJson[0].tier;
                }else{
                    ctx.rank = 'unRanked';
                }
                ctx.summoners.unshift ({
                    name: item.summonerName,
                    rank: ctx.rank,
                    champ: item.championId
                });
            }
            ctx.body = {
                summoners: ctx.summoners,
                time: json.gameStartTime,
                state: json.gameType
            };
        } else if (response.status == 403) {
            ctx.status = 400;
            ctx.body = { state: 100 };
        } else if (response.status == 404) {
            ctx.status = 400;
            ctx.body = { state: 120 };
        }
    } catch (err) {
        console.log(err);
    }
    })
);