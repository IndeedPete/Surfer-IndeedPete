private ["_unit", "_identity"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_identity = [_this, 1, "", [""]] call BIS_fnc_param;

_unit setIdentity _identity;