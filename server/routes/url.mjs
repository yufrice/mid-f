import dotenv from 'dotenv';
dotenv.config();

const developerKey = process.env.NODE_API_KEY;
const region = process.env.NODE_REGION;
const subRegion = process.env.NODE_SUB_REGION;
const RiotApi = 'https://' + region + '.api.riotgames.com/lol';
const SubRiotApi = 'https://' + subRegion + '.api.riotgames.com/lol';
export const options = {
    'method' : 'GET',
    headers: {'X-Riot-Token' : developerKey}
};

export const URL = {};
URL.id = RiotApi + '/summoner/v3/summoners/by-name/';
URL.rank = RiotApi + '/league/v3/positions/by-summoner/';
URL.game = RiotApi + '/spectator/v3/active-games/by-summoner/';
URL.champ = SubRiotApi + '/static-data/v3/champions';