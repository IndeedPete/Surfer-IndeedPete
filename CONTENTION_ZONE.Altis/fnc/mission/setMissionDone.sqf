private ["_objOrArray", "_mission", "_units"];
_objOrArray = [_this, 0, player, [ObjNull, []]] call BIS_fnc_param;
_mission = [_this, 1, "", [""]] call BIS_fnc_param;
if (_mission == "") exitWith {["Mission key empty!"] call BIS_fnc_error};

_units = if (typeName _objOrArray == "OBJECT") then {[_objOrArray]} else {_objOrArray};
{
	_unit = _x;
	if (!([_unit, _mission] call IP_fnc_missionDone)) then {
		_missionsDone = _unit getVariable ["IP_MissionsDone", []];
		_missionsDone pushBack _mission;
		_unit setVariable ["IP_MissionsDone", _missionsDone, true];
	};
} forEach _units;