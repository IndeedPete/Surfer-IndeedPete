private ["_count", "_n", "_rank", "_nMinusOne", "_displayName", "_insignia"];
_count = count IP_MERCS_MissionsDone;
_n = [_count] call IP_fnc_getMainRankData;
_rank = _n select 0;
_nMinusOne = [(_count - 1)] call IP_fnc_getMainRankData;

if (_rank != (_nMinusOne select 0)) then {
	_displayName = getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> _rank >> "displayName");
	_insignia = getText(missionConfigFile >> "Factions" >> "ION" >> "Ranks" >> _rank >> "insignia");
	
	["Promotion", [_displayName, _insignia]] call bis_fnc_showNotification;
};