params [
	["_unitOrPos", [0, 0, 0], [ObjNull, []], 3],
	["_class", "Rifleman", [""]],
	["_side", west, [west]],
	["_grp", grpNull, [grpNull]],
	["_addMoney", false, [true]],
	["_silenced", false, [true]],
	["_rank", "", [""]],
	["_code", {}, [{}]],
	"_getClasses",
	"_cfg",
	"_uniform",
	"_goggles",
	"_headgear",
	"_vest",
	"_backpack",
	"_weapons",
	"_primaryWeapon",
	"_secondaryWeapon",
	"_handgun",
	"_primaryAttachments",
	"_handgunAttachments",
	"_magazines",
	"_items",
	"_linkedItems",
	"_faction",
	"_skill",
	"_insignia",
	"_unit"
];

_getClasses = {
	private "_arr";
	_arr = [];
	
	{
		_arr pushBack (configName _x);
	} forEach _this;
	
	_arr
};

_cfg = missionConfigFile >> "ShopPersonnel" >> "Merc" >> _class;
if (isNull _grp) then {_grp = createGroup _side};
_uniform = if (isText(_cfg >> "uniform")) then {
	(getText(_cfg >> "uniform"))
} else {
	_res = if (isArray(_cfg >> "uniformPools")) then {
		_categories = getArray(_cfg >> "uniformPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopUniforms" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_goggles = if (isText(_cfg >> "goggles")) then {
	(getText(_cfg >> "goggles"))
} else {
	_probability = if (isNumber(_cfg >> "gogglesProbability")) then {(getNumber(_cfg >> "gogglesProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "gogglesPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "gogglesPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopItems" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgGlasses" >> _x >> "scope")) && {getNumber(configFile >> "CfgGlasses" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_headgear = if (isText(_cfg >> "headgear")) then {
	(getText(_cfg >> "headgear"))
} else {
	_probability = if (isNumber(_cfg >> "headgearProbability")) then {(getNumber(_cfg >> "headgearProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "headgearPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "headgearPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopItems" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_vest = if (isText(_cfg >> "vest")) then {
	(getText(_cfg >> "vest"))
} else {
	_probability = if (isNumber(_cfg >> "vestProbability")) then {(getNumber(_cfg >> "vestProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "vestPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "vestPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopItems" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_backpack = if (isText(_cfg >> "backpack")) then {
	(getText(_cfg >> "backpack"))
} else {
	_probability = if (isNumber(_cfg >> "backpackProbability")) then {(getNumber(_cfg >> "backpackProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "backpackPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "backpackPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopItems" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgVehicles" >> _x >> "scope")) && {getNumber(configFile >> "CfgVehicles" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_weapons = if (isArray(_cfg >> "weapons")) then {
	private "_res";
	_elements = getArray(_cfg >> "weapons");
	_res = [];
	
	{
		_add = if ((typeName _x) == "ARRAY") then {
			(_x call BIS_fnc_selectRandom)
		} else {
			_x
		};
		
		_res pushBack _add;
	} forEach _elements;
	
	_res
} else {
	[]
};

_primaryWeapon = if (isText(_cfg >> "primaryWeapon")) then {
	(getText(_cfg >> "primaryWeapon"))
} else {
	_probability = if (isNumber(_cfg >> "primaryWeaponProbability")) then {(getNumber(_cfg >> "primaryWeaponProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "primaryWeaponPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "primaryWeaponPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopWeapons" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_secondaryWeapon = if (isText(_cfg >> "secondaryWeapon")) then {
	(getText(_cfg >> "secondaryWeapon"))
} else {
	_probability = if (isNumber(_cfg >> "secondaryWeaponProbability")) then {(getNumber(_cfg >> "secondaryWeaponProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "secondaryWeaponPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "secondaryWeaponPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopWeapons" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_handgun = if (isText(_cfg >> "handgun")) then {
	(getText(_cfg >> "handgun"))
} else {
	_probability = if (isNumber(_cfg >> "handgunProbability")) then {(getNumber(_cfg >> "handgunProbability"))} else {1};	
	_res = if ((isArray(_cfg >> "handgunPools")) && {(random 1) <= _probability})  then {
		_categories = getArray(_cfg >> "handgunPools");
		private "_elements";
		_elements = [];
			
		{
			_subClasspaths = "(if (isNumber(_x >> 'merc')) then {(getNumber(_x >> 'merc'))} else {1}) == 1" configClasses (missionConfigFile >> "ShopWeapons" >> _x);
			_subClasses = _subClasspaths call _getClasses;
			
			{
				if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {
					_elements pushBack _x;
				};
			} forEach _subClasses;
		} forEach _categories;
		
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_primaryAttachments = if (isArray(_cfg >> "primaryAttachments")) then {
	private "_res";
	_elements = getArray(_cfg >> "primaryAttachments");
	_res = [];
	
	{
		_add = if ((typeName _x) == "ARRAY") then {
			private ["_arr", "_att"];
			_arr = _x;
			_att = "";
			
			while {(_att == "") && {count _arr > 0}} do {
				_can = _arr call BIS_fnc_selectRandom;
				if ((_can == "") OR {(isNumber(configFile >> "CfgWeapons" >> _can >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _can >> "scope") == 2}}) then {
					_att = _can;
				} else {
					_arr = _arr - [_can];
				};
			};
			
			_att
		} else {
			if ((isNumber(configFile >> "CfgWeapons" >> _x >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _x >> "scope") == 2}) then {_x} else {""};
		};
		
		_res pushBack _add;
	} forEach _elements;
	
	_res	
} else {
	[]
};

_handgunAttachments = if (isArray(_cfg >> "handgunAttachments")) then {
	private "_res";
	_elements = getArray(_cfg >> "handgunAttachments");
	_res = [];
	
	{
		_add = if ((typeName _x) == "ARRAY") then {
			private ["_arr", "_att"];
			_arr = _x;
			_att = "";
			
			while {(_att == "") && {count _arr > 0}} do {
				_can = _arr call BIS_fnc_selectRandom;
				if ((_can == "") OR {(isNumber(configFile >> "CfgWeapons" >> _can >> "scope")) && {getNumber(configFile >> "CfgWeapons" >> _can >> "scope") == 2}}) then {
					_att = _can;
				} else {
					_arr = _arr - [_can];
				};
			};
			
			_att
		} else {
			_x
		};
		
		_res pushBack _add;
	} forEach _elements;
	
	_res	
} else {
	[]
};

_magazines = if (isArray(_cfg >> "magazines")) then {
	(getArray(_cfg >> "magazines"))
} else {
	[]
};

if (_primaryWeapon != "") then {
	private "_res";
	_res = [];
	
	if (isNumber(_cfg >> "primaryMagazines")) then {
		_count = getNumber(_cfg >> "primaryMagazines");
		_classes = getArray(configFile >> "CfgWeapons" >> _primaryWeapon >> "magazines");
		_class = _classes select 0;
		
		for "_i" from 0 to (_count - 1) do {
			_res pushBack _class;
		};
	} else {
		if (isArray(_cfg >> "primaryMagazines")) then {
			_numbers = getArray(_cfg >> "primaryMagazines");
			_muzzles = (getArray(configFile >> "CfgWeapons" >> _primaryWeapon >> "muzzles")) - ["this"];
			_countMuzzles = count _muzzles;
			
			{
				private "_class";
				_count = _numbers select _forEachIndex;
				
				if (_forEachIndex == 0) then {
					_classes = getArray(configFile >> "CfgWeapons" >> _primaryWeapon >> "magazines");
					_class = _classes select 0;
				} else {
					_index = _forEachIndex - 1;
					if (_countMuzzles >= _index) then {
						_classes = getArray(configFile >> "CfgWeapons" >> _primaryWeapon >> (_muzzles select _index) >> "magazines");
						_class = _classes select 0;
					};
				};				
				
				for "_i" from 0 to (_count - 1) do {
					_res pushBack _class;
				};
			} forEach _numbers;
		};
	};
	
	if (count _res > 0) then {_magazines append _res};
};

if (_secondaryWeapon != "") then {
	private "_res";
	_res = [];
	
	if (isNumber(_cfg >> "secondaryMagazines")) then {
		_count = getNumber(_cfg >> "secondaryMagazines");
		_classes = getArray(configFile >> "CfgWeapons" >> _secondaryWeapon >> "magazines");
		_class = _classes select 0;
		
		for "_i" from 0 to (_count - 1) do {
			_res pushBack _class;
		};
	} else {
		if (isArray(_cfg >> "secondaryMagazines")) then {
			_numbers = getArray(_cfg >> "secondaryMagazines");
			_muzzles = (getArray(configFile >> "CfgWeapons" >> _secondaryWeapon >> "muzzles")) - ["this"];
			_countMuzzles = count _muzzles;
			
			{
				private "_class";
				_count = _numbers select _forEachIndex;
				
				if (_forEachIndex == 0) then {
					_classes = getArray(configFile >> "CfgWeapons" >> _secondaryWeapon >> "magazines");
					_class = _classes select 0;
				} else {
					_index = _forEachIndex - 1;
					if (_countMuzzles >= _index) then {
						_classes = getArray(configFile >> "CfgWeapons" >> _secondaryWeapon >> (_muzzles select _index) >> "magazines");
						_class = _classes select 0;
					};
				};				
				
				for "_i" from 0 to (_count - 1) do {
					_res pushBack _class;
				};
			} forEach _numbers;
		};
	};
	
	if (count _res > 0) then {_magazines append _res};
};

if (_handgun != "") then {
	private "_res";
	_res = [];
	
	if (isNumber(_cfg >> "handgunMagazines")) then {
		_count = getNumber(_cfg >> "handgunMagazines");
		_classes = getArray(configFile >> "CfgWeapons" >> _handgun >> "magazines");
		_class = _classes select 0;
		
		for "_i" from 0 to (_count - 1) do {
			_res pushBack _class;
		};
	} else {
		if (isArray(_cfg >> "handgunMagazines")) then {
			_numbers = getArray(_cfg >> "handgunMagazines");
			_muzzles = (getArray(configFile >> "CfgWeapons" >> _handgun >> "muzzles")) - ["this"];
			_countMuzzles = count _muzzles;
			
			{
				private "_class";
				_count = _numbers select _forEachIndex;
				
				if (_forEachIndex == 0) then {
					_classes = getArray(configFile >> "CfgWeapons" >> _handgun >> "magazines");
					_class = _classes select 0;
				} else {
					_index = _forEachIndex - 1;
					if (_countMuzzles >= _index) then {
						_classes = getArray(configFile >> "CfgWeapons" >> _handgun >> (_muzzles select _index) >> "magazines");
						_class = _classes select 0;
					};
				};				
				
				for "_i" from 0 to (_count - 1) do {
					_res pushBack _class;
				};
			} forEach _numbers;
		};
	};
	
	if (count _res > 0) then {_magazines append _res};
};

_items = if (isArray(_cfg >> "items")) then {
	private "_res";
	_elements = getArray(_cfg >> "items");
	_res = [];
	
	{
		_add = if ((typeName _x) == "ARRAY") then {
			(_x call BIS_fnc_selectRandom)
		} else {
			_x
		};
		
		_res pushBack _add;
	} forEach _elements;
	
	_res
} else {
	[]
};

_linkedItems = if (isArray(_cfg >> "linkedItems")) then {
	private "_res";
	_elements = getArray(_cfg >> "linkedItems");
	_res = [];
	
	{
		_add = if ((typeName _x) == "ARRAY") then {
			(_x call BIS_fnc_selectRandom)
		} else {
			_x
		};
		
		_res pushBack _add;
	} forEach _elements;
	
	_res
} else {
	[]
};

if ((_rank == "") && {isText(_cfg >> "rank")}) then {
	_rank = getText(_cfg >> "rank");
};
_faction = if (isText(_cfg >> "faction")) then {(getText(_cfg >> "faction"))} else {""};
_skill = if (isNumber(_cfg >> "skill")) then {
	private "_number";
	_number = getNumber(_cfg >> "skill");
	
	if ((_number < 0) OR (_number > 5)) then {
		_number = [0, 1, 2, 3, 4, 5] call BIS_fnc_selectRandom;
	};
	
	_number
} else {
	false
};

_insignia = if (isText(_cfg >> "unitInsignia")) then {
	(getText(_cfg >> "unitInsignia"))
} else {
	_res = if (isArray(_cfg >> "unitInsignias")) then {
		_elements = getArray(_cfg >> "unitInsignias");
		(_elements call BIS_fnc_selectRandom)
	} else {
		""
	};
	
	_res
};

_unit = if (typeName _unitOrPos == "ARRAY") then {
	_classnames = getArray(_cfg >> "baseClasses");
	_i = [west, independent, east] find _side;
	_classname = _classnames select _i;
	_spawned = _grp createUnit [_classname, _unitOrPos, [], 0, "NONE"];
	_spawned
} else {
	_unitOrPos
};

removeAllWeapons _unit;
{_unit unlinkItem _x} forEach (assignedItems _unit);
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeVest _unit;
removeUniform _unit;

_unit forceAddUniform _uniform;
if (_vest != "") then {_unit addVest _vest};
if (_goggles != "") then {_unit addGoggles _goggles};
if (_headgear != "") then {_unit addHeadgear _headgear};
if (_backpack != "") then {_unit addBackpack _backpack};

{_unit addMagazine _x} forEach _magazines;
{_unit linkItem _x} forEach _linkedItems;

if (_primaryWeapon != "") then {
	_unit addWeapon _primaryWeapon;
	
	if (count _primaryAttachments > 0) then {
		{
			if (_x != "") then {
				_unit addPrimaryWeaponItem _x;
			};
		} forEach _primaryAttachments;
	};
};

if (_secondaryWeapon != "") then {
	_unit addWeapon _secondaryWeapon;
};

if (_handgun != "") then {
	_unit addWeapon _handgun;
	
	if (count _handgunAttachments > 0) then {
		{
			if (_x != "") then {
				_unit addHandgunItem _x;
			};
		} forEach _handgunAttachments;
	};
};

{_unit addItem _x} forEach _items;
_unit setVariable ["IP_Merc", true, true];
if (_rank != "") then {_unit setRank _rank};
if (_faction != "") then {_unit setVariable ["IP_Faction", _faction, true]};
if (_insignia != "") then {[_unit, _insignia] call BIS_fnc_setUnitInsignia};
if ((typeName _skill) != "BOOL") then {[_unit, _skill] call IP_fnc_setSkill};
if (_addMoney) then {[_unit] call IP_fnc_takeMoney};
if (_silenced) then {[_unit] call IP_fnc_applySilencer};
_unit call _code;

_unit