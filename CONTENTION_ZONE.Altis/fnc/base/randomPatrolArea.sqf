/*
Name: randomPatrolArea
Author: IndeedPete
Purpose: Creates groups of units randomly patrolling through a marker area.
----------
Parameters:
_area - STRING: Marker that covers patrol area. - "myLittleAreaMarker"
_side - SIDE (OPTIONAL): Side of patrolling units. - east - DEFAULT: west
_groupCounts - ARRAY of NUMBER: Min-Max values for number of patrolling groups. - [10, 20]
_menCounts - ARRAY of NUMBER: Min-Max values for number of units per group. - [1, 3]
_selection - ARRAY of STRING (OPTIONAL): Selections of units that will be spawned, availability depends on side. Available selections in general: "STD" (standard units), "SF" (special forces), "GUE" (guerilla units) - ["STD"] - DEFAULT: ["STD", "SF", "GUE"] 
_waypoints - ARRAY of STRING (OPTIONAL): Set of waypoint types the spawned units get assigned. - ["MOVE", "MOVE", "CYCLE"] - DEFAULT: ["SAD", "CYCLE"]
_customCode - STRING (OPTIONAL): Custom code that will be executed on each group. Passed parameters: _this = [group leader, group] - "(_this select 0) sideChat 'We're ready to patrol!'" - DEFAULT: ""
----------
Global Variables: IP_TESTMODE - Needs to be set to true or false.
----------
Requires: SHKPos, spawnMenGroup, track
*/

private ["_customCodeComp", "_totalCount"];

_area = [_this, 0, "", ["", []]] call BIS_fnc_param;
_side = [_this, 1, west, [west]] call BIS_fnc_param;
_groupCounts = [_this, 2, [], [[]]] call BIS_fnc_param;
_menCounts = [_this, 3, [], [[]]] call BIS_fnc_param;
_selection = [_this, 4, ["STD", "SF", "GUE"], [[]]] call BIS_fnc_param;
_waypoints = [_this, 5, ["SAD", "CYCLE"], [[]]] call BIS_fnc_param;
_customCode = [_this, 6, "", [""]] call BIS_fnc_param;
_blacklist = [_this, 7, [], [[]]] call BIS_fnc_param;
if (_customCode != "") then {_customCodeComp = compile _customCode};

_groupCount = (_groupCounts select 0) + round(random ((_groupCounts select 1) - (_groupCounts select 0)));
_menCountMin = _menCounts select 0;
_menCountMax = _menCounts select 1;

_totalCount = 0;
for "_i" from 1 to _groupCount do {
	_pos = _area call IP_fnc_SHKPos;
	_menCount = _menCountMin + round(random (_menCountMax - _menCountMin));
	_spawn = [_pos, _side, _menCount, _selection, _blacklist] call IP_fnc_spawnMenGroup;
	_ldr = _spawn select 0;
	_count = _spawn select 1;
	_grp = group _ldr;
	
	_grp setBehaviour "SAFE";	
	{
		_pos = _area call IP_fnc_SHKPos;
		_id = count waypoints _grp; 
		_wp = _grp addWaypoint [_pos, _id];
		_wp setWaypointType _x;
		_wp setWaypointSpeed "LIMITED";
	} forEach _waypoints;
	if (_customCode != "") then {[_ldr, _grp] spawn _customCodeComp};
	
	[_ldr] spawn IP_fnc_track;
	_totalCount = _totalCount + _count;
	sleep 0.3;
};

if (IP_TESTMODE) then {hint format ["IP_fnc_randomPatrolArea\nGroups created: %1\nUnits created: %2", _groupCount, _totalCount]};
_totalCount