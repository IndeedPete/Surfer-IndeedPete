private ["_getClasses", "_setPrices", "_autoIndexing", "_defaultNavigation", "_inPossession", "_uniformsInPossession", "_enhancementsInPossession", "_vehiclesInPossession", "_serverSide", "_box", "_missions", "_personnelCategories", "_weaponCategories", "_magazines", "_itemCategories", "_uniformCategories", "_enhancements", "_enhancementClasses", "_vehicleCategories"];
_getClasses = {
	private "_arr";
	_arr = [];
	
	{
		_arr pushBack (configName _x);
	} forEach _this;
	
	_arr
};

_setPrices = {
	private ["_cfig", "_arr", "_serverSide"];
	_cfig = _this select 0;
	_arr = _this select 1;
	_serverSide = _this select 2;
	
	{
		_key = "IP_" + _x;
		_price = [_cfig, _x] call IP_fnc_determinePrice;
		IP_Shop_HashMap setVariable [_key, _price, _serverSide];
	} forEach _arr;
};

_autoIndexing = param [0, true, [false]];
_allowModContent = param [1, true, [false]];
_defaultNavigation = "((isNumber(_x >> 'active')) && {(getNumber(_x >> 'active')) == 1})" configClasses (missionConfigFile >> "ShopCategories");
IP_Navigation = param [2, (_defaultNavigation call _getClasses), [[]]];
if (count IP_Navigation > 0) then {IP_LastOpened = IP_Navigation select 0};

_inPossession = param [3, [[],[],[]], [], 3];
_uniformsInPossession = _inPossession select 0;
_enhancementsInPossession = _inPossession select 1;
_vehiclesInPossession = _inPossession select 2;

_serverSide = param [4, true, [false]];
if ((count _this > 5) && {!isDedicated} && {isNull(player getVariable ["IP_ShopBox", ObjNull])}) then {
	_boxParams = param [5, ObjNull, [ObjNull, []]];
	_box = if (typeName _boxParams == "ARRAY") then {
		_class = _boxParams param [0, "Box_NATO_Wps_F", [""]];
		_pos = _boxParams param [1, [0,0,0], [[]], 3];
		_dir = _boxParams param [2, 0, [0]];
		_box = _class createVehicleLocal _pos;
		_box setPosATL _pos;
		_box setDir _dir;
		_box 
	} else {
		_boxParams
	};
	
	if !(isNull _box) then {
		clearBackpackCargo _box;
		clearMagazineCargo _box;
		clearItemCargo _box;
		clearWeaponCargo _box;
		[_box] call IP_fnc_unpackOnContainerClosed;
		player setVariable ["IP_ShopBox", _box];
	};
};

if ((count _this > 6) && {!isDedicated}) then {
	_terminalParams = param [6, [], [[]]];
	_terminal = _terminalParams param [0, ObjNull, [ObjNull]];
	_name = _terminalParams param [1, " Open Shop", [""]];
	_icon = _terminalParams param [2, "<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/>", [""]];
	
	if !(isNull _terminal) then {
		_id = _terminal addAction [(_actionIcon + _actionName), {nul = [] spawn IP_fnc_openShop}, [], 1.5, false, true, "", "(_this distance _target < 3)"];
		_terminal setVariable ["IP_ShopAction", _id];
	};
};

if !(isDedicated) then {
	[] spawn {
		waitUntil {time > 0};
		player createDiarySubject ["Funds", "Account"];
		player createDiaryRecord ["Funds", [(name player), "Account Balance: +" + ([(player getVariable ["IP_ShopMoney", 0])] call IP_fnc_numberText) + " " + (getText(missionConfigFile >> "ShopMetaInformation" >> "currency"))]];
	};
};

if ((_serverSide && {!isServer}) OR (!_serverSide && {isDedicated})) exitWith {};
IP_Shop_HashMap = if (_serverSide && {isNil "IP_Shop_HashMap"}) then {
	_logicCentre = createCenter sideLogic;
	_logicGroup = createGroup _logicCentre;
	(_logicGroup createUnit ["logic", [0,0,0], [], 0, "NONE"])
} else {
	player
};

_missions = "(isNumber(_x >> 'condition') && {(getNumber(_x >> 'condition') == 1) && {getText(_x >> 'stage') == getText(missionConfigFile >> 'stage')} && {!([(configName _x)] call IP_fnc_missionDone)}}) OR {isText(_x >> 'condition') && {call(compile(getText(_x >> 'condition')))}}" configClasses (missionConfigFile >> "ShopMissions");
IP_AvailableMissions = _missions call _getClasses;

