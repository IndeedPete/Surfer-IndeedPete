_this spawn {	
	private ["_setSubTask", "_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_task", "_subTasks", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	
	_setSubTask = {
		private ["_taskID", "_ownerGrp", "_subTasks", "_subTasksVar"];
		_taskID = _this select 0;
		_ownerGrp = _this select 1;
		_subTasks = _this select 2;
		_subTasksVar = _ownerGrp getVariable "IP_Min_SubTasks";
		_subTasksVar set [_taskID, true];
		_ownerGrp setVariable ["IP_Min_SubTasks", _subTasksVar, true];
		[[(_subTasks select _taskID), "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	};
	
	_mission = "Min";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Doctor;
	_agentPos = getPosATL IP_Doctor;
	_ownerGrp setVariable ["IP_Min_Started", true, true];

	_task = "t" + _mission;
	_subTasks = [(_task + "BIO"), (_task + "CHEM"), (_task + "RAD"), (_task + "FREEZER"), (_task + "BLASTER"), (_task + "TRIP")];
	_taskParams = [
		[_ownerGrp, _task, [(_agentName + " wants you to scan the anomalies BIO, CHEM, RAD, FREEZER, BLASTER and TRIP! Enter a safe zone of an anomaly to scan it! Explore the area around Sufer's Scrapyard to find the anomalies! Return to " + _agentName + " when you're done!"), "Scan Anomalies", _agentName], nil, true, 1, true, "radio"],
		[_ownerGrp, [(_subTasks select 0), _task], ["Scan a BIO anomaly!", "BIO", ""], nil, false, 1, false, "B"],
		[_ownerGrp, [(_subTasks select 1), _task], ["Scan a CHEM anomaly!", "CHEM", ""], nil, false, 1, false, "C"],
		[_ownerGrp, [(_subTasks select 2), _task], ["Scan a RAD anomaly!", "RAD", ""], nil, false, 1, false, "R"],
		[_ownerGrp, [(_subTasks select 3), _task], ["Scan a FREEZER anomaly!", "FREEZER", ""], nil, false, 1, false, "F"],
		[_ownerGrp, [(_subTasks select 4), _task], ["Scan a BLASTER anomaly!", "BLASTER", ""], nil, false, 1, false, "B"],
		[_ownerGrp, [(_subTasks select 5), _task], ["Scan a TRIP anomaly!", "TRIP", ""], nil, false, 1, false, "T"]
	];
	{[_x, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP} forEach _taskParams;
	
	_ownerGrp setVariable ["IP_Min_SubTasks", [false, false, false, false, false, false], true];
	while {!CHECK && ({_x} count (_ownerGrp getVariable "IP_Min_SubTasks") != count (_ownerGrp getVariable "IP_Min_SubTasks"))} do {
		_leader = leader _ownerGrp;
		
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 0) && {_leader getVariable ["SURF_inBIOHazard", false]}) then {[0, _ownerGrp, _subTasks] call _setSubTask};		
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 1) && {_leader getVariable ["SURF_inCHEMHazard", false]}) then {[1, _ownerGrp, _subTasks] call _setSubTask};		
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 2) && {_leader getVariable ["SURF_inRADHazard", false]}) then {[2, _ownerGrp, _subTasks] call _setSubTask};		
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 3) && {!isNull(_leader getVariable ["SURF_inFREEZER", ObjNull])}) then {[3, _ownerGrp, _subTasks] call _setSubTask};
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 4) && {!isNull(_leader getVariable ["SURF_inBLASTER", ObjNull])}) then {[4, _ownerGrp, _subTasks] call _setSubTask};
		if (!((_ownerGrp getVariable "IP_Min_SubTasks") select 5) && {!isNull(_leader getVariable ["SURF_inTRIP", ObjNull])}) then {[5, _ownerGrp, _subTasks] call _setSubTask};
		
		sleep 1;
	};
	
	if (!CHECK) then {
		[[_task, _agentPos], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
		_ownerGrp setVariable ["IP_Min_SubTasksDone", true, true];
		
		waitUntil {(_ownerGrp getVariable ["IP_Min_QuestDone", false]) OR CHECK};
		
		if (!CHECK) then {
			[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
			[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
		};
	};
	
	_ownerGrp setVariable ["IP_Min_Started", nil, true];
};