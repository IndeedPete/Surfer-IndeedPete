private ["_agent", "_owner", "_ownerGrp", "_faction", "_radius", "_blacklistedMissionTypes", "_whitelistedMissionTypes", "_missionType"];
_agent = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if (isNull _agent) exitWith {["_agent must not be null!"] call BIS_fnc_error};

_owner = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
if (isNull _owner) exitWith {["_owner must not be null!"] call BIS_fnc_error};

_ownerGrp = group _owner;
_faction = _agent getVariable ["IP_Faction", ""];
_radius = _agent getVariable ["IP_MissionRadius", [500, 1500]];
_blacklistedMissionTypes = _agent getVariable ["IP_BlacklistedMissionTypes", []];
_whitelistedMissionTypes = _agent getVariable ["IP_WhitelistedMissionTypes", []];

_missionType = if (count _whitelistedMissionTypes > 0) then {
	(_whitelistedMissionTypes call BIS_fnc_selectRandom)
} else {
	_missionTypes = (missionConfigFile >> "GenericMissions" >> "MissionTypes") call IP_fnc_getConfigEntries;
	_missionTypes = _missionTypes - _blacklistedMissionTypes;
	(_missionTypes call BIS_fnc_selectRandom)
};

[[_agent, _ownerGrp, _faction, _missionType, _radius], "IP_fnc_simpleMissionFlow", false] call BIS_fnc_MP;