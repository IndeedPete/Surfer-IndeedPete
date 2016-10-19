/*
Name: waveController
Author: IndeedPete
Purpose: Creates waves of units that will perform seek and destroy on given position. For "hold-the-line/base/whatever"-scenarios.
----------
Parameters:
_waveCount - NUMBER: Amount of waves that will be created until script is terminated. - 3
_waveIntensity - NUMBER: Wave intensity at the beginning. (Wave intensity is a multiplier which is applied on group counts.) - 1
_waveIntensityInc - NUMBER: Wave intensity increase after each wave. Can be negative. - 0
_waveRestRatio - NUMBER: Percentage of leftover units per wave unitl new wave is spawned. (0.2 means that a new wave is spawned when the amount of spawned units reaches 20% of its original strength.) - 0.2
_waveTimeout - ARRAY of BOOLEAN/NUMBER: First parameter: If additional timeout should be available to trigger next wave. Second parameter: timeout in seconds. - [true, (5*60)]
_countMenGroups - ARRAY of NUMBER: Min-Max values for number of men groups per wave. - [10, 20]
_countLandVehicleGroups - ARRAY of NUMBER: Min-Max values for number of land vehicles per wave. - [10, 20]
_countAirVehicleGroups - ARRAY of NUMBER: Min-Max values for number of air vehicles per wave. - [10, 20]
_countWaterVehicleGroups - ARRAY of NUMBER: Min-Max values for number of water vehicles per wave. - [10, 20]
_spawnPoints - ARRAY of ARRAY of STRING: Arrays of spawn points (markers) for each type of unit. - [["m1", "m2"], mySpawnMarkerArray, [], []]
_selections - ARRAY of ARRAY of STRING: Arrays of selections spawned units can be picked from. . [["STD", "SF"], ["LIGHT"], ["TRANSPORT", "PLANE"], ["UNARMEDGUE"]]
_side - SIDE (OPTIONAL): Side of units. - east - DEFAULT: west
_destination - ARRAY of NUMBER: Position where spawned units should move to and perform seek and destroy. - [0, 0, 0]
_menCounts - ARRAY of NUMBER: Min-Max values for number of units per men group. - [1, 3]
_customCode - STRING (OPTIONAL): Custom code that will be executed on each group. Passed parameters: _this = [group leader, group] - "(_this select 0) sideChat 'We're ready to patrol!'" - DEFAULT: ""
----------
Global Variables: IP_TESTMODE - Needs to be set to true or false.
----------
Requires: wave
*/

_waveCount = [_this, 0, 0, [0]] call BIS_fnc_param; //3;
_waveIntensity = [_this, 1, 0, [0]] call BIS_fnc_param; //1.75;
_waveIntensityInc = [_this, 2, 0, [0]] call BIS_fnc_param; //(-0.5);
_waveRestRatio = [_this, 3, 0, [0]] call BIS_fnc_param; //0.2;
_waveTimeout = [_this, 4, [false, 0], [[]]] call BIS_fnc_param;
_countMenGroups = [_this, 5, [0, 0], [[]]] call BIS_fnc_param;
_countLandVehicleGroups = [_this, 6, [0, 0], [[]]] call BIS_fnc_param;
_countAirVehicleGroups = [_this, 7, [0, 0], [[]]] call BIS_fnc_param;
_countWaterVehicleGroups = [_this, 8, [0, 0], [[]]] call BIS_fnc_param;
_spawnPoints = [_this, 9, [], [[]]] call BIS_fnc_param;
_selections = [_this, 10, [[],[],[],[]], [[]]] call BIS_fnc_param;
_side = [_this, 11, west, [west]] call BIS_fnc_param;
_destination = [_this, 12, [0, 0, 0], [[]]] call BIS_fnc_param;
_menCounts = [_this, 13, [0, 0], [[]]] call BIS_fnc_param;
_customCode = [_this, 14, "", [""]] call BIS_fnc_param;

_isWaveTimeout = _waveTimeout select 0;
_waveTimeoutAmount = _waveTimeout select 1;
_countMenGroupsMin = _countMenGroups select 0;
_countMenGroupsMax = _countMenGroups select 1;
_countLandVehicleGroupsMin = _countLandVehicleGroups select 0;
_countLandVehicleGroupsMax = _countLandVehicleGroups select 1;
_countAirVehicleGroupsMin = _countAirVehicleGroups select 0;
_countAirVehicleGroupsMax = _countAirVehicleGroups select 1;
_countWaterVehicleGroupsMin = _countWaterVehicleGroups select 0;
_countWaterVehicleGroupsMax = _countWaterVehicleGroups select 1;

for "_i" from 1 to _waveCount do {
	_countMenGroups = round (_waveIntensity * (_countMenGroupsMin + random (_countMenGroupsMax - _countMenGroupsMin)));
	_countLandVehicleGroups = round (_waveIntensity * (_countLandVehicleGroupsMin + random (_countLandVehicleGroupsMax - _countLandVehicleGroupsMin)));
	_countAirVehicleGroups = round (_waveIntensity * (_countAirVehicleGroupsMin + random (_countAirVehicleGroupsMax - _countAirVehicleGroupsMin)));
	_countWaterVehicleGroups = round (_waveIntensity * (_countWaterVehicleGroupsMin + random (_countWaterVehicleGroupsMax - _countWaterVehicleGroupsMin)));
	
	_initTargetSideCount = {(side _x) == _side && {_x getVariable "IP_Spawned"}} count allUnits;
	_spawned = [[_countMenGroups, _countLandVehicleGroups, _countAirVehicleGroups, _countWaterVehicleGroups], _spawnPoints, _selections, _side, _destination, _menCounts, _customCode] call IP_fnc_wave;  
	
	_initTargetSideCount = _initTargetSideCount + _spawned;	
	_rest = round(_initTargetSideCount * _waveRestRatio);
	_time = time + _waveTimeoutAmount;
	
	if (IP_TESTMODE) then {
		while {(({(side _x) == _side && {_x getVariable "IP_Spawned"}} count allUnits) > _rest) && ((_isWaveTimeout && {time < _time}) OR !_isWaveTimeout)} do {
			_targetSideCount = {(side _x) == _side && {_x getVariable "IP_Spawned"}} count allUnits;
			_WESTCount = {(side _x) == west} count allUnits;
			_EASTCount = {(side _x) == east} count allUnits;
			_INDEPCount = {(side _x) == independent} count allUnits;
			_timeLeft = (_time - time) / 60;
			hintSilent format ["DEBUG\nWave: %1/%2\nWEST: %3\nEAST: %4\nINDEP: %5\nSpawned %6: %7/%8\nNext Wave by: %9 Units\nOr %10 Minutes", _i, _waveCount, _WESTCount, _EASTCount, _INDEPCount, _side, _targetSideCount, _initTargetSideCount, _rest, _timeLeft];
			sleep 0.3;
		};	
	} else{
		waitUntil {sleep 0.3; (({(side _x) == _side && {_x getVariable "IP_Spawned"}} count allUnits) <= _rest) OR (_isWaveTimeout && {time > _time})}
	};
		
	_waveIntensity = _waveIntensity + _waveIntensityInc;
	saveGame;
};