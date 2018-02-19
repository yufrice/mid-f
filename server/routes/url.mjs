import dotenv from 'dotenv';
dotenv.config();

const developerKey = process.env.NODE_API_KEY;
export const options = {
    'method' : 'GET',
    headers: {'X-Riot-Token' : developerKey}
};

export const URL = {};
URL.id = 'https://jp1.api.riotgames.com/lol/summoner/v3/summoners/by-name/';
URL.rank = 'https://jp1.api.riotgames.com/lol/league/v3/positions/by-summoner/';
URL.game = 'https://jp1.api.riotgames.com/lol/spectator/v3/active-games/by-summoner/';