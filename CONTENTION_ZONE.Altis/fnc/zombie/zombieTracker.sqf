if (!isServer) exitWith {};

private ["_spawnDistance", "_side", "_animalRatio", "_skillRange", "_newlogics", "_cycle", "_oldLogics"];
_spawnDistance = [_this, 0, 1500, [0]] call BIS_fnc_param;
_side = [_this, 1, east, [west]] call BIS_fnc_param;
_animalRatio = [_this, 2, 0.2, [0]] call BIS_fnc_param;
_skillRange = [_this, 3, 0, [0, []]] call BIS_fnc_param;
_cycle = [_this, 4, 3, [0]] call BIS_fnc_param;
_oldLogics = [];

if (!isNil "IP_ZombieTrackerRunning") exitWith {["Tracker already running, script terminated."] call BIS_fnc_error};
IP_ZombieTrackerRunning = true;

while {true} do {	
	_newlogics = [];
	
	{
		_logic = _x;
		if ((toUpper(_logic getVariable ["SURF_Hazard", ""]) == "ZOMBIES") && {{(_x distance _logic) <= _spawnDistance} count ([player] + playableUnits) > 0}) then {
			_newlogics pushBack _logic;
		};
	} forEach (allMissionObjects "logic");
	
	_toProcessOld = _oldLogics - _newlogics;
	_toProcessNew = _newlogics - _oldLogics;

	if (count _toProcessOld > 0) then {
		{
			if (!isNull _x) then {
				_logic = _x;
				_zombies = _logic getVariable ["SURF_Zombies", []];
				{deleteVehicle _x} forEach _zombies;
				_logic setVariable ["SURF_Zombies", nil];
			};
		} forEach _toProcessOld;
	};
	
	if (count _toProcessNew > 0) then {
		{
			_logic = _x;
			_logicPos = getPos _logic;
			_idleRadius = if ((_logic getVariable ["SURF_ZombieIdleRadius", 0]) > 0) then {(_logic getVariable "SURF_ZombieIdleRadius")} else {50};
			_detectionRadius = if ((_logic getVariable ["SURF_ZombieDetectionRadius", 0]) > 0) then {(_logic getVariable "SURF_ZombieDetectionRadius")} else {1000};
			_amount = if ((typeName(_logic getVariable ["SURF_ZombieAmount", 0])) == "SCALAR") then {
				_amount = if ((_logic getVariable ["SURF_ZombieAmount", 0]) > 0) then {
					(_logic getVariable "SURF_ZombieAmount")
				} else {
					(round(_idleRadius * 0.1)) // ToDo: Change!
				};
				_amount
			} else {
				_amountArr = _logic getVariable "SURF_ZombieAmount";
				_amountMin = _amountArr select 0;
				_amountMax = _amountArr select 1;
				_amount = _amountMin + (random(_amountMax - _amountMin));
				(round _amount)				
			};
			_side = if ((_logic getVariable ["SURF_ZombieSide", east]) != east) then {(_logic getVariable "SURF_ZombieSide")} else {_side};
			_animalRatio = if ((_logic getVariable ["SURF_ZombieAnimalRatio", 0]) > 0) then {(_logic getVariable "SURF_ZombieAnimalRatio")} else {_animalRatio};
			_skillRange = if ((typeName(_logic getVariable ["SURF_ZombieSkillRange", -1])) == "SCALAR") then {
				_skillRange = if ((_logic getVariable ["SURF_ZombieSkillRange", -1]) >= 0) then {
					(_logic getVariable "SURF_ZombieSkillRange")
				} else {
					_skillRange
				};
				_skillRange
			} else {
				(_logic getVariable "SURF_ZombieSkillRange")
			};
			
			private "_zombies";
			_zombies = [];
			
			for "_i" from 0 to (_amount - 1) do {
				_spawnPos = [_logicPos, _idleRadius] call IP_fnc_SHKPos;
				_isAnimal = if ((random 1) <= _animalRatio) then {true} else {false};
				_skill = if (typeName _skillRange == "ARRAY") then {
					_skillMin = _skillRange select 0;
					_skillMax = _skillRange select 1;
					_skill = _skillMin + (random(_skillMax - _skillMin));
					(round _skill)		
				} else {
					_skillRange
				};
				
				_zombie = [_spawnPos, _logic, _side, _isAnimal, _skill, [_logic, _idleRadius, _detectionRadius]] call IP_fnc_createZombie;
				_zombies pushBack _zombie;				
			};
			
			_logic setVariable ["SURF_Zombies", _zombies];
		} forEach _toProcessNew;
	};
	
	_oldLogics = _newlogics;
	sleep _cycle;
};