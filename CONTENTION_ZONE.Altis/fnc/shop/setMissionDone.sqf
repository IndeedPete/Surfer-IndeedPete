private ["_mission", "_missionsDone"];
_mission = [_this, 0, "", [""]] call BIS_fnc_param;
_missionsDone = if (isNil "IP_ICE_MissionsDone") then {[]} else {IP_ICE_MissionsDone};

if (!([_mission] call IP_fnc_missionDone)) then {_missionsDone pushBack _mission};
IP_ICE_MissionsDone = _missionsDone;