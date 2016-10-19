if !(isServer) exitWith {};

private ["_cycle", "_radius", "_minRadius", "_maxRadius", "_hazardBlackList", "_pos"];
_cycle = [_this, 0, [300, 600], [[]], 2] call BIS_fnc_param;
_radius = [_this, 1, [250, 500], [[]], 2] call BIS_fnc_param;

_minCycle = _cycle select 0;
_maxCycle = _cycle select 1;
if ((_minCycle < 0) OR (_maxCycle < 0)) exitWith {
	if (IP_TESTMODE) then {
		waitUntil {time > 0};
		systemChat "Blowouts disabled.";
	};
};
if (_minCycle > _maxCycle) exitWith {["Minimum cycle is greater than maximum cycle!"] call BIS_fnc_error};

_minRadius = _radius select 0;
_maxRadius = _radius select 1;
if (_minRadius > _maxRadius) exitWith {["Minimum radius is greater than maximum radius!"] call BIS_fnc_error};

_hazardBlackList = []; // If more than one, script will determine if possible hazard area centre would be in blacklisted marker area and re-calculate position if necessary.
{
	if (["mBlacklist", _x] call BIS_fnc_inString) then {_hazardBlackList pushBack _x};
} forEach allMapMarkers;

while {true} do {
	scopeName "main";
	_sleep = _minCycle + random(_maxCycle - _minCycle);
	if (IP_TESTMODE) then {systemChat (format ["Next Blowout in %1 seconds.", _sleep])};
	sleep _sleep;

	_players = if (count playableUnits == 0) then {[player]} else {playableUnits};
	_anchor = _players call BIS_fnc_selectRandom;
	_centre = getPos _anchor;
	_pos = [];
	_attempts = 0;

	while {_attempts < 1000} do {
		_possiblePos = [_centre, _minRadius, _maxRadius, 2, 0, 0.7, 0] call BIS_fnc_findSafePos;

		if ({[_x, _possiblePos] call BIS_fnc_inTrigger} count _HazardBlackList == 0) then {
			_pos = _possiblePos;
			breakTo "main";
		};

		_attempts = _attempts + 1;
	};

	if (count _pos > 0) then {
		[[_pos], "IP_fnc_blowout", nil] call BIS_fnc_MP;
	} else {
		if (IP_TESTMODE) then {systemChat "Blowout Controller was unable to determine valid position."};
	};
};