/*
Name: hunt
Author: IndeedPete
Purpose: One group of units hunts another group of units. Position of hunted group gets revealed to hunting group. Script ends when one of the groups has less then one man standing.
----------
Parameters:
_hunter - OBJECT: Leader of hunting group. - myLittleHunter
_target - OBJECT: Leader of hunted group. - myLittleTarget
*/

private "_target";

_hunter = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_grpH = group _hunter;
_grpT = group _target;

_grpH setBehaviour "AWARE";
_grpH setCombatMode "RED";
_grpH allowFleeing 0;
{_x doTarget _target} forEach units _grpH;

while {((count units _grpH) > 0) && ((count units _grpT) > 0)} do {
	if (!alive _target) then {_target = (leader _grpT)};
	{_x doMove getPos _target} forEach units _grpH;
	sleep 2;
};