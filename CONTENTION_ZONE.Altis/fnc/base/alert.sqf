/*
Name: alert
Author: IndeedPete
Purpose: Launches flare and broadcasts message containing grid coordinates, distance and direction via sideChat.
----------
Parameters:
_where - ARRAY of NUMBER: Position of object (enemy) - [0, 0, 0]
_spotter - OBJECT (OPTIONAL): Unit that broadcasts in sideChat - Player - DEFAULT: Player
_relPos - ARRAY of NUMBER (OPTIONAL): Position from which distance and direction to "where" are calculated - [0, 0, 0] - DEFAULT: (getPos Player)
_markers - ARRAY of STRING: Markers that are placed on last sightings, marking the "where" position - ["m1", "m2", "m3"]
_cond - CODE (OPTIONAL): Condition which will be called before the actual alarm script is being executed. - {alive player} - DEFAULT: {true}
----------
Global Variables:
IP_AlertMarkerIndex - Index of last positioned marker in marker array. Will be created by this function.
*/

_where = [_this, 0, [], [[]]] call BIS_fnc_param;
_spotter = [_this, 1, player, [objNull]] call BIS_fnc_param;
_relPos = [_this, 2, (getPos player), [[]]] call BIS_fnc_param;
_markers = [_this, 3, [], [[]]] call BIS_fnc_param;
_cond = [_this, 4, {true}, [{}]] call BIS_fnc_param;

if ((call _cond)) then {
	_grpID = groupID group _spotter;
	_xFactor = 10;	
	_flareColors = ["F_40mm_Red", "F_40mm_Green", "F_40mm_White", "F_40mm_Yellow"];
	_textArr = ["Enemy spotted at %1, %2 meters, bearing %3, over.", "This is %4 to all units, enemy spotted at %1, %2 meters, direction %3, over.", "Enemy sighted at %1, %2 meters, coming from %3, over.", "Hostile forces incoming, grid coords %1, %2 meters, %3, over.", "Tangos at %1, %2 meters, from %3, over."];
	if (isNil "IP_AlertMarkerIndex") then {IP_AlertMarkerIndex = 0};
	
	_posWhere = getPos _where;
	_gridPosWhere = mapGridPosition _posWhere;
	_distance = ((round ((_where distance _relPos) / _xFactor)) * _xFactor);
	_bearing = [_relPos, _posWhere] call BIS_fnc_dirTo;
	if (_bearing < 0) then {_bearing = _bearing + 360};
	
	_dir = switch (true) do  
	{ 
		case (_bearing <= 22.5 || _bearing > 337.5): {"north"};  
		case (_bearing > 22.5 && _bearing <= 67.5): {"north-east"};  
		case (_bearing > 67.5 && _bearing <= 112.5 ): {"east"};  
		case (_bearing > 112.5 && _bearing <= 157.5): {"south-east"};  
		case (_bearing > 157.5 && _bearing <= 202.5): {"south"};  
		case (_bearing > 202.5 && _bearing <= 247.5): {"south-west"};  
		case (_bearing > 247.5 && _bearing <= 292.5): {"west"};  
		case (_bearing > 292.5 && _bearing <= 337.5): {"north-west"};     
		default {("IP_fnc_alert:\nBearing out of range: " + str(_bearing))};
	}; 
	
	_marker = _markers select IP_AlertMarkerIndex;
	_marker setMarkerPos [(_posWhere select 0), (_posWhere select 1)];
	_marker setMarkerText ([daytime, "HH:MM:SS"] call BIS_fnc_timetostring);
	_marker setMarkerAlpha 1;
	IP_AlertMarkerIndex = (IP_AlertMarkerIndex + 1) mod (count _markers);
	
	_flare = (_flareColors call BIS_fnc_selectRandom) createVehicle [(_posWhere select 0), (_posWhere select 1), 200];
	_flare setVelocity [0, 0, -10];
	_text = format [(_textArr call BIS_fnc_selectRandom), _gridPosWhere, _distance, _dir, _grpID];
	//_nul = [_spotter, _text, "SIDE"] spawn IP_fnc_simpleSentence;
	_spotter sideChat _text;
};