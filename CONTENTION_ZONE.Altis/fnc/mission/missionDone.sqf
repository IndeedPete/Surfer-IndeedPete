private ["_unit", "_mission"];
_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
_mission = [_this, 1, "", [""]] call BIS_fnc_param;

(_mission in (_unit getVariable ["IP_MissionsDone", []]))