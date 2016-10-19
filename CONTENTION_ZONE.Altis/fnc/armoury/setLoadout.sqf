#define REPLACE(X) (if (!(X isEqualTo "") && _replace) then {([X, _replacementIdentifier, (missionConfigFile >> "CfgWeaponReplacements"), false] call IP_fnc_replaceWeapons)} else {X})

private ["_unit", "_gear", "_ignoredGear", "_replacementIdentifier", "_replace", "_uniform", "_vest", "_backpack", "_goggles", "_headgear", "_assignedItems", "_primaryWeaponArr", "_secondaryWeaponArr", "_handgunWeaponArr", "_uniformItems", "_vestItems", "_backpackItems", "_weapons", "_uniformItemsOld", "_vestItemsOld", "_backpackItemsOld", "_primaryWeaponArrOld", "_secondaryWeaponArrOld", "_handgunWeaponArrOld"];
_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
_gear = [_this, 1, [], [[]], 13] call BIS_fnc_param;
_ignoredGear = [_this, 2, [], [[]]] call BIS_fnc_param;
_replacementIdentifier = [_this, 3, false, [true, ""]] call BIS_fnc_param;
_replace = (typeName _replacementIdentifier == typeName "") && {_replacementIdentifier != ""};

if (count _ignoredGear > 0) then {
	{
		_entry = _ignoredGear select _forEachIndex;
		_ignoredGear set [_forEachIndex, toLower(_entry)];
	} forEach _ignoredGear;
};

if ((count _gear == 0) OR ("all" in _ignoredGear)) exitWith {};

_uniform = if ("uniform" in _ignoredGear) then {false} else {REPLACE(_gear select 0)};
_vest = if ("vest" in _ignoredGear) then {false} else {REPLACE(_gear select 1)};
_backpack = if ("backpack" in _ignoredGear) then {false} else {REPLACE(_gear select 2)};
_goggles = if ("goggles" in _ignoredGear) then {false} else {REPLACE(_gear select 3)};
_headgear = if ("headgear" in _ignoredGear) then {false} else {REPLACE(_gear select 4)};
_assignedItems = if ("assigneditems" in _ignoredGear) then {false} else {(_gear select 5)};

_primaryWeaponArr = if (("primaryweapon" in _ignoredGear) OR {typeName(_gear select 6) != typeName []}) then {
	false
} else {
	_primaryWeapon = REPLACE((_gear select 6) select 0);
	_primaryWeaponMagazine = if ("primaryweaponmagazine" in _ignoredGear) then {false} else {((_gear select 6) select 1)};
	_primaryWeaponItems = if ("primaryweaponitems" in _ignoredGear) then {false} else {((_gear select 6) select 2)};
	[_primaryWeapon, _primaryWeaponMagazine, _primaryWeaponItems]
};

_secondaryWeaponArr = if (("secondaryweapon" in _ignoredGear) OR {typeName(_gear select 6) != typeName []}) then {
	false
} else {
	_secondaryWeapon = REPLACE((_gear select 7) select 0);
	_secondaryWeaponMagazine = if ("secondaryweaponmagazine" in _ignoredGear) then {false} else {((_gear select 7) select 1)};
	_secondaryWeaponItems = if ("secondaryweaponitems" in _ignoredGear) then {false} else {((_gear select 7) select 2)};
	[_secondaryWeapon, _secondaryWeaponMagazine, _secondaryWeaponItems]
};

_handgunWeaponArr = if (("handgunweapon" in _ignoredGear) OR {typeName(_gear select 6) != typeName []}) then {
	false
} else {
	_handgunWeapon = REPLACE((_gear select 8) select 0);
	_handgunMagazine = if ("handgunmagazine" in _ignoredGear) then {false} else {((_gear select 8) select 1)};
	_handgunItems = if ("handgunitems" in _ignoredGear) then {false} else {((_gear select 8) select 2)};
	[_handgunWeapon, _handgunMagazine, _handgunItems]
};

_uniformItems = if ("uniformitems" in _ignoredGear) then {false} else {(_gear select 9)};
_vestItems = if ("vestitems" in _ignoredGear) then {false} else {(_gear select 10)};
_backpackItems = if ("backpackitems" in _ignoredGear) then {false} else {(_gear select 11)};
_weapons = if ("weapons" in _ignoredGear) then {false} else {(_gear select 12)};

if ((typeName _uniform) == typeName "") then {
	_uniformItemsOld = uniformItems _unit;
	removeUniform _unit;
	_unit forceAddUniform _uniform;
};

if ((typeName _vest) == typeName "") then {
	_vestItemsOld = vestItems _unit;
	removeVest _unit;
	_unit addVest _vest;
};

if ((typeName _backpack) == typeName "") then {
	_backpackItemsOld = backpackItems _unit;
	removeBackpack _unit;
	_unit addBackpack _backpack;
};

if ((typeName _goggles) == typeName "") then {
	removeGoggles _unit;
	_unit addGoggles _goggles;
};

