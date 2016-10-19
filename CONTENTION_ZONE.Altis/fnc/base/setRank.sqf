private ["_unit", "_rank"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_rank = [_this, 1, "PRIVATE", [""]] call BIS_fnc_param;

_unit setRank toUpper(_rank);