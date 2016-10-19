private "_mission";
_mission = [_this, 0, "", [""]] call BIS_fnc_param;

(!isNil "IP_ICE_MissionsDone" && {_mission in IP_ICE_MissionsDone})