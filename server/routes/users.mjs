'use strict';
import Router from 'koa-router';
import {id} from './id.mjs';

export const users = new Router({
    prefix: '/users'
});

users.get('/', (ctx) => {
    ctx.body = 'users';
});

users
    .use(id.routes(), id.allowedMethods());