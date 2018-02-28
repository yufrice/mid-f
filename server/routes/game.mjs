'use strict';
import Router from 'koa-router';
import fetch from 'node-fetch';
import {champ} from './champ.mjs';
import {spell} from './spell.mjs';
import {patch} from './patchVersion.mjs';
import {options, URL} from './url.mjs';

export const game = new Router({
    prefix: '/game'
});

game.get('/', (ctx) => {
    ctx.body = 'game';
});

game.get('/0', (ctx) => {
    ctx.status = 400;
    ctx.body = 'wait';
});

game.get('/:id',
    (async (ctx) => {
        const url = URL.game + ctx.params.id;
        try {
            const response = await fetch(url, options);
            if (response.status == 200) {
                const json = await response.json();
                ctx.status = 200;
                ctx.summoners = [];

                const champData = await champ;
                const spellData = await spell;
                const cdnData = await patch;
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
                        champ: await champData['id'+item.championId],
                        dSpell: await spellData['id'+item.spell1Id]['name'],
                        dTime: await spellData['id'+item.spell1Id]['cd'],
                        fSpell: await spellData['id'+item.spell2Id]['name'],
                        fTime: await spellData['id'+item.spell2Id]['cd'],
                        modit: 0
                    });
                }
                const gameStartTime = new Date(json.gameStartTime);
                const nowTime = await Date.now();
                ctx.body = {
                    summoners: ctx.summoners,
                    cdn: {
                        uri: cdnData.cdn, 
                        version: cdnData.version,
                        time: (nowTime - gameStartTime)
                    },
                    time: (nowTime - gameStartTime),
                    state: true
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