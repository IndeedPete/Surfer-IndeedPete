_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_centre", "_agentName", "_agentPos", "_dogs", "_amount", "_task", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	_mission = "M05";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	if (!isNil "IP_M05_Running") exitWith {
		_params = [IP_Dealer, "Someone else just took this job. Come back later!", "DIRECT"];
		[_params, "IP_fnc_simpleSentence", _owner] call BIS_fnc_MP;
	};
	
	IP_M05_Running = true;
	publicVariable "IP_M05_Running";
	_ownerGrp = group _owner;
	_centre = [15735.3, 16005.8, 0.00139475];
	_agentName = name IP_Dealer;
	_agentPos = getPosATL IP_Dealer;
	
	_dogs = [];
	_amount = 8 + round(random 3);
	for "_i" from 0 to _amount do {
		_dog = [_centre, _centre, east, true, 0, [_centre, 50, 100]] call IP_fnc_createZombie;
		_dogs pushBack _dog;
	}; 

	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to kill a pack of zombie wolfs at the old diesel power plant on grid " + (mapGridPosition _centre) + ". Once the wolves are dead return to " + _agentName + " and receive 100 Euro."), "Wolfpack", _agentName], nil, true, 1];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {({(alive _x) && (_x distance _centre < 500)} count _dogs == 0) OR CHECK};
	
	if (!CHECK) then {
		[[_task, _agentPos], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
		[[1000, ["The wolfpack has been eliminated.", "PLAIN DOWN", 1, true]], "cutText", _ownerGrp] call BIS_fnc_MP;
		
		waitUntil {((leader _ownerGrp) distance IP_Dealer <= 2) OR CHECK};
		
		if (!CHECK) then {
			_params = [IP_Dealer, "I'm glad you did it! Here's your reward!", "DIRECT"];
			[_params, "IP_fnc_simpleSentence", _ownerGrp] call BIS_fnc_MP;
			[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
			[100, "IP_fnc_addMoney", _ownerGrp] call BIS_fnc_MP;
			[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
		};
	};
	
	{deleteVehicle _x} forEach _dogs;
	IP_M05_Running = nil;
	publicVariable "IP_M05_Running";
};