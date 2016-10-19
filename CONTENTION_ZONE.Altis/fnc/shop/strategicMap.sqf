if (count _this > 0) exitWith {
	_obj = _this select 0;	
	if ((typeName _obj == "OBJECT") && {!(isNull _obj)}) then {
		if ((_obj getVariable ["IP_StratMapAction", -1]) == -1) then {
			_cond = [_this, 1, "true", [""]] call BIS_fnc_param;
			_id = _obj addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\map\diary\signal_ca.paa'/> Open Strategic Map", {nul = [] spawn IP_fnc_strategicMap}, [], 1.5, false, true, "", ("(_this distance _target < 3) && " + _cond)];
			_obj setVariable ["IP_StratMapAction", _id];
		};	
	} else {
		"Illegal argument passed! First parameter must be OBJECT!" call BIS_fnc_error;
	};	
};

if ((isNil "IP_AvailableMissions") OR {count IP_AvailableMissions == 0}) exitWith {
	hint "No missions available at the moment!";
};

private ["_missionsData", "_mapCenter", "_ORBAT", "_markers", "_images", "_overcast", "_isNight", "_scale", "_simul"];
_missionsData = [];

{
	_mission = _x;
	_pos = getMarkerPos ("m" + _mission);
	_code = compile(str(_forEachIndex) + " call IP_fnc_selectMission;");
	_title = getText(missionConfigFile >> "ShopMissions" >> _mission >> "title");
	_desc = getText(missionConfigFile >> "ShopMissions" >> _mission >> "description");
	_client = getText(missionConfigFile >> "Factions" >> (getText(missionConfigFile >> "ShopMissions" >> _mission >> "client")) >> "displayName");
	_overview = "Campaigns\IP_CMP_ICE\img\" + _mission + "_overview.paa";
	_missionsData pushBack [_pos, _code, _title, _desc, _client, _overview, 1, []];
} forEach IP_AvailableMissions;

_mapCenter = missionNameSpace getVariable ["IP_StratMapCentre", [0,0,0]];
_ORBAT = [];
_markers = [];
_images = [];
_overcast = overcast;
_isNight = !((dayTime > 7) && (dayTime < 19));
_scale = 1;
_simul = true;

[
	(findDisplay 46),
	_mapCenter,
	_missionsData,
	_ORBAT,
	_markers,
	_images,
	_overcast,
	_isNight,
	_scale,
	_simul
] call BIS_fnc_strategicMapOpen;