#define TEAM if (typeName _teamParams == "ARRAY") then {_teamParams call IP_fnc_spawnTeam};
#define WAIT sleep _wait;
#define CUTIN ["IP_BlackScreen"] call IP_fnc_blackIn; if (([] call IP_fnc_isNight) && {{_x in (assignedItems player)} count ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "IP_NVGoggles_SNW"] > 0}) then {player action ["NVGoggles", player]}; sleep 0.5;
#define OSD if (count _osd > 0) then {_osd spawn IP_fnc_showOSDIce};
#define CONV if (count _conversation > 0) then {_conversation call IP_fnc_simpleConversationKB};
#define GETIN IP_Vehicle call _getIn;

waitUntil {!(isNil "IP_MainInitDone")};

params [
	["_insertion", (player getVariable ["IP_ShopInsertion", "foot"]), [""]],
	["_osd", [], [[]]],
	["_conversation", [], [[]]],
	["_tasks", [], [[]]],
	["_teamParams", false, [true, []]],
	["_unitCapture", "", ["", [], ObjNull]],
	["_wait", 5, [0]],
	["_savegame", false, [true]],
	"_getIn",
	"_type"
];

_getIn = {
	if ((_this emptyPositions "commander") > 0) then {
		player moveInCommander _this;
	} else {
		if ((_this emptyPositions "driver") > 0) then {
			player moveInDriver _this;
		} else {
			player moveInCargo _this;
		};
	};
};

_type = if (_insertion != "foot") then {
	([(missionConfigFile >> "ShopCampVehicles"), _insertion] call IP_fnc_getConfigCategory)
} else {
	_insertion
};

switch (_type) do {
	case "foot": {
		_marker = "mFootStart";
		player setPos (getMarkerPos _marker);
		player setDir (markerDir _marker);
		player switchMove "amovpercmstpslowwrfldnon";
		
		TEAM		
		WAIT
		CUTIN
		OSD
		CONV		
	};
	
	case "Cars": {
		_posStart = getMarkerPos "mCarStart";
		_dir = markerDir "mCarStart";
		
		IP_Vehicle = createVehicle [_insertion, _posStart, [], 0, "NONE"];
		IP_Vehicle setPos _posStart;
		IP_Vehicle setDir _dir;
		player action ["engineOn", IP_Vehicle];
		IP_Vehicle addEventHandler ["Killed", {
			_vehicle = typeOf (_this select 0);
			_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];			
			_count = {_x == _vehicle} count _vehiclesInPossession;
			_vehiclesInPossession = _vehiclesInPossession - [_vehicle];
			
			if (_count > 1) then {		
				for "_i" from 1 to (_count - 1) do {
					_vehiclesInPossession pushBack _vehicle;
				};
			};
			
			player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
		}];
		
		GETIN
		TEAM		
		WAIT
		CUTIN
		OSD
		CONV
	};
	
	case "Armour": {
		_posStart = getMarkerPos "mCarStart";
		_dir = markerDir "mCarStart";
		
		IP_Vehicle = createVehicle [_insertion, _posStart, [], 0, "NONE"];
		IP_Vehicle setPos _posStart;
		IP_Vehicle setDir _dir;
		player action ["engineOn", IP_Vehicle];
		IP_Vehicle addEventHandler ["Killed", {
			_vehicle = typeOf (_this select 0);
			_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];			
			_count = {_x == _vehicle} count _vehiclesInPossession;
			_vehiclesInPossession = _vehiclesInPossession - [_vehicle];
			
			if (_count > 1) then {		
				for "_i" from 1 to (_count - 1) do {
					_vehiclesInPossession pushBack _vehicle;
				};
			};
			
			player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
		}];
		createVehicleCrew IP_Vehicle;
		(crew IP_Vehicle) joinSilent player;
		(group player) selectLeader player;
		
		GETIN
		TEAM
		WAIT
		CUTIN
		OSD
		CONV
	};
	
	case "Air": {
		_posStart = getMarkerPos "mHeliStart";
		_posEnd = getMarkerPos "mHeliEnd";
		_dir = markerDir "mHeliStart";
		_dataOrLZ = switch (typeName _unitCapture) do {
			case "OBJECT": {(getPos _unitCapture)};
			case "ARRAY": {_unitCapture};
			case "STRING": {(call(compile(preprocessFileLineNumbers _unitCapture)))};		
		};

		IP_Vehicle = createVehicle [_insertion, _posStart, [], 0, "FLY"];
		IP_Vehicle setPos _posStart;
		IP_Vehicle setDir _dir;
		IP_Vehicle lock 2;
		createVehicleCrew IP_Vehicle;
		IP_Vehicle lockDriver true;
		IP_Vehicle lockTurret [[0], true];
		[IP_Vehicle] call IP_fnc_EFHeliDoors;
		
		_objs = (crew IP_Vehicle) + [IP_Vehicle];
		{
			_x setCaptive true;
			_x allowDamage false;
		} forEach _objs;		

		_grp = group (_objs select 0);
		_grp setCombatMode "BLUE";
		_grp allowFleeing 0;

		GETIN
		TEAM		
	
		_handle = if ((typeName _unitCapture) != "OBJECT") then {
			([IP_Vehicle, _dataOrLZ] spawn BIS_fnc_unitPlay)
		} else {
			_grp move _dataOrLZ;
			_handle = _dataOrLZ spawn {
				_units = units(group player);
				waitUntil {(IP_Vehicle distance _this) < 150};
				IP_Vehicle land "GET OUT";
				waitUntil {unitReady IP_Vehicle};
				IP_Vehicle lock 0;
				{
					_x allowDamage false;
					_x action ["GetOut", IP_Vehicle];
				} forEach _units;
				waitUntil {{_x in IP_Vehicle} count (units(group player)) == 0};
				IP_Vehicle lock 2;
				sleep 1;
				if !(IP_TESTMODE) then {{_x allowDamage true} forEach _units};
			};
			
			_handle
		};
		
		WAIT
		CUTIN
		OSD
		CONV
		
		waitUntil {scriptDone _handle};
		if ((typeName _unitCapture) != "OBJECT") then {
			IP_Vehicle lock 0;
			_units = units(group player);
			
			{
				_x allowDamage false;
				_x action ["GetOut", IP_Vehicle];
			} forEach _units;
			
			waitUntil {{!(_x in IP_Vehicle) OR !(alive _x)} count _units == count _units};
			
			if !(IP_TESTMODE) then {{_x allowDamage true} forEach _units};
			IP_Vehicle lock 2;
		};

		_wp = _grp addWaypoint [_posEnd, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach (units(group this));"];
	};

	default {
		TEAM		
		WAIT
		CUTIN
		OSD
		CONV
	};
};

if (count _tasks > 0) then {_tasks call IP_fnc_taskHint};
if (_savegame) then {saveGame};