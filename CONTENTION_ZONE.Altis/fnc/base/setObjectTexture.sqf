private ["_obj", "_params"];
_obj = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_params = [_this, 1, [], [[]], 2] call BIS_fnc_param;

_obj setObjectTexture _params;