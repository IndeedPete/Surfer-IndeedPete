params [
	["_shopConfig", "ShopWeapons", [""]],
	["_class", "", [""]],
	"_category",
	"_price"
];

_category = [(missionConfigFile >> _shopConfig), _class] call IP_fnc_getConfigCategory;
_price = switch (_shopConfig) do {
	case "ShopWeapons": {
		_res = if (_category != "") then {
			(getNumber(missionConfigFile >> _shopConfig >> _category >> _class >> "price"))
		} else {		
			private "_index";
			{
				_category = _x;
				if ({_x == _class} count _category > 0) exitWith {
					_index = _forEachIndex;
				};
			} forEach IP_AvailableWeapons;
			
			if (isNil "_index") exitWith {0};
			
			private "_add";
			_category = IP_WeaponCategories select _index;
			_basePrice = getNumber(missionConfigFile >> _shopConfig >> _category >> "basePrice");
			_magazines = getArray(configFile >> "CfgWeapons" >> _class >> "magazines");
			_add = 0;
			
			if (_category != "Optics") then {
				private "_caliberHitPairs";				
				_caliberHitSets = [];
				
				{
					_ammo = getText(configFile >> "CfgMagazines" >> _x >> "ammo");
					_count = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
					_caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
					_hit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "hit");
					_hitIndirect = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
					_hitIndirectRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
					_set = [_count, _caliber, _hit, _hitIndirect, _hitIndirectRange];
					if !(_set in _caliberHitSets) then {
						_caliberHitSets pushBack _set;
						_add = _add + (_count * _caliber) + (_hit * 10) + (_hitIndirect * _hitIndirectRange);
					};
				} forEach _magazines;
			} else {
				if (isArray(configFile >> "CfgWeapons" >> _class >> "visionMode")) then {
					{
						if (_x == "NVG") then {
							_add = _add + 250;
						};
						
						if (_x == "TI") then {
							_add = _add + 500;
						};						
					} forEach (getArray(configFile >> "CfgWeapons" >> _class >> "visionMode"));
				};
			};
			
			(_basePrice + _add)
		};
		
		_res
	};
	
	case "ShopMagazines": {
		_res = if (isNumber(missionConfigFile >> "ShopMagazines" >> _class >> "price")) then {
			(getNumber(missionConfigFile >> "ShopMagazines" >> _class >> "price"))
		} else {
			_ammo = getText(configFile >> "CfgMagazines" >> _class >> "ammo");
			_basePrice = if (getNumber(configFile >> "CfgAmmo" >> _ammo >> "explosive") == 1) then {(getNumber(missionConfigFile >> "ShopMagazines" >> "basePriceExplosive"))} else {(getNumber(missionConfigFile >> "ShopMagazines" >> "basePrice"))};
			_count = getNumber(configFile >> "CfgMagazines" >> _class >> "count");
			_caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
			_hit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "hit");
			_hitIndirect = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
			_hitIndirectRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
			(_basePrice + (_count * _caliber) + _hit + (_hitIndirect * _hitIndirectRange))
		};
		
		_res
	};
	
	case "ShopItems": {
		_res = if (isNumber(missionConfigFile >> _shopConfig >> _category >> _class >> "price")) then {
			(getNumber(missionConfigFile >> _shopConfig >> _category >> _class >> "price"))
		} else {
			_cfg = missionConfigFile >> "ShopItems";
			_typeArr = [_class] call BIS_fnc_itemType;
			_cat = _typeArr select 0;
			_type = _typeArr select 1;
			
			_res = switch (_cat) do {
				case "Item": {
					_res = switch (_type) do {
						case "AccessoryMuzzle": {(getNumber(_cfg >> "AttachmentsMuzzle" >> "basePrice"))};
						case "AccessoryPointer": {(getNumber(_cfg >> "AttachmentsRail" >> "basePrice"))};
						case "AccessorySights": {
							private "_add";
							_add = 0;
							_basePrice = getNumber(_cfg >> "AttachmentsOptics" >> "basePrice");
							_sightsCfg = (configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "OpticsModes");
							
							if (isArray _sightsCfg) then {
								{
									_add = _add + (getNumber(_sightsCfg >> _x >> "distanceZoomMax"));
									
									{
										if (_x == "NVG") then {
											_add = _add + 250;
										};
										
										if (_x == "TI") then {
											_add = _add + 500;
										};						
									} forEach (getArray(_sightsCfg >> _x >> "visionMode"));
								} forEach (getArray _sightsCfg);
							};
							
							(_basePrice + _add)
						};
						case "AccessoryBipod": {(getNumber(_cfg >> "AttachmentsUnderBarrel" >> "basePrice"))};
						case "Compass": {(getNumber(_cfg >> "Misc" >> "ItemCompass" >> "price"))};
						case "FirstAidKit": {(getNumber(_cfg >> "Misc" >> "FirstAidKit" >> "price"))};
						case "GPS": {(getNumber(_cfg >> "Misc" >> "ItemGPS" >> "price"))};
						case "Map": {(getNumber(_cfg >> "Misc" >> "ItemMap" >> "price"))};
						case "Medikit": {(getNumber(_cfg >> "Misc" >> "Medikit" >> "price"))};
						case "MineDetector": {(getNumber(_cfg >> "Misc" >> "MineDetector" >> "price"))};
						case "NVGoggles": {(getNumber(_cfg >> "Misc" >> "NVGoggles" >> "price"))};
						case "Radio": {(getNumber(_cfg >> "Misc" >> "ItemRadio" >> "price"))};
						case "Toolkit": {(getNumber(_cfg >> "Misc" >> "Toolkit" >> "price"))};
						case "UAVTerminal": {(getNumber(_cfg >> "Misc" >> "B_UavTerminal" >> "price"))};
						case "Watch": {(getNumber(_cfg >> "Misc" >> "ItemWatch" >> "price"))};
						default {0};
					};
					
					_res
				};
				
				case "Equipment": {
					_res = switch (_type) do {
						case "Glasses": {(getNumber(_cfg >> "Goggles" >> "basePrice"))};
						case "Headgear": {
							_armour = getNumber(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
							_pass = getNumber(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "passThrough");
						
							_res = if ((_armour == 0) OR (_pass == 1)) then {
								(getNumber(_cfg >> "HeadgearSoft" >> "basePrice"))
							} else {
								_basePrice = getNumber(_cfg >> "HeadgearCombat" >> "basePrice");
								_add = if (_armour > 4) then {
									((_armour - 4) * 250)
								} else {
									0
								};
								
								(_basePrice + _add)
							};
							
							_res
						};
						case "Vest": {
							_bodyArmour = if (isNumber(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "armor")) then {
								(getNumber(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "armor"))
							} else {
								1
							};
							_bodyPass = getNumber(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "passThrough");
							_capacity = getNumber(configFile >> "CfgVehicles" >> (getText(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "containerClass")) >> "maximumLoad");
							_capacityAdd = _capacity * 5;
							
							_res = if (((_bodyArmour == 0) OR (_bodyPass == 1)) && {_capacity <= 140}) then {
								_basePrice = getNumber(_cfg >> "VestsLight" >> "basePrice");
								(_basePrice + _capacityAdd)
							} else {
								private "_cumulated";
								_cumulated = 0;
								_hitParts = "isNumber(_x >> 'armor')" configClasses (configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "HitpointsProtectionInfo");
								
								{
									_cumulated = _cumulated + (getNumber(_x >> "armor"));
								} forEach _hitParts;
								
								_cumulatedAdd = _cumulated * 5;
								_res = if (_cumulated < 80) then {
									_basePrice = getNumber(_cfg >> "VestsMedium" >> "basePrice");
									(_basePrice + _capacityAdd + _cumulatedAdd)									
								} else {
									_basePrice = getNumber(_cfg >> "VestsHeavy" >> "basePrice");
									(_basePrice + _capacityAdd + _cumulatedAdd)
								};
								
								_res
							};
							
							_res
						};
						case "Backpack": {
							_capacity = getNumber(configFile >> "CfgVehicles" >> _class >> "maximumLoad");
							_res = if ((isText(configFile >> "CfgVehicles" >> _class >> "backpackSimulation")) && {(getText(configFile >> "CfgVehicles" >> _class >> "backpackSimulation")) == "ParachuteSteerable"}) then {
								(getNumber(_cfg >> "BackpacksParachutes" >> "basePrice"))
							} else {
								_res = if (_capacity <= 0) then {
									(getNumber(_cfg >> "BackpacksStatics" >> "basePrice"))
								} else {
									_basePrice = getNumber(_cfg >> "Backpacks" >> "basePrice");
									_capacityAdd = _capacity * 5;
									(_basePrice + _capacityAdd)
								};
								
								_res
							};
							
							_res
						};
						default {0};
					};
					
					_res
				};
				
				default {0};
			};
			
			_res
		};
		
		_res
	};
	
	case "ShopUniforms": {
		_res = if (_category != "") then {
			(getNumber(missionConfigFile >> _shopConfig >> _category >> _class >> "price"))
		} else {
			_basePrice = getNumber(missionConfigFile >> _shopConfig >> "basePrice");
			_capacity = getNumber(configFile >> "CfgVehicles" >> (getText(configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "containerClass")) >> "maximumLoad");
			_capacityAdd = _capacity * 5;
			(_basePrice + _capacityAdd)
		};
		
		_res
	};
	
	default {0};
};

_price