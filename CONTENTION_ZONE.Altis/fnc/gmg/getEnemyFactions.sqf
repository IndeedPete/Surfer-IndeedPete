private ["_enemyFactions", "_configEntry"];
if (isNil "_this") exitWith {["_this parameter is empty!"] call BIS_fnc_error};

_configEntry = (missionConfigFile >> "Factions" >> _this >> "enemyFactions");
_enemyFactions = if (isArray _configEntry) then {
	(getArray _configEntry)
} else {
	[]
};

_enemyFactions