_personnelCategories = "((if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1) && {count _x > 0}" configClasses (missionConfigFile >> "ShopPersonnel");
IP_PersonnelCategories = _personnelCategories call _getClasses;
IP_PersonnelFilters = ["All"] + IP_PersonnelCategories;
IP_AvailablePersonnel = [];
{
	private "_personnel";
	_personnel = [];
	_personnelClasspaths = "((isNumber(_x >> 'costRate')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopPersonnel" >> _x);
	_personnelClasses = _personnelClasspaths call _getClasses;
	
	{
		if ((isNumber(configFile >> "CfgVehicles" >> _x >> "scope")) && {getNumber(configFile >> "CfgVehicles" >> _x >> "scope") == 2}) then {
			_personnel pushBack _x;
		};
	} forEach _personnelClasses;
	
	IP_AvailablePersonnel pushBack _personnel;
} forEach IP_PersonnelCategories;

_weaponCategories = "((if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1) && {count _x > 0}" configClasses (missionConfigFile >> "ShopWeapons");
IP_WeaponCategories = _weaponCategories call _getClasses;
IP_WeaponFilters = ["All"] + IP_WeaponCategories;
IP_AvailableWeapons = [];
{
	private "_weapons";
	_weapons = [];
	_weaponClasspaths = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopWeapons" >> _x);
	_weaponClasses = _weaponClasspaths call _getClasses;
	
	{
		if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
			_weapons pushBack _x;
		};
	} forEach _weaponClasses;
	
	IP_AvailableWeapons pushBack _weapons;
} forEach IP_WeaponCategories;

if (_autoIndexing) then {
	_weaponClasspaths = "((getText(_x >> 'simulation') == 'weapon') && {isNumber(_x >> 'scope')} && {getNumber(_x >> 'scope') == 2})" configClasses (configFile >> "CfgWeapons");
	_weaponClasses = _weaponClasspaths call _getClasses;
	
	{
		if ((([_x] call BIS_fnc_baseWeapon) == _x) && {([(missionConfigFile >> "ShopWeapons"), _x] call IP_fnc_getConfigCategory) == ""}) then {
			private "_category";
			_category = switch (getText(configFile >> "CfgWeapons" >> _x >> "cursor")) do {
				case "laserdesignator": {"Optics"};
				case "hgun": {"Pistols"};
				case "smg": {"SMG"};
				case "sgun": {"Carbines"};
				case "arifle": {"Rifles"};
				case "mg": {"LMG"};
				case "srifle": {"Marksman"};
				case "missile": {"Launchers"};
				case "rocket": {"Launchers"};
				default {""};
			};
			
			_muzzles = (getArray(configFile >> "CfgWeapons" >> _x >> "muzzles")) - ["this"];
			if (count _muzzles > 0) then {
				_weapon = _x;
				
				{
					if (((getText(configFile >> "CfgWeapons" >> _weapon >> _x >> "cursor")) == "EmptyCursor") && {(getText(configFile >> "CfgWeapons" >> _weapon >> _x >> "cursorAim")) == "gl"}) exitWith {
						_category = "RiflesGL";
					};
				} forEach _muzzles;
			};
			
			_index = IP_WeaponCategories find _category;
			if (_index >= 0) then {
				(IP_AvailableWeapons select _index) pushBack _x;
			};
		};
	} forEach _weaponClasses;
};

IP_AvailableMagazines = [];
_magazines = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopMagazines");
{
	_class = configName _x;
	if ((isClass(configFile >> "CfgMagazines" >> _class)) && {getNumber(configFile >> "CfgMagazines" >> _class >> "scope") == 2}) then {
		IP_AvailableMagazines pushBack _class;
	};
} forEach _magazines;

