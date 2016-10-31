_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_marker", "_buildingPos", "_count", "_weaponPool", "_task", "_taskParams", "_newTaskDescription"];
	_mission = "M06";
	_owner = param [0, player, [ObjNull]];
	
	_ownerGrp = group _owner;
	_agentName = name IP_Rival;
	_agentPos = getPosATL IP_Rival;
	_marker = "S_DEPOT57";
	_buildingPos = (nearestObject [[13092.6,16338.5,0.00143623], "House"]) buildingPos 0;
	_count = count(units _ownerGrp);
	_weaponPool = getArray(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> "O_Soldier_lite_F" >> "primWeaponPool");
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), true, true];
	
	if ({_x == 0} count _buildingPos == 3) then {
		_buildingPos = [13092.6,16338.5,1.00143623];
	};
	
	if (isNil "IP_M06_PatrolGroup") then {
		_patPos = [13117.4,16364.6,0.00140762];
		IP_M06_PatrolGroup = [_patPos, east, [1, (1 + _count)]] call IP_fnc_createContentionPatrol;
		
		_wp = IP_M06_PatrolGroup addWaypoint [_patPos, 0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "LIMITED";
		
		_wp = IP_M06_PatrolGroup addWaypoint [_patPos, 1];
		_wp setWaypointType "CYCLE";
		
		IP_M06_Patrol = units IP_M06_PatrolGroup;
	};
	
	if (isNil "IP_M06_Box") then {
		IP_M06_Box = "Box_IND_Wps_F" createVehicle _buildingPos;
		IP_M06_Box setPos _buildingPos;
		IP_M06_Box setDir (random 360);
		IP_M06_Box allowDamage false;
		publicVariable "IP_M06_Box";
		
		[
			{
				IP_M06_Box_EH = IP_M06_Box addEventHandler ["ContainerOpened", {
					IP_M06_Box removeEventHandler ["ContainerOpened", IP_M06_Box_EH];
					IP_M06_Box_Opened = true;
					publicVariable "IP_M06_Box_Opened";			
				}];
			},
			"BIS_fnc_spawn", 
			_ownerGrp
		] call BIS_fnc_MP;
	};
	
	IP_M06_Box_Opened = false;
	publicVariable "IP_M06_Box_Opened";
	
	clearWeaponCargoGlobal IP_M06_Box;
	clearMagazineCargoGlobal IP_M06_Box;
	clearItemCargoGlobal IP_M06_Box;
	clearBackpackCargoGlobal IP_M06_Box;
	
	for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
		_weapon = _weaponPool call BIS_fnc_selectRandom;
		_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
		IP_M06_Box addWeaponCargoGlobal [_weapon, 1];
		IP_M06_Box addMagazineCargoGlobal [_magazine, 3];
	};
	
	IP_M06_Box addMagazineCargoGlobal ["MiniGrenade", _count];
	IP_M06_Box addMagazineCargoGlobal ["SmokeShell", (_count * 2)];
	
	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to raid the " + (getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')) + " Depot 57 on grid " + (mapGridPosition(getMarkerPos _marker)) + " for supplies. Return to " + _agentName + " at Surfer's Scrapyard on grid " + (mapGridPosition _agentPos) + " once you're done."), "Depot 57", "Depot 57"], _marker, true, 1, true, "rifle"];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {IP_M06_Box_Opened};
	
	_newTaskDescription = (_taskParams select 2);
	_newTaskDescription set [2, _agentName];
	[[_task, _agentPos], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
	[[_task, _newTaskDescription], "BIS_fnc_taskSetDescription", _ownerGrp] call BIS_fnc_MP;
	[[1000,[("You've found the goods. Return to " + _agentName + " ASAP."), "PLAIN DOWN", 1, true]], "cutText", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {_ownerGrp getVariable [("IP_" + _mission + "_QuestDone"), false]};
	
	[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;		
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), nil, true];
	
	{
		deleteVehicle _x;
	} forEach ([IP_M06_Box] + IP_M06_Patrol);
	
	IP_M06_Box = nil;
	IP_M06_PatrolGroup = nil;
	IP_M06_Box_Opened = nil;
};