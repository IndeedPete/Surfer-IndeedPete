private ["_missionType", "_ownerGrp", "_task", "_faction", "_enemyFaction", "_agent", "_obj", "_directionType", "_centre", "_agentName", "_factionName", "_enemyFactionName", "_currency", "_reward", "_timelimit", "_taskDescription", "_directions", "_taskParams"];
_missionType = [_this, 0, "", [""]] call BIS_fnc_param;
_ownerGrp = [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
_task = [_this, 2, "", [""]] call BIS_fnc_param;
_faction = [_this, 3, "", [""]] call BIS_fnc_param;
_enemyFaction = [_this, 4, "", [""]] call BIS_fnc_param;
_agent = [_this, 5, ObjNull, [ObjNull]] call BIS_fnc_param;
_obj = [_this, 6, ObjNull, [ObjNull]] call BIS_fnc_param;
_directionType = [_this, 7, (["Orientation", "Grid"] call BIS_fnc_selectRandom), [""]] call BIS_fnc_param;
_centre = getPos _agent;
_agentName = name _agent;

_factionName = if (isText(missionConfigFile >> "Factions" >> _faction >> "displayName")) then {(getText(missionConfigFile >> "Factions" >> _faction >> "displayName"))} else {_faction};
_enemyFactionName = if (isText(missionConfigFile >> "Factions" >> _enemyFaction >> "displayName")) then {(getText(missionConfigFile >> "Factions" >> _enemyFaction >> "displayName"))} else {_enemyFaction};
_enemyFactionName = if (isText(missionConfigFile >> "Factions" >> _enemyFaction >> "displayName")) then {(getText(missionConfigFile >> "Factions" >> _enemyFaction >> "displayName"))} else {_enemyFaction};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
_reward = if (isNumber(missionConfigFile >> "GenericMissions" >> "MissionTypes" >> _missionType >> "reward")) then {(getNumber(missionConfigFile >> "GenericMissions" >> "MissionTypes" >> _missionType >> "reward"))} else {0};
_timelimit = if (isNumber(missionConfigFile >> "GenericMissions" >> "timelimit")) then {(getNumber(missionConfigFile >> "GenericMissions" >> "timelimit"))} else {-1};
_taskDescription = if (isText(missionConfigFile >> "GenericMissions" >> "MissionTypes" >> _missionType >> "description")) then {
	_template = getText(missionConfigFile >> "GenericMissions" >> "MissionTypes" >> _missionType >> "description");
	(format [_template, _agentName, _factionName, _enemyFactionName])
} else {
	"N/A"
};

_directions = switch (_directionType) do {
	case "Orientation": {
		_dir = [_agent, _obj] call BIS_fnc_dirTo;
		_orientation = [_dir] call IP_fnc_dirToOrientation;
		_distance = (round((_centre distance _obj) / 100)) * 100;
		(str(_distance) + " metres " + _orientation + " of " + _agentName + "'s position.")
	};
	
	case "Grid": {
		_grid = mapGridPosition _centre;
		("Grid " + _grid + ".")
	};

	default {["_directionType %1 unknown!", _directionType] call BIS_fnc_error};
};

_taskParams = [_ownerGrp, _task, [("AGENT: " + _agentName + "<br/>CLIENT: " + _factionName + "<br/>DESCRIPTION: " + _taskDescription + "<br/>DIRECTIONS: " + _directions + "<br/>HOSTILE PRESENCE: " + _enemyFactionName + "<br/>REWARD: " + _currency + ([_reward] call IP_fnc_numberText) + "<br/>TIME LIMIT: " + str(_timelimit) + " Minutes"), _missionType, _agentName], nil, true, 1];
[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;