if (_autoIndexing) then {
	_allWeapons = ["Throw", "Put"] + (IP_AvailableWeapons call IP_fnc_arrayMerge);
	
	{
		private ["_mags"];
		_weapon = _x;
		_mags = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines");
		_muzzles = getArray(configFile >> "CfgWeapons" >> _weapon >> "muzzles");
		if (count _muzzles > 1) then {
			{
				_mags append (getArray(configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines"));
			} forEach (_muzzles - ["this"]);
		};
		
		{
			_mag = _x;
			if (({_x == _mag} count IP_AvailableMagazines == 0) && {!(isClass(missionConfigFile >> "ShopMagazines" >> _mag))}) then {
				IP_AvailableMagazines pushBack _mag;
			};
		} forEach _mags;
	} forEach _allWeapons;
};

_itemCategories = "((if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1) && {count _x > 0}" configClasses (missionConfigFile >> "ShopItems");
IP_ItemCategories = _itemCategories call _getClasses;
IP_ItemFilters = ["All"] + IP_ItemCategories;
IP_AvailableItems = [];
{
	private "_items";
	_items = [];
	_itemClasspaths = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopItems" >> _x);
	_itemClasses = _itemClasspaths call _getClasses;
	
	{
		if (((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) OR {(isNumber(configFile >> "CfgVehicles" >> _x >> "scope")) && {getNumber(configFile >> "CfgVehicles" >> _x >> "scope") == 2}} OR {(isNumber(configFile >> "CfgGlasses" >> _x >> "scope")) && {getNumber(configFile >> "CfgGlasses" >> _x >> "scope") == 2}}) then {
			_items pushBack _x;
		};
	} forEach _itemClasses;
	
	IP_AvailableItems pushBack _items;
} forEach IP_ItemCategories;

if (_autoIndexing) then {
	_itemClasspaths = "((isNumber(_x >> 'scope')) && {getNumber(_x >> 'scope') == 2})" configClasses (configFile >> "CfgWeapons");
	_itemClasspaths = _itemClasspaths + ("((isNumber(_x >> 'isBackpack')) && {getNumber(_x >> 'isBackpack') == 1} && {isNumber(_x >> 'scope')} && {getNumber(_x >> 'scope') == 2})" configClasses (configFile >> "CfgVehicles"));
	_itemClasses = _itemClasspaths call _getClasses;
	
	{
		_typeArr = [_x] call BIS_fnc_itemType;
		_cat = _typeArr select 0;
		_type = _typeArr select 1;
		
		_category = switch (_cat) do {
			case "Item": {
				_res = switch (_type) do {
					case "AccessoryMuzzle": {"AttachmentsMuzzle"};
					case "AccessoryPointer": {"AttachmentsRail"};
					case "AccessorySights": {"AttachmentsOptics"};
					case "AccessoryBipod": {"AttachmentsUnderBarrel"};
					case "Compass": {"Misc"};
					case "FirstAidKit": {"Misc"};
					case "GPS": {"Misc"};
					case "Map": {"Misc"};
					case "Medikit": {"Misc"};
					case "MineDetector": {"Misc"};
					case "NVGoggles": {"Misc"};
					case "Radio": {"Misc"};
					case "Toolkit": {"Misc"};
					case "UAVTerminal": {"Misc"};
					case "Watch": {"Misc"};
					default {""};
				};
				
				_res
			};
			
			case "Equipment": {
				_res = switch (_type) do {
					case "Glasses": {"Goggles"};
					case "Headgear": {
						_armour = getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
						_pass = getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "passThrough");
						
						if ((_armour == 0) OR (_pass == 1)) then {
							"HeadgearSoft"
						} else {
							"HeadgearCombat"
						}
					};
					case "Vest": {
						_bodyArmour = if (isNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "armor")) then {
							(getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "armor"))
						} else {
							1
						};
						_bodyPass = getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "passThrough");
						_capacity = getNumber(configFile >> "CfgVehicles" >> (getText(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "containerClass")) >> "maximumLoad");
						
						if (((_bodyArmour == 0) OR (_bodyPass == 1)) && {_capacity <= 140}) then {
							"VestsLight"
						} else {
							private "_cumulated";
							_cumulated = 0;
							_hitParts = "isNumber(_x >> 'armor')" configClasses (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo");
							
							{
								_cumulated = _cumulated + (getNumber(_x >> "armor"));
							} forEach _hitParts;
							
							if (_cumulated < 80) then {
								"VestsMedium"
							} else {
								"VestsHeavy"
							}
						}
					};
					case "Backpack": {
						_res = if ((isText(configFile >> "CfgVehicles" >> _x >> "backpackSimulation")) && {(getText(configFile >> "CfgVehicles" >> _x >> "backpackSimulation")) == "ParachuteSteerable"}) then {
							"BackpacksParachutes"
						} else {
							_res = if ((getNumber(configFile >> "CfgVehicles" >> _x >> "maximumLoad")) <= 0) then {
								"BackpacksStatics"
							} else {
								"Backpacks"
							};
							
							_res
						};
						
						_res
					};
					default {""};
				};
				
				_res
			};
			
			default {""};
		};
		
		_backpackCheck = if (_category == "Backpacks") then {((_x call BIS_fnc_basicBackpack) == _x)} else {true};
		if (_backpackCheck && {([(missionConfigFile >> "ShopItems"), _x] call IP_fnc_getConfigCategory) == ""}) then {			
			_index = IP_ItemCategories find _category;
			if (_index >= 0) then {
				(IP_AvailableItems select _index) pushBack _x;
			};
		};
	} forEach _itemClasses;
};

