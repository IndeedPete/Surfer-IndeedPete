/*
Name: ambientVehicleFire
Author: IndeedPete
Purpose: Fires main gun of vehicle at partly random positions.
----------
Parameters:
_vehicle - OBJECT: Vehicle that fires. - myLittleTank
_target - OBJECT (OPTIONAL): Object to roughly fire at. - myLittleTarget - DEFAULT: player
_radius - NUMBER (OPTIONAL): Radius around _target. - 50 - DEFAULT: 200
_altitude - NUMBER (OPTIONAL): Altitude above _target. - 50 - DEFAULT: 1000
_delay - NUMBER (OPTIONAL): Delay between shots. - 25 - DEFAULT: 1
_cond - CODE (OPTIONAL): While condition, script runs as long as satisfied (and vehicle is alive.) - {alive player} - DEFAULT: {true}
*/

_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, player, [objNull]] call BIS_fnc_param;
_radius = [_this, 2, 200, [0]] call BIS_fnc_param;
_altitude = [_this, 3, 1000, [0]] call BIS_fnc_param;
_delay = [_this, 4, 1, [0]] call BIS_fnc_param;
_cond = [_this, 5, {true}, [{}]] call BIS_fnc_param;
_weapon = (weapons _vehicle) select 0;

_pos = getPos _target;
_targetX = _pos select 0;
_targetY = _pos select 1;
_targetZ = _pos select 2;

_vehicle disableAI "Target";
_vehicle disableAI "AutoTarget";

while {(alive _vehicle) && {call _cond}} do {
	_vehicle setVehicleAmmo 1;
	
	_gap = random _radius;
	_direction = random 360;
	
	_x = _targetX + ((cos _direction) * _gap);
	_y = _targetY + ((sin _direction) * _gap);
	_z = _targetZ + _altitude - _radius + random (_radius * 2);
	
	_vehicle doWatch [_x, _y, _z];
	_shots = round (random 12);
	
	sleep (random 3);
	
	for "_i" from 1 to _shots do {
		sleep _delay;
		_vehicle fire _weapon;
		//hint format ["%1 %2", _vehicle, _weapon];
	};
};