'use strict';
import Router from 'koa-router';
import request from 'request';
import fetch from 'node-fetch';
import json from 'koa-json';
import {options, URL} from './url.mjs';


export const id = new Router({
    prefix: '/id'
});

id.get('/', (ctx, next) => {
    ctx.body = 'id';
});

id.get('/:id', 
    (async (ctx, next) => {
        const url = URL.id + ctx.params.id;
        try {
            const response = await fetch(url, options);
            if(response.status == 200){
                const json = await response.json();
                ctx.id = json.id;
                ctx.user = json.name;
                await next();
            }else if(response.status == 403) {
                ctx.status = 400;
                ctx.body = { state: 100 };
            }else if(response.status == 404){
                ctx.status = 400;
                ctx.body = { state: 110 };
            }
        } catch (err) {
            console.log(err);
        }
    }),
    (async (ctx) => {
        const url = URL.rank + ctx.id;
        try {
            const response = await fetch(url, options);
            const json = await response.json();

            if(json[0]){
                ctx.rank = await json[0].tier;
            } else {
                ctx.rank = 'unRanked';
            }
            ctx.body = { 
                state: 200,
                name: ctx.user,
                id: ctx.id,
                rank: ctx.rank
            };
        } catch (err) {
            console.log(err);
        }
    })
);