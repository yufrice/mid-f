'use strict';
import Koa from 'koa';
import Router from 'koa-router';
import Static from 'koa-static';
import { users } from './routes/users.mjs';
import { game } from './routes/game.mjs';

const router = new Router({
    prefix: '/api'
});

router
    .use(users.routes(), users.allowedMethods())
    .use(game.routes(), game.allowedMethods());

const app = new Koa();

app.use(async (ctx, next) => {
    const start = new Date();
    await next();
    const ms = new Date() - start;
    console.log(`${ctx.method} ${ctx.url} - ${ms}ms`);
});

app.use(async (ctx, next) => {
    try {
        await next();
    } catch (err) {
        ctx.body = { message: err.message };
        ctx.status = err.status || 500;
        console.log(err);
    }
});

app
    .use(router.routes())
    .use(router.allowedMethods())
    .use(Static(process.cwd() + '/dist'));

app.listen(3000);
console.log('listen localhost:3000');
