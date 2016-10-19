/*
Name: heliDoors
Author: IndeedPete
Purpose: Automatically opens/closes helicopter doors in certain height. (Only applicable to knows models which support opening/closing doors.)
----------
Parameters:
_heli - OBJECT: Helicopter. - myLittleHelo
_height - NUMBER (OPTIONAL): If _heli is below or on this hight it will open its doors; if it is above it will close its doors. - 50 - DEFAULT: 10
*/
_this spawn {
	_heli = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_height = [_this, 1, 10, [0]] call BIS_fnc_param;
	_type = typeOf _heli;

	if (!(_type in ["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "I_Heli_Transport_02_F", /*"I_Heli_light_03_unarmed_F",*/ "O_Heli_Light_02_F", "O_Heli_Light_02_unarmed_F", "O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"])) exitWith {hint format ["IP_fnc_heliDoors\nWrong Helicopter Model: %1", _type]};  

	_doors = switch (_type) do {
		case "B_Heli_Transport_01_F": {["door_R", "door_L"]};
		case "B_Heli_Transport_01_camo_F": {["door_R", "door_L"]};
		case "I_Heli_Transport_02_F": {["door_back_R", "door_back_L"]};
		/*case "I_Heli_light_03_unarmed_F": {["door_R", "door_L"]};*/
		case "O_Heli_Light_02_F": {["dvere1", "dvere1_posunZ", "dvere2"]};
		case "O_Heli_Light_02_unarmed_F": {["dvere1", "dvere1_posunZ", "dvere2"]};
		case "O_Heli_Attack_02_F": {["door_R", "door_L"]};
		case "O_Heli_Attack_02_black_F": {["door_R", "door_L"]};
	};

	while {alive _heli} do {
		waitUntil {((getPos _heli) select 2) <= _height};
		{_heli animateDoor [_x, 1]} forEach _doors;
		{_heli animate [_x, 1]} forEach _doors;
		if (_type == "I_Heli_Transport_02_F") then {_heli animate ["CargoRamp_Open", 1]};
		waitUntil {(((getPos _heli) select 2) > _height) OR (!alive _heli)};
		{_heli animateDoor [_x, 0]} forEach _doors;
		{_heli animate [_x, 0]} forEach _doors;
		if (_type == "I_Heli_Transport_02_F") then {_heli animate ["CargoRamp_Open", 0]};
	};
};