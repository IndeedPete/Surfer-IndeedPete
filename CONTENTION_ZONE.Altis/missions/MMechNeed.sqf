_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_reward", "_rewardStr", "_task", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	
	_mission = "MMechNeed";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Mechanic;
	_agentPos = getPosATL IP_Mechanic;
	_reward = (getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Toolkit' >> 'price')) * 0.6;
	_rewardStr = [_reward] call IP_fnc_numberText;
	_ownerGrp setVariable ["IP_MMechNeed_Started", true, true];

	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [("Bring a Toolkit to " + _agentName + " and receive " + _rewardStr + " Euro."), "Mechanic In Need", _agentName], _agentPos, true, 1],
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;	
		
	waitUntil {(_ownerGrp getVariable ["IP_MMechNeed_QuestDone", false]) OR CHECK};
		
	if (!CHECK) then {
		(leader _ownerGrp) removeItem "Toolkit";
		[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
		[_reward, "IP_fnc_addMoney", _ownerGrp] call BIS_fnc_MP;
		[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
	};
	
	_ownerGrp setVariable ["IP_MMechNeed_Started", nil, true];
};