private ["_team", "_bcr", "_tcr"];
_team = player getVariable ["IP_Team", []];
_bcr = player getVariable ["IP_BasicTCR", (getNumber(missionConfigFile >> "ShopMetaInformation" >> "basicCostRate"))];
_tcr = _bcr;

for "_i" from 0 to ((count _team) - 1) do {
	_entry = _team select _i;
	_category = [(missionConfigFile >> "ShopPersonnel"), _entry] call IP_fnc_getConfigCategory;
	_costRate = getNumber(missionConfigFile >> "ShopWeapons" >> _category >> _entry >> "costRate");
	_tcr = _tcr + _costRate;
};

_tcr