private ["_pos", "_side", "_configOrCount", "_patrolGrp"];
_pos = [_this, 0, [0,0,0], [[]], [2,3]] call BIS_fnc_param;
_side = [_this, 1, east, [west]] call BIS_fnc_param;
_configOrCount = [_this, 2, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"), [configFile, 0, []], 2] call BIS_fnc_param;

_patrolGrp = if (typeName _configOrCount == "CONFIG") then {
	_grp = [_pos, _side, _configOrCount] call BIS_fnc_spawnGroup;
	_units = units _grp;
	{[_x] call IP_fnc_createContentionMerc} forEach _units;
	_grp
} else {
	private ["_count", "_units"];
	_count = if (typeName _configOrCount == "ARRAY") then {
		_min = _configOrCount select 0;
		_max = _configOrCount select 1;
		(round(_min + random(_max - _min)))
	} else {
		_configOrCount
	};
	
	if (_count <= 1) then {_count = 2};
	_units = [];
	for "_i" from 0 to (_count - 1) do {
		_unit = [_pos] call IP_fnc_createContentionMerc;
		_units pushBack _unit;
	};
	
	_leader = (_units select 0);
	_units joinSilent _leader;
	(group _leader)
};

[(leader _patrolGrp)] call IP_fnc_track;
_patrolGrp