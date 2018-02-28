'use strict';
import fetch from 'node-fetch';
import {options, URL} from './url.mjs';

export const spell = (async () => {
    console.log('init spell data');
    const params = '?locale=en_US&dataById=false&tags=cooldown';
    const url = URL.spell + params;
    const responce = await fetch(url, options);
    const json = await responce.json();
    const spellData= {};
    for (let spell in json.data){
        spellData['id' + json.data[spell].id]
                = { 
                name: json.data[spell].key,
                cd: json.data[spell].cooldown[0] * 1000
            };
    }
    return spellData;
})();