_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_task", "_taskParams"];
	_mission = "M04";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Dealer;
	_agentPos = getPosATL IP_Dealer;
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), true, true];
	
	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [("Return to " + _agentName + " at Surfer's Scrapyard on grid " + (mapGridPosition _agentPos) + "."), "Return", _agentName], _agentPos, true, 1, true, "walk"];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {_ownerGrp getVariable [("IP_" + _mission + "_QuestDone"), false]};
	
	[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;		
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), nil, true];
};