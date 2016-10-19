private ["_unit", "_ignoredGear", "_delete", "_uniform", "_vest", "_backpack", "_goggles", "_headgear", "_assignedItems", "_primaryWeaponArr", "_secondaryWeaponArr", "_handgunWeaponArr", "_uniformItems", "_vestItems", "_backpackItems", "_weapons"];
_unit = [_this, 0, player, [ObjNull, ""]] call BIS_fnc_param;
_ignoredGear = [_this, 1, [], [[]]] call BIS_fnc_param;
_delete = false;

if (typeName _unit == "STRING") then {
	if (!(isClass(configFile >> "CfgVehicles" >> _unit)) OR {(getNumber(configFile >> "CfgVehicles" >> _unit >> "scope")) != 2}) exitWith {
		_unit = ObjNull;
	};
	
	_unit = (createGroup civilian) createUnit [_unit, [0,0,0], [], 0, "NONE"];
	[_unit] call IP_fnc_disable;
	_delete = true;
};

if (isNull _unit) exitWith {
	"_unit is null!" call BIS_fnc_error;
};

if (count _ignoredGear > 0) then {
	{
		_entry = _ignoredGear select _forEachIndex;
		_ignoredGear set [_forEachIndex, toLower(_entry)];
	} forEach _ignoredGear;
};

_uniform = if ("uniform" in _ignoredGear) then {false} else {(uniform _unit)};
_vest = if ("vest" in _ignoredGear) then {false} else {(vest _unit)};
_backpack = if ("backpack" in _ignoredGear) then {false} else {([(backpack _unit)] call IP_fnc_getBaseBackpack)};
_goggles = if ("goggles" in _ignoredGear) then {false} else {(goggles _unit)};
_headgear = if ("headgear" in _ignoredGear) then {false} else {(headgear _unit)};
_assignedItems = if ("assigneditems" in _ignoredGear) then {false} else {(assignedItems _unit)};

_primaryWeaponArr = if ("primaryweapon" in _ignoredGear) then {
	false
} else {
	_primaryWeapon = [(primaryWeapon _unit)] call BIS_fnc_baseWeapon;
	_primaryWeaponMagazine = if ("primaryweaponmagazine" in _ignoredGear) then {false} else {(primaryWeaponMagazine _unit)};
	_primaryWeaponItems = if ("primaryweaponitems" in _ignoredGear) then {false} else {(primaryWeaponItems _unit)};
	[_primaryWeapon, _primaryWeaponMagazine, _primaryWeaponItems]
};

_secondaryWeaponArr = if ("secondaryweapon" in _ignoredGear) then {
	false
} else {
	_secondaryWeapon = [(secondaryWeapon _unit)] call BIS_fnc_baseWeapon;
	_secondaryWeaponMagazine = if ("secondaryweaponmagazine" in _ignoredGear) then {false} else {(secondaryWeaponMagazine _unit)};
	_secondaryWeaponItems = if ("secondaryweaponitems" in _ignoredGear) then {false} else {(secondaryWeaponItems _unit)};
	[_secondaryWeapon, _secondaryWeaponMagazine, _secondaryWeaponItems]
};

_handgunWeaponArr = if ("handgunweapon" in _ignoredGear) then {
	false
} else {
	_handgunWeapon = [(handgunWeapon _unit)] call BIS_fnc_baseWeapon;
	_handgunMagazine = if ("handgunmagazine" in _ignoredGear) then {false} else {(handgunMagazine _unit)};
	_handgunItems = if ("handgunitems" in _ignoredGear) then {false} else {(handgunItems _unit)};
	[_handgunWeapon, _handgunMagazine, _handgunItems]
};

_uniformItems = if ("uniformitems" in _ignoredGear) then {false} else {(uniformItems _unit)};
_vestItems = if ("vestitems" in _ignoredGear) then {false} else {(vestItems _unit)};
_backpackItems = if ("backpackitems" in _ignoredGear) then {false} else {(backpackItems _unit)};
_weapons = if ("weapons" in _ignoredGear) then {false} else {
	_weapons = (weapons _unit) - [(primaryWeapon _unit), (secondaryWeapon _unit), (handgunWeapon _unit)] - (uniformItems _unit) - (vestItems _unit) - (backpackItems _unit);
	_weapons
};

if (_delete) then {deleteVehicle _unit};
[_uniform, _vest, _backpack, _goggles, _headgear, _assignedItems, _primaryWeaponArr, _secondaryWeaponArr, _handgunWeaponArr, _uniformItems, _vestItems, _backpackItems, _weapons]