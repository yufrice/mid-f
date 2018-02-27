'use strict';
import Router from 'koa-router';
import request from 'request';
import fetch from 'node-fetch';
import json from 'koa-json';
import {champ} from './champ.mjs';
import {options, URL} from './url.mjs';

export const game = new Router({
    prefix: '/game'
});

game.get('/', (ctx, next) => {
    ctx.body = 'game';
});

game.get('/:name',
    (async (ctx, next) => {
        const url = URL.id + encodeURI(ctx.params.name);
        try {
            const response = await fetch(url, options);
            const json = await response.json();
            ctx.id = json.id;
            await next();
        } catch(err) {
            console.log(err);
        }
    })
    ,(async (ctx) => {
        const url = URL.game + ctx.id;
    try {
        const response = await fetch(url, options);
        console.log(response.status);
        if (response.status == 200) {
            const json = await response.json();
            ctx.status = 200;
            ctx.summoners = [];

            const champData = await champ;
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
                    champ: await champData['id'+item.championId]
                });
            }
            const gameStartTime = new Date(json.gameStartTime);
            const nowTime = await Date.now();
            ctx.body = {
                summoners: ctx.summoners,
                time: (nowTime - gameStartTime),
                state: 'true'
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