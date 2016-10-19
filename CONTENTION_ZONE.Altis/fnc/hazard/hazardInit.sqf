if (!isServer OR !(isNil "IP_HazardInit")) exitWith {};
IP_HazardInit = true;
publicVariable "IP_HazardInit";

params [
	["_areaCountMin", 0, [0]],
	["_areaCountMax", 0, [0]]
];

private ["_hazardWhitelist", "_hazardBlackList", "_mapCentre", "_mapRadius", "_areaCount", "_logicCentre", "_logicGroup"];
_hazardWhitelist = []; // If more than one element script will only consider whitelisted areas.
_hazardBlackList = []; // If more than one script will determine if possible hazard area centre would be in blacklisted marker area and re-calculate position if necessary.
{
	if (["mWhitelist", _x] call BIS_fnc_inString) then {_hazardWhitelist = _hazardWhitelist + [_x]};
	if (["mBlacklist", _x] call BIS_fnc_inString) then {_hazardBlackList = _hazardBlackList + [_x]};
} forEach allMapMarkers;

if !(SURF_TestMode) then {
	{_x setMarkerAlpha 0} forEach (_HazardWhitelist + _HazardBlackList); // Make White/Blacklistmarkers invisible.
};

_mapCentre = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_mapRadius = getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize") / 4; // Divisor of 2 seems to be too small...
_areaCount = _areaCountMin + round(random(_areaCountMax - _areaCountMin));
_logicCentre = createCenter sideLogic;
_logicGroup = createGroup _logicCentre;

if (_areaCount > 0) then {
	for "_i" from 0 to (_areaCount - 1) do {
		// Determine Position
		_pos = if (count _HazardWhitelist > 0) then {
			private "_possiblePos";
			_whichOne = _HazardWhitelist call BIS_fnc_selectRandom; // Pick random whitelisted zone.
			_possiblePos = [_whichOne, 0] call IP_fnc_SHKPos; // Determine possible area centre pos.
			if (count _HazardBlackList > 0) then { // If there are blacklisted areas.
				while {{[_x, _possiblePos] call BIS_fnc_inTrigger} count _HazardBlackList > 0} do { // Look for new position while current candidate is in blacklisted area.
					_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos;
				};
			};
			_possiblePos // Return final candidate.
		} else {
			private "_possiblePos";
			_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos; // Determine possible area centre pos.
			if (count _HazardBlackList > 0) then { // If there are blacklisted areas.
				while {{[_x, _possiblePos] call BIS_fnc_inTrigger} count _HazardBlackList > 0} do { // Look for new position while current candidate is in blacklisted area.
					_possiblePos = [_mapCentre, _mapRadius, [0, 360], 0] call IP_fnc_SHKPos;
				};
			};
			_possiblePos // Return final candidate.
		};

		_radius = 20 + (random 60); // Determine radius. TODO: ADJUST!
		_hazard = ["BIO", "CHEM", "RAD", "FREEZER", "BLASTER", "TRIP"] call BIS_fnc_selectRandom; // Determine Hazard ToDo: Add more hazards!

		_GL = _logicGroup createUnit ["logic", _pos, [], 0, "NONE"];
		_GL setPos _pos;
		{_GL setVariable _x} forEach [["SURF_Hazard", _hazard, true], ["SURF_Radius", _radius, true]];
		if (_hazard in ["FREEZER"]) then {
			_GL setVariable ["SURF_SafeZone", (_radius * 0.25), true]
		}; // ToDo: Adjust safe zone (25% of radius).
	};
};

{
	_hazard = toUpper(_x getVariable ["SURF_Hazard", ""]);
	if (_hazard != "") then {
		// Hazard specific eventhandlers, code, functions, whatever.
		switch (_hazard) do {
			case "FREEZER": {
				_x spawn {
					_pos = getPos _this;
					_radius = _this getVariable ["SURF_Radius", 99999];
					_this setVariable ["SURF_SafeZone", (_radius * 0.4), true];
					while {true} do {
						_flrObj = _this getVariable ["SURF_FlareObject", ObjNull];
						waitUntil {(!isNull(_pos nearestObject "grenadeHand")) && {(_pos nearestObject "grenadeHand") distance _pos <= _radius} && {isNull _flrObj}}; // Check if throwable is in range.

						_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
						_soundToPlay = _soundPath + "HazardAreas\sounds\single_rumble.ogg";
						playSound3D [_soundToPlay, player];

						_flrObj = "F_20mm_White" createVehicle (_this ModelToWorld [0,0,1.5]);
						_this setVariable ["SURF_FlareObject", _flrObj];

						waitUntil {isNull(_pos nearestObject "grenadeHand")}; // Wait until it's gone.
						sleep 5;
					};
				};
			};

			default {/* Do Nothing */};
		};

		// DEBUG - Create Testmarker for every anomaly (editor placed and random)
		if (SURF_TestMode) then {[_x] call IP_fnc_createHazardMarker};
	};
} forEach (allMissionObjects "logic"); // For all game logics.