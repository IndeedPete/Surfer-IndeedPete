_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_deadPos", "_actionParams", "_task", "_taskParams"];
	#define CHECK (!(alive IP_M03_Truck) OR !(canMove IP_M03_Truck) OR (fuel IP_M03_Truck == 0)) //({alive _x} count(units _ownerGrp) == 0)
	_mission = "M03";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Gravedigger;
	_agentPos = getPosATL IP_Gravedigger;
	_deadPos = [12582.9, 16396.9, 0.00113678];
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), true, true];
	
	_actionParams = [
		"<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/> Load Body",
		{
			_unit = _this select 0;
			//_unit moveInCargo IP_M03_Truck;
			_unit attachTo [IP_M03_Truck, [0.2, -2.25, -0.65]];
			_unit setVariable ["IP_InTuck", true, true];
			1000 cutText ["Body loaded.", "PLAIN DOWN", 1, true];
		},
		nil,
		1.5,
		true,
		true,
		"",
		"(_target distance _this <= 3) && (_target distance IP_M03_Truck <= 10) && (vehicle _target == _target) && !(_target getVariable ['IP_InTuck', false])"
	];
	
	if !(isNil "IP_M03_Truck") then {
		IP_M03_Truck spawn {
			sleep 120;
			deleteVehicle _this;
		};
	};
	
	if ((isNil "IP_M03_Truck") OR {CHECK}) then {
		_pos = [12164.3, 16935.4, 0.00119019];
		IP_M03_Truck = "C_Van_01_transport_F" createVehicle _pos;
		IP_M03_Truck allowDamage false;
		//IP_M03_Truck setPos _pos;
		IP_M03_Truck setDir 0;
		IP_M03_Truck setFuel 0.2;
		publicVariable "IP_M03_Truck";
	};
	
	if (!isNil "IP_M03_DeadBodies") then {{deleteVehicle _x} forEach IP_M03_DeadBodies};
	IP_M03_DeadBodies = [];	
	
	for "_c" from 0 to 4 do {
		scopeName "loop";
		private "_pos";
		_pos = [];
		_attempts = 0;
		
		while {_attempts < 1000} do {
			private "_inHazardZone";
			_testPos = [_deadPos, 0, 10, 2, 0, 0.7, 0] call BIS_fnc_findSafePos;
			_nearByLogics = nearestObjects [_testPos, ["logic"], 1001];
			_inHazardZone = false;
			
			{
				if (!(toUpper(_x getVariable ["SURF_Hazard", ""]) in ["", "ZOMBIES"]) && {_testPos distance _x <= (_x getVariable ["SURF_Radius", 99999])}) exitWith {
					_inHazardZone = true;
				};
			} forEach _nearByLogics;
			
			if !(_inHazardZone) then {
				_pos = _testPos;
				breakTo "loop";
			};

			_attempts = _attempts + 1;
		};

		if (count _pos == 0) then {_pos = _deadPos};
		if (count _pos == 2) then {_pos pushBack 0};
		_unit = [_pos] call IP_fnc_createFreezoner;
		if (IP_TESTMODE) then {[_unit] call IP_fnc_track};
		[_unit] call IP_fnc_deadBody;
		[[_unit, _actionParams], "addAction", _ownerGrp] call BIS_fnc_MP;
		
		IP_M03_DeadBodies pushBack _unit;
	};
	
	publicVariable "IP_M03_DeadBodies";
	IP_M03_Truck allowDamage true;
	
	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to take the truck behind the crematory. Then drive to grid " + (mapGridPosition _deadPos) + ", load up the five dead " + getText(missionConfigFile >> "Factions" >> "Freezoners" >> "displayName") + " and return to " + _agentName + ". The mission will fail if the truck gets destroyed."), "Corpse Express", _agentName], nil, true, 1, true, "kill"];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {{_x getVariable ['IP_InTuck', false]} count IP_M03_DeadBodies == count IP_M03_DeadBodies};	
	[[1000, ["All bodies have been loaded into the truck.", "PLAIN DOWN", 1, true]], "cutText", _ownerGrp] call BIS_fnc_MP;	
	waitUntil {(_ownerGrp getVariable ["IP_M03_QuestDone", false]) OR CHECK};
	
	if (!CHECK) then {
		{deleteVehicle _x} forEach IP_M03_DeadBodies;
		IP_M03_DeadBodies = nil;
		[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
		[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
	} else {
		[[_task, "FAILED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
	};
	
	_ownerGrp setVariable [("IP_" + _mission + "_Started"), nil, true];
};