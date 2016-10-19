private ["_getWeaponStr", "_control", "_i", "_text"];
_getWeaponStr = {
	private ["_weapons", "_res"];
	_weapons = (getArray(configFile >> "CfgVehicles" >> _this >> "weapons")) - ["Throw", "Put"];
	_res = "Weapons: ";
	
	{
		_displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		_res = _res + _displayName + "; ";
	} forEach _weapons;
	
	_res = _res + "<br/>";
	_res
};

_control = str(_this select 0);
_i = _this select 1;
if (_i < 0) exitWith {};

if (_control == "Control #1500") then {
	_personnel = IP_PersonnelFilter call IP_fnc_personnelFilter;
	if (count _personnel < 1) exitWith {_text = ""};
	_person = _personnel select _i;
	_category = [(missionConfigFile >> "ShopPersonnel"), _person] call IP_fnc_getConfigCategory;
	_costRate = "Cost Rate: " + str(100 * (getNumber(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "costRate"))) + "%<br/>";
	_desc = if (isText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "description")) then {("Description: " + getText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "description") + "<br/>")} else {""};
	_equipment = if (isText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "equipment")) then {("Equipment: " + getText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "equipment") + "<br/>")} else {(_person call _getWeaponStr)};
	_text = _costRate + _desc + _equipment;
} else {
	_team = player getVariable ["IP_Team", []];
	if (count _team < 1) exitWith {_text = ""};
	_person = _team select _i;
	_category = [(missionConfigFile >> "ShopPersonnel"), _person] call IP_fnc_getConfigCategory;
	_costRate = "Cost Rate: " + str(100 * (getNumber(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "costRate"))) + "%<br/>";
	_desc = if (isText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "description")) then {("Description: " + getText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "description") + "<br/>")} else {""};
	_equipment = if (isText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "equipment")) then {("Equipment: " + getText(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "equipment") + "<br/>")} else {(_person call _getWeaponStr)};
	_text = _costRate + _desc + _equipment;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);