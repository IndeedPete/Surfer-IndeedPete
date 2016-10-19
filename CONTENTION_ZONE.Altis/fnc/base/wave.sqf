/*
Name: wave
Author: IndeedPete
Purpose: Creates wave of units that will perform seek and destroy on given position.
----------
Parameters:
_groupCounts - ARRAY of NUMBER: Amounts of spawned groups for each type of unit (men, land vehicles, air vehicles and water vehicles). - [5, 4, 3, 2]
_spawnPoints - ARRAY of ARRAY of STRING: Arrays of spawn points (markers) for each type of unit. - [["m1", "m2"], mySpawnMarkerArray, [], []]
_selections - ARRAY of ARRAY of STRING: Arrays of selections spawned units can be picked from. . [["STD", "SF"], ["LIGHT"], ["TRANSPORT", "PLANE"], ["UNARMEDGUE"]]
_side - SIDE (OPTIONAL): Side of units. - east - DEFAULT: west
_destination - ARRAY of NUMBER: Position where spawned units should move to and perform seek and destroy. - [0, 0, 0]
_menCounts - ARRAY of NUMBER: Min-Max values for number of units per men group. - [1, 3]
_customCode - STRING (OPTIONAL): Custom code that will be executed on each group. Passed parameters: _this = [group leader, group] - "(_this select 0) sideChat 'We're ready to patrol!'" - DEFAULT: ""
----------
Global Variables: IP_TESTMODE - Needs to be set to true or false.
----------
Requires: spawnMenGroup, spawnLandVehicle, spawnAirVehicle, spawnWaterVehicle
*/

private ["_customCodeComp", "_totalCount"];

_groupCounts = [_this, 0, [0,0,0,0], [[]]] call BIS_fnc_param;
_spawnPoints = [_this, 1, [[],[],[],[]], [[]]] call BIS_fnc_param;
_selections = [_this, 2, [[],[],[],[]], [[]]] call BIS_fnc_param;
_side = [_this, 3, west, [west]] call BIS_fnc_param;
_destination = [_this, 4, [0, 0, 0], [[]]] call BIS_fnc_param;
_menCounts = [_this, 5, [0, 0], [[]]] call BIS_fnc_param;
_customCode = [_this, 6, "", [""]] call BIS_fnc_param;
if (_customCode != "") then {_customCodeComp = compile _customCode};

_countMenGroups = _groupCounts select 0;
_countLandVehicleGroups = _groupCounts select 1;
_countAirVehicleGroups = _groupCounts select 2;
_countWaterVehicleGroups = _groupCounts select 3;

_menSpawnPoints = _spawnPoints select 0;
_landVehicleSpawnPoints = _spawnPoints select 1;
_airVehicleSpawnPoints = _spawnPoints select 2;
_waterVehicleSpawnPoints = _spawnPoints select 3;

_menSelection = _selections select 0;
_landVehicleSelection = _selections select 1;
_airVehicleSelection = _selections select 2;
_waterVehicleSelection = _selections select 3;

_menCountMin = _menCounts select 0;
_menCountMax = _menCounts select 1;

_groupSetup = {
	_ldr = _this select 0;
	_destination = _this select 1;
	_customCode = _this select 2;
	_grp = group _ldr;	
	//[_ldr] spawn IP_fnc_track;     ----- Already in fnc_spawnXYZ
	
	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp allowFleeing 0;

	_wp = _grp addWaypoint [_destination, 0];
	_wp setWaypointType "MOVE";
	_wp = _grp addWaypoint [_destination, 1];
	_wp setWaypointType "SAD";
	[_grp, 1] setWaypointBehaviour "COMBAT";
	
	if (_customCode != "") then {
		[_ldr, _grp] spawn _customCodeComp;
	};
};

_totalCount = 0;
for "_i" from 1 to _countMenGroups do {
	_pos = getMarkerPos (_menSpawnPoints call BIS_fnc_selectRandom);
	_count = _menCountMin + round(random (_menCountMax - _menCountMin));
	_spawn = [_pos, _side, _count, _menSelection] call IP_fnc_spawnMenGroup;
	_ldr = _spawn select 0;
	_count = _spawn select 1;
	
	[_ldr, _destination, _customCode] call _groupSetup;
	_totalCount = _totalCount + _count;
	sleep 0.3;
};

for "_i" from 1 to _countLandVehicleGroups do {
	_pos = getMarkerPos (_landVehicleSpawnPoints call BIS_fnc_selectRandom);
	_spawn = [_pos, _side, _landVehicleSelection] call IP_fnc_spawnLandVehicle;
	_ldr = _spawn select 0;
	_count = _spawn select 1;
	
	[_ldr, _destination, _customCode] call _groupSetup;
	_totalCount = _totalCount + _count;
	sleep 0.3;
};

for "_i" from 1 to _countAirVehicleGroups do {
	_pos = getMarkerPos (_airVehicleSpawnPoints call BIS_fnc_selectRandom);
	_spawn = [_pos, _side, _airVehicleSelection] call IP_fnc_spawnAirVehicle;
	_ldr = _spawn select 0;
	_count = _spawn select 1;
	
	[_ldr, _destination, _customCode] call _groupSetup;
	_totalCount = _totalCount + _count;
	sleep 0.3;
};

for "_i" from 1 to _countWaterVehicleGroups do {
	_pos = getMarkerPos (_waterVehicleSpawnPoints call BIS_fnc_selectRandom);
	_spawn = [_pos, _side, _waterVehicleSelection] call IP_fnc_spawnWaterVehicle;
	_ldr = _spawn select 0;
	_count = _spawn select 1;
	
	[_ldr, _destination, _customCode] call _groupSetup;
	_totalCount = _totalCount + _count;
	sleep 0.3;
};

if (IP_TESTMODE) then {hint format ["IP_fnc_wave\nUnits created: %1", _totalCount]};
_totalCount