private ["_unit", "_material"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_material = [_this, 1, "", [""]] call BIS_fnc_param;

_unit setObjectMaterial [0, _material];