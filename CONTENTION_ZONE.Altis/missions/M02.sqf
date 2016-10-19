_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_gravediggerPos", "_task", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	_mission = "M02";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Dealer;
	_agentPos = getPosATL IP_Dealer;
	_gravediggerPos = getPos IP_Gravedigger;
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), true, true];
	
	deadtruck lock 2;
	[{player action ["lightOn", deadtruck]}, "BIS_fnc_spawn", _ownerGrp, true] call BIS_fnc_MP;
	
	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to talk to the Gravedigger. He runs a crematory at grid " + (mapGridPosition _gravediggerPos) + "."), "The Gravedigger", _agentName], nil, true, 1];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {(_ownerGrp getVariable ["IP_M02_QuestDone", false]) OR CHECK};
	
	if (!CHECK) then {
		[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
		[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
	};
	
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), nil, true];
};