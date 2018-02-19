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