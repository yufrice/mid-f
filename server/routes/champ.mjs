'use strict';
import fetch from 'node-fetch';
import json from 'koa-json';
import {options, URL} from './url.mjs';


export const champ = (async () => {
        console.log('init champ data');
        const params = '?locale=en_US&dataById=false';
        const url = URL.champ + params;
        const responce = await fetch(url, options);
        const json = await responce.json();
        const champData = {};
        for (let champ in json.data){
            champData['id' + json.data[champ].id] = json.data[champ].name;
        }
        return champData;
})();