_this spawn {	
	private ["_mission", "_owner", "_ownerGrp", "_agentName", "_agentPos", "_laptopPos", "_laptopActionParams", "_transmitterActionParams", "_task", "_taskParams"];
	#define CHECK false //({alive _x} count(units _ownerGrp) == 0)
	_mission = "M01";
	_owner = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
	
	_ownerGrp = group _owner;
	_agentName = name IP_Doctor;
	_agentPos = getPosATL IP_Doctor;
	_laptopPos = getPosATL IP_NPP_Laptop;
	_ownerGrp setVariable ["IP_M01_Started", true, true];
	
	_laptopActionParams = [
		IP_NPP_Laptop,
		[
			"<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/> Use Laptop",
			{
				_text = "FROM: vs13@contention.com<br/>TO: jh05@contention.com<br/>SUBJECT: Transmitter on Altis NPP Xeon-538<br/><br/><br/>James,<br/><br/>as per your request I've placed the transmitter on top of the facility to monitor this weird radiation leak. See attached pic.<br/>Let's just hope this won't become another Chernobyl, right Jamesy?! Just joking! ;)<br/>BTW: You're still joining Lenka and me for Christmas, right?<br/><br/>Victor";
				_handle = createDialog "IP_DLG_LAPTOP";
				((findDisplay 50000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);
			},
			nil,
			1.5,
			true,
			true,
			"",
			"(_target distance _this <= 3)"
		]
	];
	
	_transmitterActionParams = [
		IP_NPP_Transmitter,
		[
			"<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/> Take Transmitter",
			{
				_unit = _this select 0;
				_zoner = _this select 1;
				_id = _this select 2;
				_grp = group _zoner;
				
				[[_unit, _id], "removeAction", _grp] call BIS_fnc_MP;
				_grp setVariable ["IP_M01_TransmitterFound", true, true];
			},
			nil,
			1.5,
			true,
			true,
			"",
			"(_target distance _this <= 3) && (leader(group _this) == _this)"
		]
	];
	
	[_laptopActionParams, "addAction", _ownerGrp] call BIS_fnc_MP;
	[_transmitterActionParams, "addAction", _ownerGrp] call BIS_fnc_MP;

	_task = "t" + _mission;
	_taskParams = [_ownerGrp, _task, [(_agentName + " wants you to bring him a transmitting device. The transmitter is connected to a laptop in a tower at the gate of a decommissioned nuclear power plant at grid " + (mapGridPosition _laptopPos) + ". Locate the transmitter and return it to " + _agentName + "."), "Connections", _agentName], nil, true, 1, true, "intel"];
	[_taskParams, "BIS_fnc_taskCreate", _ownerGrp] call BIS_fnc_MP;
	
	waitUntil {(_ownerGrp getVariable ["IP_M01_TransmitterFound", false]) OR CHECK};
	
	if (!CHECK) then {
		[[_task, _agentPos], "BIS_fnc_taskSetDestination", _ownerGrp] call BIS_fnc_MP;
		[[1000, ["You picked up the transmitter data. It must be brought back to Surfer's Scrapyard to be analysed.", "PLAIN DOWN", 1, true]], "cutText", _ownerGrp] call BIS_fnc_MP;
		
		waitUntil {(_ownerGrp getVariable ["IP_M01_QuestDone", false]) OR CHECK};
		
		if (!CHECK) then {
			[[_task, "SUCCEEDED"], "BIS_fnc_taskSetState", _ownerGrp] call BIS_fnc_MP;
			[(units _ownerGrp), _mission] call IP_fnc_setMissionDone;
		};
	};
	
	_ownerGrp setVariable ["IP_M01_Started", nil, true];
};