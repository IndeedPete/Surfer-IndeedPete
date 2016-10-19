/*
Name: ambientArty
Author: IndeedPete
Purpose: Creates ambient artillery fire within marker area or around position.
----------
Parameters:
_target - STRING, OBJECT, ARRAY of NUMBER: Marker, Object or Position - "m1", player, [0, 0, 0]
_cond - CODE (OPTIONAL): While condition, script runs as long as satisfied. - {alive player} - DEFAULT: {true}
_radius - NUMBER (OPTIONAL): Radius around _target. Not applicable when _target is marker. - 50 - DEFAULT: 0
_safeDist - NUMBER (OPTIONAL): Safe distance around _target. Not applicable when _target is marker. - 50 - DEFAULT: 0
_delays - ARRAY of NUMBER (OPTIONAL): Min-Max values for delay between impacts. - [10, 20] - DEFAULT: [1, 3]
_type - STRING (OPTIONAL): Type of impact. Available types: "MORTAR", "ARTY", "ROCKET", "BOMB" - "BOMB" - DEFAULT: "MORTAR"
----------
Needs: SHKPos
*/

_target = [_this, 0, [], ["", objNull, []]] call BIS_fnc_param;
_cond = [_this, 1, {true}, [{}]] call BIS_fnc_param;
_radius = [_this, 2, 0, [0]] call BIS_fnc_param;
_safeDist = [_this, 3, 0, [0]] call BIS_fnc_param;
_delays = [_this, 4, [1, 3], [[]]] call BIS_fnc_param;
_type = toUpper([_this, 5, "MORTAR", [""]] call BIS_fnc_param);

_isMarker = (typeName _target == "STRING");
_hasSafeDist = (_safeDist > 0);
_delayMin = _delays select 0;
_delayAdd = (_delays select 1) - _delayMin;
_ammo = switch (_type) do {
	case "MORTAR":
	{
		"Sh_82mm_AMOS"
	};

	case "ARTY":
	{
		"Sh_155mm_AMOS"
	};

	case "ROCKET":
	{
		"R_230mm_HE"
	};
	
	case "BOMB":
	{
		"Bo_GBU12_LGB_MI10"
	};
};

private "_pos";
while {call _cond} do {
	if (_isMarker) then {
		_pos = _target call IP_fnc_SHKPos;
	} else {
		if (_hasSafeDist) then {
			_pos = _target;
			while {(_pos distance _target) < _safeDist} do {
				_pos = [_target, _radius] call IP_fnc_SHKPos;
			};
		} else {
			_pos = [_target, _radius] call IP_fnc_SHKPos;
		};
	};
	
	_pos = [(_pos select 0), (_pos select 1), 200];
	_shell = _ammo createVehicle _pos;
	[_shell, -90, 0] call BIS_fnc_setPitchBank;
	_shell setVelocity [0, 0, -100];  
	
	sleep (_delayMin + random _delayAdd);
};