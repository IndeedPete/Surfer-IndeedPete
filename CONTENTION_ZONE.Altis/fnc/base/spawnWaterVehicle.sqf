/*
Name: spawnWaterVehicle
Author: IndeedPete
Purpose: Creates water vehicle with crew.
----------
Parameters:
_pos - ARRAY of NUMBER: Position where vehicle will be created. - [0, 0, 0]
_side - SIDE (OPTIONAL): Side of unit. - east - DEFAULT: west
_selection - ARRAY of STRING (OPTIONAL): Selection of unit that will be spawned, availability depends on side. Available selections in general: "ARMED" (armed vehicles), "UNARMED" (unarmed vehicles), "GUEUNARMED" (guerilla unarmed vehicles) - ["ARMED"] - DEFAULT: ["ARMED", "UNARMED", "GUEUNARMED"]
_filled - BOOLEAN (OPTIONAL): Cargo seats will be filled with units. - true - DEFAULT: false
_grpId - STRING (OPTIONAL): Group ID for spawned unit. - "Delta-2-4" - DEFAULT: ""
----------
Requires: track
*/

private ["_array", "_arrays", "_vehClass", "_vehSpots", "_vehicle", "_grp", "_grpId"];

_pos = [_this, 0, [0, 0, 0], [[]]] call BIS_fnc_param;
_side = [_this, 1, west, [west]] call BIS_fnc_param;
_selection = [_this, 2, ["ARMED", "UNARMED", "GUEUNARMED"], [[]]] call BIS_fnc_param;
_filled = [_this, 3, false, [true]] call BIS_fnc_param;
_grpId = [_this, 4, "", [""]] call BIS_fnc_param;
if (count _selection == 0) then {_selection = ["ARMED", "UNARMED", "GUEUNARMED"]};

_arrays = [];
switch (_side) do {
	case west:{
		_BLUvehARMED = ["B_Boat_Armed_01_minigun_F"];
		_BLUvehUNARMED = ["B_Boat_Transport_01_F","B_Lifeboat"];
		_BLUvehGUEUNARMED = ["B_G_Boat_Transport_01_F"];
		
		if ("ARMED" in _selection) then {_arrays set [(count _arrays), _BLUvehARMED]};
		if ("UNARMED" in _selection) then {_arrays set [(count _arrays), _BLUvehUNARMED]};
		if ("GUEUNARMED" in _selection) then {_arrays set [(count _arrays), _BLUvehGUEUNARMED]};
	};
	
	case east:{
		_OPFvehARMED = ["O_Boat_Armed_01_hmg_F"];
		_OPFvehUNARMED = ["O_Boat_Transport_01_F","O_Lifeboat"];

		if ("ARMED" in _selection) then {_arrays set [(count _arrays), _OPFvehARMED]};
		if ("UNARMED" in _selection) then {_arrays set [(count _arrays), _OPFvehUNARMED]};
	};
	
	case resistance:{
		_INDvehARMED = ["I_Boat_Transport_01_F"];
		_INDvehUNARMED = ["I_Boat_Armed_01_minigun_F"];
			
		if ("ARMED" in _selection) then {_arrays set [(count _arrays), _INDvehARMED]};
		if ("UNARMED" in _selection) then {_arrays set [(count _arrays), _INDvehUNARMED]};
	};
};

if (count _arrays == 0) exitWith {hint format ["IP_fnc_menspawn: Wrong selection parameters!\nSelection: %1\nSide: %2", _selection, _side]};
_array = _arrays call BIS_fnc_selectRandom;
_vehClass = _array call BIS_fnc_selectRandom;
_grp = createGroup _side;

_vehicle = createVehicle [_vehClass, _pos, [], 0, "NONE"];
_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
if (_filled) then {
	_vehSpots = getNumber (configFile >> "CfgVehicles" >> _vehClass >> "transportSoldier");
	if(_vehSpots > 0) then {
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