private ["_key", "_params", "_missionFlow"];
_key = [_this, 0, "", [""]] call BIS_fnc_param;
if (_key == "") exitWith {["No mission key given!"] call BIS_fnc_error};
_params = [_this, 1, [], [[], "", ObjNull, GrpNull, 0]] call BIS_fnc_param;

_missionFlow = "IP_mission_" + _key;
[_params, _missionFlow, false] call BIS_fnc_MP;