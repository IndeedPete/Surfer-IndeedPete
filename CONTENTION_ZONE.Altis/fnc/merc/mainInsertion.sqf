["IP_BlackScreen", false] call BIS_fnc_blackOut;
IP_Main enableSimulation false;
skipTime 1;

_conversation = [_this, 0, [], [[]]] call BIS_fnc_param;
_tasks = [_this, 1, [], [[]]] call BIS_fnc_param;
_teamParams = [_this, 2, [], [[]]] call BIS_fnc_param;
_unitCapture = [_this, 3, true, [true]] call BIS_fnc_param;
_airSupportPossible = [_this, 4, true, [true]] call BIS_fnc_param;
_insertion = if (isNil "IP_MERCS_Insertion") then {"foot"} else {IP_MERCS_Insertion}; // B_G_Offroad_01_armed_F
_campVehicles = if (isNil "IP_MERCS_CampVehicles") then {[]} else {IP_MERCS_CampVehicles};

switch (_insertion) do {
	case "foot": {
		_marker = "mFootStart";
		_timeout = 10;
		IP_Main setPos (getMarkerPos _marker);
		IP_Main setDir (markerDir _marker);
		
		waitUntil {time > 0};
		_teamParams spawn IP_fnc_spawnTeam;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		
		IP_Main enableSimulation true;
		_handle = _conversation spawn IP_fnc_simpleConversation;
		
		while {((time > 0) && (time < _timeout)) OR (!scriptDone _handle)} do {
			 IP_Main playMove "AmovPercMrunSrasWrflDf";        
			 sleep 1.3;
		};
	};
	
	case "heli": {
		_posStart = getMarkerPos "mHeliStart";
		_posEnd = getMarkerPos "mHeliEnd";
		_dir = markerDir "mHeliStart";
		_dataOrLZ = if (_unitCapture) then {(call(compile(preprocessFileLineNumbers "heliInsertionData.sqf")))} else {getPos IP_LZ};

		_grp = createGroup civilian;
		IP_Pilot = _grp createUnit ["C_man_pilot_F", _posStart, [], 0, "NONE"];
		IP_Copilot = _grp createUnit ["C_man_pilot_F", _posStart, [], 0, "NONE"];
		IP_Heli = createVehicle ["B_Heli_Light_01_F", _posStart, [], 0, "FLY"];
		IP_Heli setDir _dir;
		IP_Heli lock 2;
		IP_Heli allowDamage false;
		IP_Pilot moveInDriver IP_Heli;
		IP_Copilot moveInTurret [IP_Heli, [0]];

		_grp setCombatMode "BLUE";
		_grp allowFleeing 0;
		{_x setCaptive true} forEach units _grp;

		IP_Main moveInCargo [IP_Heli, 4];
		IP_Main enableSimulation true;
		
		waitUntil {time > 0};
	
		private "_handle";
		if (_unitCapture) then {
			_handle = [IP_Heli, _dataOrLZ] spawn BIS_fnc_unitPlay;
			sleep 5;
		} else {
			_grp move _dataOrLZ;
			_handle = _dataOrLZ spawn {
				waitUntil {(IP_Heli distance _this) < 150};
				IP_Heli land "GET OUT";
				IP_Heli lock 0;
				waitUntil {{_x in IP_Heli} count (units group IP_Main) == 0};
				IP_Heli lock 2;
			};
			sleep 5;
		};
		
		_teamParams spawn IP_fnc_spawnTeam;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		_conversation spawn IP_fnc_simpleConversation;		
		
		waitUntil {scriptDone _handle};
		IP_Heli lock 0;
		if (_unitCapture) then {{_x action ["EJECT", IP_Heli]} forEach (units group IP_Main)};
		IP_Heli lock 2;

		_wp = _grp addWaypoint [_posEnd, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach units group this;"];
	};

	case "boat": {
		_posStart = getMarkerPos "mBoatStart";
		_dir = markerDir "mBoatStart";
		
		IP_Boat = createVehicle ["B_G_Boat_Transport_01_F", _posStart, [], 0, "NONE"];
		IP_Boat setDir _dir;
		IP_Boat addEventHandler ["Killed", {
			_vehicle = typeOf (_this select 0);
			_inPosession = IP_Main getVariable ["IP_CampVehicles",[]];
			_inPosession = _inPosession - [_vehicle];
			IP_Main setVariable ["IP_CampVehicles", _inPosession];
		}];
		
		IP_Main moveInDriver IP_Boat;
		IP_Main enableSimulation true;
		IP_Main action ["engineOn", IP_Boat];		
		
		waitUntil {time > 0};
		
		_teamParams spawn IP_fnc_spawnTeam;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		_conversation call IP_fnc_simpleConversation;
	};
	
	default {
		_posStart = getMarkerPos "mCarStart";
		_dir = markerDir "mCarStart";
		
		IP_Car = createVehicle [_insertion, _posStart, [], 0, "NONE"];
		IP_Car setDir _dir;
		IP_Car addEventHandler ["Killed", {
			_vehicle = typeOf (_this select 0);
			_inPosession = IP_Main getVariable ["IP_CampVehicles",[]];
			
			_count = {_x == _vehicle} count _inPosession;
			_inPosession = _inPosession - [_vehicle];
			IP_Main setVariable ["IP_CampVehicles", _inPosession];
			if (_count > 1) then {		
				for "_i" from 1 to (_count - 1) do {
					_inPosession = _inPosession + [_vehicle]; // Adds other vehicles of the same class back to array
					IP_Main setVariable ["IP_CampVehicles", ((IP_Main getVariable "IP_CampVehicles") + [_vehicle])];
				};		
			};
		}];
		
		IP_Main moveInDriver IP_Car;
		IP_Main enableSimulation true;
		IP_Main action ["engineOn", IP_Car];		
		
		waitUntil {time > 0};
		
		_teamParams spawn IP_fnc_spawnTeam;
		["IP_BlackScreen"] call BIS_fnc_blackIn;
		_conversation call IP_fnc_simpleConversation;
	};
};

[] spawn IP_fnc_showOSD;
if (count _tasks > 0) then {{_x call IP_fnc_taskHint} forEach _tasks};
if ((_insertion != "heli") && ("B_Heli_Light_01_F" in _campVehicles) && _airSupportPossible) then {[IP_Main, IP_SuppReq, IP_SuppPro_CAS] call BIS_fnc_addSupportLink};
saveGame;