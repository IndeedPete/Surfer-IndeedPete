_weatherTemplates = [
	["CLEAR",
		["SUNNY",[0,1,5],[0.30,0,0,1,1], [1, 0.9, 0.001, [-2.08, -1.55, -1.9, 0.013],[1.69, 0.21, 0.79, 1.64],[-0.21, -1.08, 0.91, -0.09]]],
		["OVERCAST",[0,1,2],[0.50,0,0,2,2], [1, 0.9, 0.001, [-2.08, -1.55, -1.9, 0.013],[1.69, 0.21, 0.79, 1.64],[-0.21, -1.08, 0.91, -0.09]]]
	],
	
	["RAINY",
		["LIGHTRAIN",[1,2,3,5],[0.60,0.3,0.05,3,3], [1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]], [0.04,1,1,0,1]],
		["MEDIUMRAIN",[2,3,4],[0.70,0.5,0.05,4,4], [1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]], [0.04,1,1,0,1]],
		["RAINSTORM",[3],[0.80,0.9,0.1,5,5], [1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]], [0.04,1,1,0,1]]
	],
	
	["FOGGY",
		["LIGHTFOG",[0,2,5,6],[0.4,0,[0.2,0.01,10],0,0], [1, 1.08, -0.06, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]]],
		["MEDIUMFOG",[5,6,7],[0.4,0,[0.4,0.005,20],0,0], [1, 1.08, -0.06, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]]],
		["DENSEFOG",[6],[0.5,0,[0.4,0.0025,30],0,0], [1, 1.08, -0.06, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]]]
	]
];

_getCategoryIndex = {
	_index = switch (_this) do {
		case "CLEAR": {0};
		case "RAINY": {1};
		case "FOGGY": {2};
		default {0};
	};
	
	_index
};

_getDataIndex = {
	_index = switch (_this) do {
		case "SUNNY": {1};
		case "OVERCAST": {2};
		case "LIGHTRAIN": {1};
		case "MEDIUMRAIN": {2};
		case "RAINSTORM": {3};
		case "LIGHTFOG": {1};
		case "MEDIUMFOG": {2};
		case "DENSEFOG": {3};
		default {1};
	};
	
	_index
};

private ["_categoryIndex", "_dataIndex"];

_lastWeatherCategory = toUpper([_this, 0, "CLEAR", [""]] call BIS_fnc_param);
_newWeather = [_this, 1, [], [[]]] call BIS_fnc_param;

if (count _newWeather > 0) then {
	_categoryIndex = (_newWeather select 0) call _getCategoryIndex;
	if (count _newWeather > 1) then {
		_dataIndex = (_newWeather select 1) call _getDataIndex;
	} else {
		_dataIndex = 1 + round(random(count(_weatherTemplates select _categoryIndex) - 2));
	};
} else {
	_lastCategoryIndex = _lastWeatherCategory call _getCategoryIndex;
	_categoryArr = switch (_lastCategoryIndex) do {
		case 0:	{[0, 0, 0, 0, 0, 0, 0, 1, 1, 2]};
		case 1: {[0, 0, 0, 0, 0, 1, 1, 1, 1, 2]};
		case 2: {[0, 0, 0, 0, 0, 1, 1, 1, 2, 2]};
	};
	_categoryIndex = _categoryArr call BIS_fnc_selectRandom;
	_dataIndex = 1 + round(random(count(_weatherTemplates select _categoryIndex) - 2));
};

_weatherInitialArray = (_weatherTemplates select _categoryIndex) select _dataIndex;
_weatherInitialSettings = _weatherInitialArray select 2;

_weatherInitialOvercast = _weatherInitialSettings select 0;
_weatherInitialRainSnow = _weatherInitialSettings select 1;
_weatherInitialFog = _weatherInitialSettings select 2;
_weatherInitialWindEW = _weatherInitialSettings select 3;
_weatherInitialWindNS = _weatherInitialSettings select 4;

if (!isNil "IP_ColourCorrections") then {ppEffectDestroy IP_ColourCorrections};
if (!isNil "IP_FilmGrain") then {ppEffectDestroy IP_FilmGrain};

skipTime -24;
86400 setOvercast _weatherInitialOvercast;
0 setRain _weatherInitialRainSnow;
86400 setFog _weatherInitialFog;
setWind [_weatherInitialWindEW, _weatherInitialWindNS, true];
skipTime 24;
sleep 1;
simulWeatherSync;

if ((isNil "IP_MERCS_PPEffects") OR {IP_MERCS_PPEffects}) then {
	IP_ColourCorrections = ppEffectCreate ["ColorCorrections", 2000];
	IP_ColourCorrections ppEffectEnable true;
	IP_ColourCorrections ppEffectAdjust (_weatherInitialArray select 3);
	IP_ColourCorrections ppEffectCommit 0;

	if (count _weatherInitialArray > 4) then {
		IP_FilmGrain = ppEffectCreate ["FilmGrain", 2005];
		IP_FilmGrain ppEffectEnable true;
		IP_FilmGrain ppEffectAdjust (_weatherInitialArray select 4);
		IP_FilmGrain ppEffectCommit 0;
	};
};

_category = (_weatherTemplates select _categoryIndex) select 0;
_data = ((_weatherTemplates select _categoryIndex) select _dataIndex) select 0;
[_category, _data]