if ((typeName _headgear) == typeName "") then {
	removeHeadgear _unit;
	_unit addHeadgear _headgear;
};

if ((typeName _assignedItems) == typeName []) then {
	removeAllAssignedItems _unit;
	{_unit linkItem _x} forEach _assignedItems;	
};

if ({(typeName _x) == typeName []} count [_primaryWeaponArr, _secondaryWeaponArr, _handgunWeaponArr] > 0) then {
	_primaryWeaponArrOld = [([(primaryWeapon _unit)] call BIS_fnc_baseWeapon), (primaryWeaponMagazine _unit), (primaryWeaponItems _unit)];
	_secondaryWeaponArrOld = [([(secondaryWeapon _unit)] call BIS_fnc_baseWeapon), (secondaryWeaponMagazine _unit), (secondaryWeaponItems _unit)];
	_handgunWeaponArrOld = [([(handgunWeapon _unit)] call BIS_fnc_baseWeapon), (handgunMagazine _unit), (handgunItems _unit)];
	removeAllWeapons _unit;
};

if ((typeName _primaryWeaponArr) == typeName []) then {
	if ((typeName (_primaryWeaponArr select 1)) == typeName true) then {{_unit addMagazine _x} forEach (_primaryWeaponArrOld select 1)} else {{_unit addMagazine _x} forEach (_primaryWeaponArr select 1)};
	_unit addWeapon (_primaryWeaponArr select 0);
	if ((typeName (_primaryWeaponArr select 2)) == typeName true) then {{_unit addPrimaryWeaponItem _x} forEach (_primaryWeaponArrOld select 2)} else {{_unit addPrimaryWeaponItem _x} forEach (_primaryWeaponArr select 2)};
} else {
	if (!(isNil "_primaryWeaponArrOld")) then {
		_unit addMagazine (_primaryWeaponArrOld select 1);
		_unit addWeapon (_primaryWeaponArrOld select 0);
		{_unit addPrimaryWeaponItem _x} forEach (_primaryWeaponArrOld select 2);
	};
};

if ((typeName _secondaryWeaponArr) == typeName []) then {
	if ((typeName (_secondaryWeaponArr select 1)) == typeName true) then {{_unit addMagazine _x} forEach (_secondaryWeaponArrOld select 1)} else {{_unit addMagazine _x} forEach (_secondaryWeaponArr select 1)};
	_unit addWeapon (_secondaryWeaponArr select 0);
	if ((typeName (_secondaryWeaponArr select 2)) == typeName true) then {{_unit addSecondaryWeaponItem _x} forEach (_secondaryWeaponArrOld select 2)} else {{_unit addSecondaryWeaponItem _x} forEach (_secondaryWeaponArr select 2)};
} else {
	if (!(isNil "_secondaryWeaponArrOld")) then {
		_unit addMagazine (_secondaryWeaponArrOld select 1);
		_unit addWeapon (_secondaryWeaponArrOld select 0);
		{_unit addSecondaryWeaponItem _x} forEach (_secondaryWeaponArrOld select 2);
	};
};

if ((typeName _handgunWeaponArr) == typeName []) then {
	if ((typeName (_handgunWeaponArr select 1)) == typeName true) then {{_unit addMagazine _x} forEach (_handgunWeaponArrOld select 1)} else {{_unit addMagazine _x} forEach (_handgunWeaponArr select 1)};
	_unit addWeapon (_handgunWeaponArr select 0);
	if ((typeName (_handgunWeaponArr select 2)) == typeName true) then {{_unit addHandgunItem _x} forEach (_handgunWeaponArrOld select 2)} else {{_unit addHandgunItem _x} forEach (_handgunWeaponArr select 2)};
} else {
	if (!(isNil "_handgunWeaponArrOld")) then {
		_unit addMagazine (_handgunWeaponArrOld select 1);
		_unit addWeapon (_handgunWeaponArrOld select 0);
		{_unit addHandgunItem _x} forEach (_handgunWeaponArrOld select 2);
	};
};

if ((typeName _weapons) == typeName []) then {
	{_unit addWeapon _x} forEach _weapons;
};

if ((typeName _uniformItems) == typeName true) then {
	if (!(isNil "_uniformItemsOld")) then {
		{_unit addItemToUniform _x} forEach _uniformItemsOld;
	};
} else {
	{_unit addItemToUniform _x} forEach _uniformItems;
};

if ((typeName _vestItems) == typeName true) then {
	if (!(isNil "_vestItemsOld")) then {
		{_unit addItemToVest _x} forEach _vestItemsOld;
	};
} else {
	{_unit addItemToVest _x} forEach _vestItems;
};

if ((typeName _backpackItems) == typeName true) then {
	if (!(isNil "_backpackItemsOld")) then {
		{_unit addItemToBackpack _x} forEach _backpackItemsOld;
	};
} else {
	{_unit addItemToBackpack _x} forEach _backpackItems;
};