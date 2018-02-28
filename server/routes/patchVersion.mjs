'use strict';
import fetch from 'node-fetch';
import {options, URL} from './url.mjs';


export const patch = (async () => {
    console.log('init patch data');
    const url = URL.patch;
    const responce = await fetch(url, options);
    const json = await responce.json();
    const patchData = {
        cdn: json.cdn,
        version: json.v
    };
    return patchData;
})();