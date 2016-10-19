nearestLocations [player, ["NameVillage","NameCity","NameCityCapital","NameLocal","CityCenter","Airport"], 25000]

params [
	["_radius", 100, [0]],
	["_chance", 1, [0]],
	["_cycle", 10, [0]],
	["_condition", {true}, [{}]],
	["_blacklistedObjects", [], [[]]],
	["_blacklistedClasses", ["PowerLines_Wires_base_F","Lamps_base_F","Piers_base_F","Land_NavigLight"], [[]]],
	["_boxClasses", ["Box_IND_Ammo_F","Box_East_Ammo_F","Box_NATO_Ammo_F"], [[]]],
	["_maxMagCount", 5, [0]],
	["_poolProbabilities", [0.1, 0.3, 0.3, 0.3], [[]], 4],
	["_weapons", [], [[]]],
	["_magazines", [], [[]]],
	["_items", [], [[]]],
	["_deadBodies", [], [[]]], 
	"_pools",
	"_oldBuildings",
	"_debugBuildings"
];

if (!isServer OR !(call _condition) OR (!(isNil "IP_LootGeneratorRunning") && {IP_LootGeneratorRunning}) OR ((isNil "IP_ShopInitDone") && {{count _x == 0} count [_weapons, _magazines, _items] > 0})) exitWith {
	"Condition not met, script is already running, script is not running on server, or IP_fnc_shopInit has not been processed!" call BIS_fnc_error;
};

IP_LootGeneratorRunning = true;
publicVariable "IP_LootGeneratorRunning";

if (_cycle < 1) then {_cycle = 1};
if (_chance < 1) then {_chance = 1};
if (_chance > 100) then {_chance = 100};
if (_radius < 100) then {_radius = 100};
if (_radius > 1000) then {_radius = 1000};
if (_maxMagCount < 0) then {_maxMagCount = 0};
if (_maxMagCount > 10) then {_maxMagCount = 10};
if ((_poolProbabilities select 0) + (_poolProbabilities select 1) + (_poolProbabilities select 2) + (_poolProbabilities select 3) != 1) then {_poolProbabilities = [0.1, 0.3, 0.3, 0.3]};

if (count _weapons == 0) then {
	_weapons = IP_AvailableWeapons call IP_fnc_arrayMerge;
};

if (count _magazines == 0) then {
	_magazines = IP_AvailableMagazines call IP_fnc_arrayMerge;
};

if (count _items == 0) then {
	_items = IP_AvailableItems call IP_fnc_arrayMerge;
};

if (count _deadBodies == 0) then {
	_deadBodies = ["Freezoner"];
};

_pools = [_weapons, _magazines, _items, _deadBodies];
_oldBuildings = [];
_debugBuildings = [];

while {call _condition} do {
	_players = allPlayers - entities "HeadlessClient_F";
	
	{
		_unit = _x;
		_pos = getPos _unit;
		_rawBuildings = _pos nearObjects ["House", _radius];
		_blacklistedBuildings = nearestObjects [_pos, _blacklistedClasses, _radius];
		_buildings = _rawBuildings - _blacklistedBuildings - _oldBuildings - _blacklistedObjects;
		_oldBuildings = _oldBuildings + _buildings;
		
		{
			_building = _x;
			_positions = [_building] call BIS_fnc_buildingPositions;
			
			if (count _positions > 0) then {
				private "_boxes";
				_boxes = [];
				
				{
					if (floor(random 100) < _chance) then {
						private "_box";
						_pool = [[0, 1, 2, 3], _poolProbabilities] call BIS_fnc_selectRandomWeighted;
						_loot = (_pools select _pool) call BIS_fnc_selectRandom;
						
						if (_pool == 3) then {
							_box = [_x, _loot] call IP_fnc_createMerc;
							[_box] call IP_fnc_deadBody;
						} else {
							_boxClass = _boxClasses call BIS_fnc_selectRandom;
							_box = _boxClass createVehicle _x;
							_box setDir (random 100);
							_box setPos _x;
							
							clearWeaponCargoGlobal _box;
							clearMagazineCargoGlobal _box;
							clearItemCargoGlobal _box;
							clearBackpackCargoGlobal _box;						
							
							switch (_pool) do {
								case 0: {
									_box addWeaponCargoGlobal [_loot, 1];
									_count = round(random _maxMagCount);
									
									if (_count > 0) then {
										private "_magazines";
										_magazines = getArray(configFile >> "CfgWeapons" >> _loot >> "magazines");
										_muzzles = (getArray(configFile >> "CfgWeapons" >> _loot >> "muzzles")) - ["this"];
										
										if (count _muzzles > 0) then {
											{
												_magazines append (getArray(configFile >> "CfgWeapons" >> _loot >> _x >> "magazines"));
											} forEach _muzzles;
										};
										
										if (count _magazines > 0) then {
											for "_i" from 0 to (_count - 1) do {
												_box addMagazineCargoGlobal [(_magazines call BIS_fnc_selectRandom), 1];
											};
										};
									};
								};
								
								case 1: {								
									_count = round(random _maxMagCount);
									_box addMagazineCargoGlobal [_loot, _count];
								};
								
								case 2: {								
									if ((isClass(configFile >> "CfgVehicles" >> _loot)) && {getNumber(configFile >> "CfgVehicles" >> _loot >> "isBackpack") == 1}) then {
										_box addBackpackCargoGlobal [_loot, 1];
									} else {
										_box addItemCargoGlobal [_loot, 1];
									};
								};
								
								default {};
							};
						};
						
						_boxes pushBack _box;
					};		
				} forEach _positions;
				
				_building setVariable ["IP_LootBoxes", _boxes];
				_debugBuildings pushBack _building;
			};
		} forEach _buildings;
	} forEach _players;
	
	if (IP_TESTMODE) then {		
		private ["_houseCount", "_boxCount"];
		_houseCount = 0;
		_boxCount = 0;
		
		{
			_count = count(_x getVariable ["IP_LootBoxes", []]);
			if (_count > 0) then {			
				_houseCount = _houseCount + 1;
				_boxCount = _boxCount + _count;
			};
		} forEach _debugBuildings;
		
		systemChat format ["IP_fnc_lootGenerator: %1 loot container(s) in %2 of %3 enterable building(s) within %4 metres radius.", _boxCount, _houseCount, (count _debugBuildings), _radius];
	};
	
	sleep _cycle;
	
	{
		_building = _x;
		
		if ({_x distance _building <= _radius} count _players == 0) then {
			_boxes = _building getVariable ["IP_LootBoxes", []];
			
			{
				deleteVehicle _x;
			} forEach _boxes;
			
			_building setVariable ["IP_LootBoxes", nil];
			_oldBuildings = _oldBuildings - [_building];
			_debugBuildings = _debugBuildings - [_building];
		};
	} forEach _oldBuildings;
};