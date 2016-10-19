/*
Name: spawnAirVehicle
Author: IndeedPete
Purpose: Creates air vehicle, flying with crew.
----------
Parameters:
_pos - ARRAY of NUMBER: Position where vehicle will be created. - [0, 0, 0]
_side - SIDE (OPTIONAL): Side of unit. - east - DEFAULT: west
_selection - ARRAY of STRING (OPTIONAL): Selection of unit that will be spawned, availability depends on side. Available selections in general: "TRANSPORT" (transport helicopters), "ATTACK" (attack helicopters), "PLANE" (planes) - ["ATTACK"] - DEFAULT: ["TRANSPORT", "ATTACK", "PLANE"]
_filled - BOOLEAN (OPTIONAL): Cargo seats will be filled with units. - true - DEFAULT: false
_grpId - STRING (OPTIONAL): Group ID for spawned unit. - "Delta-2-4" - DEFAULT: ""
----------
Requires: track
*/

private ["_array", "_arrays", "_vehClass", "_vehSpots", "_vehicle", "_grp", "_grpId"];

_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
_side = [_this, 1, west, [west]] call BIS_fnc_param;
_selection = [_this, 2, ["TRANSPORT", "ATTACK", "PLANE"], [[]]] call BIS_fnc_param;
_filled = [_this, 3, false, [true]] call BIS_fnc_param;
_grpId = [_this, 4, "", [""]] call BIS_fnc_param;
if (count _selection == 0) then {_selection = ["TRANSPORT", "ATTACK", "PLANE"]};

_arrays = [];
switch (_side) do {
	case west:{
		_BLUvehTRANSPORT = ["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"];
		_BLUvehATTACK = ["B_Heli_Light_01_armed_F","B_Heli_Attack_01_F"];
		
		if ("TRANSPORT" in _selection) then {_arrays set [(count _arrays), _BLUvehTRANSPORT]};
		if ("ATTACK" in _selection) then {_arrays set [(count _arrays), _BLUvehATTACK]};
		//if ("PLANE" in _selection) then {_arrays set [(count _arrays), _BLUvehLIGHT]};
	};
	
	case east:{
		_OPFvehTRANSPORT = ["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"];
		_OPFvehATTACK = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"];
		
		if ("TRANSPORT" in _selection) then {_arrays set [(count _arrays), _OPFvehTRANSPORT]};
		if ("ATTACK" in _selection) then {_arrays set [(count _arrays), _OPFvehATTACK]};
		//if ("SUPPORT" in _selection) then {_arrays set [(count _arrays), _BLUvehLIGHT]};
	};
	
	case resistance:{
		_INDvehTANSPORT = ["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"];
		_INDvehATTACK = ["I_Heli_light_03_F"];
		_INDvehPLANE = ["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"];

		if ("TRANSPORT" in _selection) then {_arrays set [(count _arrays), _INDvehTANSPORT]};
		if ("ATTACK" in _selection) then {_arrays set [(count _arrays), _INDvehATTACK]};
		if ("PLANE" in _selection) then {_arrays set [(count _arrays), _INDvehPLANE]};
	};
};

if (count _arrays == 0) exitWith {hint format ["IP_fnc_menspawn: Wrong selection parameters!\nSelection: %1\nSide: %2", _selection, _side]};
_array = _arrays call BIS_fnc_selectRandom;
_vehClass = _array call BIS_fnc_selectRandom;
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _vehClass >> "transportSoldier");
_grp = createGroup _side;

_vehicle = createVehicle [_vehClass, _pos, [], 0, "FLY"];
_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
if (_filled) then {
	_vehSpots = getNumber (configFile >> "CfgVehicles" >> _vehClass >> "transportSoldier"); // one man too much will be spawned for simple truck
	if (_vehSpots > 0) then {
		for "_i" from 1 to _vehSpots do {
			_manClass = getText (configFile >> "CfgVehicles" >> _vehClass >> "crew");
			_man = _grp createUnit [_manClass, _pos, [], 0, "NONE"];
			_man moveInCargo _vehicle;
			sleep 0.3;
		};
	};
};

if (_grpId != "") then {
	_grp setGroupID [_grpId];
};

_leader = leader _grp;
[_leader] spawn IP_fnc_track;
_count = count units _grp;
{_x setVariable ["IP_Spawned", true]} forEach units _grp;
_vehicle setVariable ["IP_Spawned", true];
[_leader, _count, _vehicle]