_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_ambushPos", "_task", "_taskParams", "_newTaskDescription", "_enemies", "_justPlayers"];
	_mission = "M07";
	_owner = param [0, player, [ObjNull]];
	
	_ownerGrp = group _owner;
	_agentName = name IP_Rival;
	_agentPos = [15801.1,16477.4,12.8105];
	_ambushPos = [15821.9,16444,0.00146389];
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), true, true];
	
	if (isNil "IP_M07_Rival") then {
		_class = typeOf IP_Rival;
		_gear = [IP_Rival] call IP_fnc_getLoadout;
		
		_grp = createGroup west;
		IP_M07_Rival = _grp createUnit [_class, _agentPos, [], 0, "NONE"];
		[[IP_M07_Rival, "IP_M07_Rival"], "setVehicleVarName", nil, true] call BIS_fnc_MP;
		IP_M07_Rival setPosATL _agentPos;
		IP_M07_Rival setDir 54.5044;
		[IP_M07_Rival, _gear] call IP_fnc_setLoadout;
		[[IP_M07_Rival, "rival"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
		[[IP_M07_Rival, "rivalM07OnSite"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
		IP_M07_Rival setUnitPos "MIDDLE";
		IP_M07_Rival disableAI "FSM";
		IP_M07_Rival allowFleeing 0;
		IP_M07_Rival setCombatMode "BLUE";
		IP_M07_Rival setCaptive true;
		[IP_M07_Rival] call IP_fnc_track;
		
		publicVariable "IP_M07_Rival";
	};
	
	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to meet him at the Ghosttown on grid " + (mapGridPosition _agentPos) + ". You will then help him ambushing a " + (getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')) + " convoy coming from CONTENTION 101."), "Ambush", "Meeting"], _agentPos, true, 1, true, "destroy"];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {[_owner, 'rivalM07Go'] call IP_fnc_checkConvKey};
	
	_newTaskDescription = (_taskParams select 2);
	_newTaskDescription set [2, "Ambush"];
	[[_task, _ambushPos], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
	[[_task, _newTaskDescription], "BIS_fnc_taskSetDescription", _ownerGrp] call BIS_fnc_MP;
	
	if (isNil "IP_M07_Car1") then {
		_pos = [15932.5,16961.3,0.00143909];
		_arr = [_pos, 165, "O_MRAP_02_hmg_F", east, true] call BIS_fnc_spawnVehicle;
		IP_M07_Car1 = _arr select 0;
		IP_M07_Car1 lock 3;
		IP_M07_Car1_Crew = _arr select 1;
		IP_M07_Car1_Group = _arr select 2;
		IP_M07_Car1_Group setBehaviour "SAFE";
		[(leader IP_M07_Car1_Group)] call IP_fnc_track;
	};
	
	if (isNil "IP_M07_Car2") then {
		_pos = [15914.5,17009.5,0.00141811];
		_arr = [_pos, 165, "O_MRAP_02_F", east, true] call BIS_fnc_spawnVehicle;
		IP_M07_Car2 = _arr select 0;
		IP_M07_Car2 lock 3;
		IP_M07_Car2_Crew = _arr select 1;
		IP_M07_Car2_Group = _arr select 2;
		IP_M07_Car2_Group setBehaviour "SAFE";
		[(leader IP_M07_Car2_Group)] call IP_fnc_track;
	};
	
	if (isNil "IP_M07_Target") then {
		_pos = getPos IP_M07_Car2;
		IP_M07_Target = IP_M07_Car2_Group createUnit ["O_officer_F", _pos, [], 0, "NONE"];
		_bodyguards = units([_pos, east, 3] call IP_fnc_createContentionPatrol);
		_bodyguards joinSilent IP_M07_Car2_Group;
		{
			IP_M07_Car2_Crew pushBack _x;
			_x moveInCargo IP_M07_Car2;
		} forEach ([IP_M07_Target] + _bodyguards);
	};	
	
	_enemies = IP_M07_Car1_Crew + IP_M07_Car2_Crew;
	{
		[_x] call IP_fnc_createContentionMerc;
		_x allowFleeing 0;
	} forEach _enemies;
	
	IP_M07_Car1_Group move _ambushPos;
	IP_M07_Car2_Group move _ambushPos;
	
	waitUntil {({(_x distance _ambushPos <= 10) OR !(canMove _x) OR !(alive _x)} count [IP_M07_Car1, IP_M07_Car2] > 0) OR ({!(alive _x) OR ([_x] call IP_fnc_enemyDetected)} count _enemies > 0)};

	[[IP_M07_Car1, nil, true], "BIS_fnc_moduleLightning", _ownerGrp] call BIS_fnc_MP;
	IP_M07_Car1 setDamage 1;
	IP_M07_Rival setCombatMode "RED";
	IP_M07_Rival setCaptive false;
	
	sleep 5;
	
	IP_M07_Car2_Group leaveVehicle IP_M07_Car2;	
	
	waitUntil {{alive _x} count _enemies == 0};
	
	sleep 5;
	
	_newTaskDescription = (_taskParams select 2);
	_newTaskDescription set [2, "Talk"];
	[[_task, (getPos IP_M07_Rival)], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
	[[_task, _newTaskDescription], "BIS_fnc_taskSetDescription", _ownerGrp] call BIS_fnc_MP;
	[[1000,[("The convoy has been defeated. Better return to " + _agentName + "."), "PLAIN DOWN", 1, true]], "cutText", _ownerGrp] call BIS_fnc_MP;
	[[IP_M07_Rival, "rivalM07Done"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
	
	waitUntil {_ownerGrp getVariable [("IP_" + _mission + "_QuestDone"), false]};
	
	[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;		
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), nil, true];
	
	_justPlayers = allPlayers - (entities "HeadlessClient_F");
	waitUntil {{_x distance IP_M07_Rival < 500} count _justPlayers == 0};
	
	{
		deleteVehicle _x;
	} forEach ([IP_M07_Rival, IP_M07_Car1, IP_M07_Car2] + _enemies);
	
	IP_M07_Rival = nil;
	IP_M07_Car1 = nil;
	IP_M07_Car1_Crew = nil;
	IP_M07_Car1_Group = nil;
	IP_M07_Car2 = nil;
	IP_M07_Car2_Crew = nil;
	IP_M07_Car2_Group = nil;
	IP_M07_Target = nil;
};