_uniformCategories = "((if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1) && {count _x > 0}" configClasses (missionConfigFile >> "ShopUniforms");
IP_UniformCategories = _uniformCategories call _getClasses;
IP_UniformFilters = ["All"] + IP_UniformCategories;
IP_AvailableUniforms = [];
{
	private "_uniforms";
	_uniforms = [];
	_uniformClasspaths = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopUniforms" >> _x);
	_uniformClasses = _uniformClasspaths call _getClasses;
	
	{
		if (!(_x in _uniformsInPossession) && {isNumber(configFile >> "CfgWeapons" >> _x >> "scope")} && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
			_uniforms pushBack _x;
		};
	} forEach _uniformClasses;
	
	IP_AvailableUniforms pushBack _uniforms;
} forEach IP_UniformCategories;

if (_autoIndexing) then {
	_uniformClasspaths = "((getText(_x >> 'simulation') == 'weapon') && {(getNumber(_x >> 'type') == 131072) OR (getText(_x >> 'type') == '131072')} && {getNumber(_x >> 'itemInfo' >> 'type') == 801} && {isNumber(_x >> 'scope')} && {getNumber(_x >> 'scope') == 2})" configClasses (configFile >> "CfgWeapons");
	_uniformClasses = _uniformClasspaths call _getClasses;
	
	{
		if (([(missionConfigFile >> "ShopUniforms"), _x] call IP_fnc_getConfigCategory) == "") then {			
			_index = IP_UniformCategories find "Military";
			if (_index >= 0) then {
				(IP_AvailableUniforms select _index) pushBack _x;
			};
		};
	} forEach _uniformClasses;
};

_enhancements = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopCampEnhancements");
_enhancementClasses = _enhancements call _getClasses;
IP_AvailableCampEnhancements = [];
{
	if !(_x in _enhancementsInPossession) then {IP_AvailableCampEnhancements pushBack _x};
} forEach _enhancementClasses;

_vehicleCategories = "((if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1) && {count _x > 0}" configClasses (missionConfigFile >> "ShopCampVehicles");
IP_CampVehicleCategories = _vehicleCategories call _getClasses;
IP_CampVehicleFilters = ["All"] + IP_CampVehicleCategories;
IP_AvailableCampVehicles = [];
{
	private "_vehicles";
	_category = _x;
	_vehicles = [];
	_vehicleClasspaths = "((isNumber(_x >> 'price')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopCampVehicles" >> _category);
	_vehicleClasses = _vehicleClasspaths call _getClasses;
	_index = _forEachIndex;
	
	{
		_unique = if (isNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _x >> "unique")) then {(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _x >> "unique"))} else {0};
		if ((isNumber(configFile >> "CfgVehicles" >> _x >> "scope")) && {getNumber(configFile >> "CfgVehicles" >> _x >> "scope") == 2} && {(_unique == 0) OR !(_x in _vehiclesInPossession)}) then {
			_vehicles pushBack _x;
		};
	} forEach _vehicleClasses;
	
	IP_AvailableCampVehicles pushBack _vehicles;
} forEach IP_CampVehicleCategories;

["ShopWeapons", (IP_AvailableWeapons call IP_fnc_arrayMerge), _serverSide] call _setPrices;
["ShopMagazines", IP_AvailableMagazines, _serverSide] call _setPrices;
["ShopItems", (IP_AvailableItems call IP_fnc_arrayMerge), _serverSide] call _setPrices;
["ShopUniforms", (IP_AvailableUniforms call IP_fnc_arrayMerge), _serverSide] call _setPrices;
[] call IP_fnc_updateStocks;
IP_ShopInitDone = true;

if (_serverSide) then {
	{publicVariable _x} forEach ["IP_AvailableMissions", "IP_PersonnelCategories", "IP_PersonnelFilters", "IP_AvailablePersonnel", "IP_WeaponCategories", "IP_WeaponFilters", "IP_AvailableWeapons", "IP_AvailableMagazines", "IP_ItemCategories", "IP_ItemFilters", "IP_AvailableItems", "IP_UniformCategories", "IP_UniformFilters", "IP_AvailableUniforms", "IP_AvailableCampEnhancements", "IP_CampVehicleCategories", "IP_CampVehicleFilters", "IP_AvailableCampVehicles", "IP_LastStocks", "IP_AvailableStocks", "IP_LastStockMarketAccess", "IP_ShopInitDone"];
};