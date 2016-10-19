/*
Name: QRF
Author: IndeedPete
Purpose: Fires red flare at and then sends pre-placed quick reaction forces to position.
----------
Parameters:
_alertWhere - ARRAY of NUMBER: Position. - (getPos player)
_QRFs - ARRAY of OBJECT: Leaders of quick reaction forces. - [leader1, leader2, leader3]
*/

_alertWhere = [_this, 0, [], [[]]] call BIS_fnc_param;
_QRFs = [_this, 1, [], [[]]] call BIS_fnc_param;

_flare = "F_40mm_Red" createVehicle[( _alertWhere select 0), (_alertWhere select 1), 200];
_flare setVelocity [0, 0, -10];

{
	_grp = group _x;
	
	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	
	deleteWaypoint [_grp, 0];
	_wp = _grp addWaypoint [_alertWhere, 0];
	_wp setWaypointType "SAD";
} forEach _QRFs;