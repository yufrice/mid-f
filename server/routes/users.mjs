'use strict';
import Router from 'koa-router';
import request from 'request';
import fetch from 'node-fetch';
import json from 'koa-json';
import {id} from './id.mjs';
import {options, URL} from './url.mjs';

export const users = new Router({
  prefix: '/users'
});

users.get('/', (ctx,next) => {
  ctx.body = 'users';
});

users
  .use(id.routes(), id.allowedMethods());