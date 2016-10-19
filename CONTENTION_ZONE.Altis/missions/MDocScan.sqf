_this spawn {	
	private ["_getLogic", "_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_rewardPerScan", "_task", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	
	_mission = "MDocScan";
	if (isNil "IP_ScannedLogics") then {IP_ScannedLogics = []};
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Doctor;
	_agentPos = getPosATL IP_Doctor;
	_rewardPerScan = getNumber(missionConfigFile >> "rewardPerScan");
	
	_ownerGrp setVariable ["IP_MDocScan_Started", true, true];
	{_x addItem "MineDetector"} forEach (units _ownerGrp);

	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to scan the anomalies BIO, CHEM, RAD, FREEZER, BLASTER and TRIP! Enter a safe zone of an anomaly to scan it! This mission stays persistent, i.e. you can scan as many anomalies as there are in the Zone."), "Scan Anomalies (Persistent)", _agentName], nil, true, 1];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	while {!CHECK} do {
		_leader = leader _ownerGrp;
		_affectingLogics = _leader getVariable ["SURF_AffectingLogics", []];
		
		if ((count _affectingLogics > 0) && {"MineDetector" in (items _leader)}) then {
			{
				if (!(_x in IP_ScannedLogics)) then {
					IP_ScannedLogics pushBack _x;
					_hazard = toUpper(_x getVariable ["SURF_Hazard", ""]);
					[[_x], "IP_fnc_createHazardMarker", nil, true] call BIS_fnc_MP;
					[["AnomalyScanned",[_hazard]], "BIS_fnc_showNotification", _ownerGrp] call BIS_fnc_MP;
					[_rewardPerScan, "IP_fnc_addMoney", _ownerGrp] call BIS_fnc_MP;
				};
			} forEach _affectingLogics;
		};
		
		sleep 5;
	};
};