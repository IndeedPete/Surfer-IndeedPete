/*
Name: spawnLandVehicle
Author: IndeedPete
Purpose: Creates land vehicle with crew.
----------
Parameters:
_pos - ARRAY of NUMBER: Position where vehicle will be created. - [0, 0, 0]
_side - SIDE (OPTIONAL): Side of unit. - east - DEFAULT: west
_selection - ARRAY of STRING (OPTIONAL): Selection of unit that will be spawned, availability depends on side. Available selections in general: "LIGHT" (light vehicles), "ARMOUR" (armoured vehicles), "SUPPORT" (support vehicles), "GUELIGHT" (guerilla vehicles) - ["ARMOUR"] - DEFAULT: ["LIGHT", "ARMOUR", "SUPPORT", "GUELIGHT"]
_filled - BOOLEAN (OPTIONAL): Cargo seats will be filled with units. - true - DEFAULT: false
_grpId - STRING (OPTIONAL): Group ID for spawned unit. - "Delta-2-4" - DEFAULT: ""
----------
Requires: track
*/

private ["_array", "_arrays", "_roads", "_radius", "_pos", "_vehClass", "_vehSpots", "_vehicle", "_grp", "_grpId"];

_pos = [_this, 0, [0, 0, 0], [[]]] call BIS_fnc_param;
_side = [_this, 1, west, [west]] call BIS_fnc_param;
_selection = [_this, 2, ["LIGHT", "ARMOUR", "SUPPORT", "GUELIGHT"], [[]]] call BIS_fnc_param;
_filled = [_this, 3, false, [true]] call BIS_fnc_param;
_grpId = [_this, 4, "", [""]] call BIS_fnc_param;
if (count _selection == 0) then {_selection = ["LIGHT", "ARMOUR", "SUPPORT", "GUELIGHT", "GUELIGHTUNARMED"]};

_arrays = [];
switch (_side) do {
	case west:{
		_BLUvehLIGHT = ["B_MRAP_01_F","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_Quadbike_01_F","B_Truck_01_transport_F","B_Truck_01_covered_F"];
		_BLUvehARMOUR = ["B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F"];
		_BLUvehSUPPORT = ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
		_BLUvehGUELIGHT = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Quadbike_01_F","B_G_Van_01_transport_F"];
		_BLUvehGUELIGHT = ["B_G_Offroad_01_armed_F"];
		_BLUvehGUELIGHTUNARMED = ["B_G_Offroad_01_F","B_G_Quadbike_01_F","B_G_Van_01_transport_F"];
		
		if ("LIGHT" in _selection) then {_arrays set [(count _arrays), _BLUvehLIGHT]};
		if ("ARMOUR" in _selection) then {_arrays set [(count _arrays), _BLUvehARMOUR]};
		if ("SUPPORT" in _selection) then {_arrays set [(count _arrays), _BLUvehSUPPORT]};
		if ("GUELIGHT" in _selection) then {_arrays set [(count _arrays), _BLUvehGUELIGHT]};
		if ("GUELIGHTUNARMED" in _selection) then {_arrays set [(count _arrays), _BLUvehGUELIGHTUNARMED]};
	};
	
	case east:{
		_OPFvehLIGHT = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_Quadbike_01_F","O_Truck_02_transport_F","O_Truck_02_covered_F"];
		_OPFvehARMOUR = ["O_MBT_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F"];
		_OPFvehSUPPORT = ["O_MBT_02_arty_F"];
		_OPFvehGUELIGHT = ["O_G_Offroad_01_armed_F"];
		_OPFvehGUELIGHTUNARMED = ["O_G_Offroad_01_F","O_G_Quadbike_01_F","O_G_Van_01_transport_F"];
		
		if ("LIGHT" in _selection) then {_arrays set [(count _arrays), _OPFvehLIGHT]};
		if ("ARMOUR" in _selection) then {_arrays set [(count _arrays), _OPFvehARMOUR]};
		if ("SUPPORT" in _selection) then {_arrays set [(count _arrays), _OPFvehSUPPORT]};
		if ("GUELIGHT" in _selection) then {_arrays set [(count _arrays), _OPFvehGUELIGHT]};
		if ("GUELIGHTUNARMED" in _selection) then {_arrays set [(count _arrays), _OPFvehGUELIGHTUNARMED]};
	};
	
	case resistance:{
		_INDvehLIGHT = ["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Quadbike_01_F","I_Truck_02_transport_F","I_Truck_02_covered_F"];
		_INDvehARMOUR = ["I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"];
		_INDvehGUELIGHT = ["I_G_Offroad_01_armed_F"];
		_INDvehGUELIGHTUNARMED = ["I_G_Offroad_01_F","I_G_Quadbike_01_F","I_G_Van_01_transport_F"];
		
		if ("LIGHT" in _selection) then {_arrays set [(count _arrays), _INDvehLIGHT]};
		if ("ARMOUR" in _selection) then {_arrays set [(count _arrays), _INDvehARMOUR]};
		//if ("SUPPORT" in _selection) then {_arrays set [(count _arrays), _BLUmenSTD]};
		if ("GUELIGHT" in _selection) then {_arrays set [(count _arrays), _INDvehGUELIGHT]};
		if ("GUELIGHTUNARMED" in _selection) then {_arrays set [(count _arrays), _INDvehGUELIGHTUNARMED]};
	};
};

if (count _arrays == 0) exitWith {hint format ["IP_fnc_menspawn: Wrong selection parameters!\nSelection: %1\nSide: %2", _selection, _side]};
_array = _arrays call BIS_fnc_selectRandom;
_vehClass = _array call BIS_fnc_selectRandom;
_grp = createGroup _side;

_radius = 40;
_roads = [];
while {(count _roads) == 0} do {
	_roads = _pos nearRoads _radius;
	_radius = _radius + 10;
};
if (((_roads select 0) distance _pos) < 200) then {
	_roadPos = getPos (_roads select 0);
	_pos = [_roadPos,0,25,5,0,1,0] call BIS_fnc_findSafePos;
} else {
	_pos = [_pos,0,200,5,0,1,0] call BIS_fnc_findSafePos;
};
_pos = [_pos select 0, _pos select 1, 0];

_vehicle = createVehicle [_vehClass, _pos, [], 0, "NONE"];
_vehicle setPos _pos;
_vehicle allowDamage false;
sleep 1;
if (((vectorUp _vehicle) select 2) != 0) then {_vehicle setVectorUp [0,0,0]};
sleep 1;
_vehicle allowDamage true;

_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
if (_filled) then {
	_vehSpots = (getNumber (configFile >> "CfgVehicles" >> _vehClass >> "transportSoldier") - 1); // one man too much will be spawned for simple truck
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