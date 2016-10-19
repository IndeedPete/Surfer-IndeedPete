private ["_unitOrPos", "_skill", "_silenced", "_night", "_variable", "_takeWeapons", "_unit", "_class", "_template", "_superUniform", "_superTexture"];
_unitOrPos = [_this, 0, [0, 0, 0], [[], ObjNull]] call BIS_fnc_param;
_skill = [_this, 1, 4, [0]] call BIS_fnc_param;
_silenced = [_this, 2, false, [true]] call BIS_fnc_param;
_night = [_this, 3, [true, false], [[]]] call BIS_fnc_param;

_variable = getText(missionConfigFile >> "Params" >> "WeaponsLootable");
_takeWeapons = [_this, 4, (missionNamespace getVariable [_variable, false]), [true]] call BIS_fnc_param;

_unit = if (typeName _unitOrPos == "ARRAY") then {
	createCenter east;
	_grp = createGroup east;
	_unit = _grp createUnit ["O_Soldier_lite_F", _unitOrPos, [], 0, "NONE"];
	_unit setVariable ["BIS_enableRandomization", false];
	_unit
} else {
	_unitOrPos
};

_class = typeOf _unit;
_template = if (isClass(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> _class)) then {
	(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> _class)
} else {
	nil
};
_superUniform = if (isText(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> "superUniform")) then {(getText(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> "superUniform"))} else {""};
_superTexture = if ((_superUniform != "") && (isArray(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> "superTexture"))) then {(getArray(missionConfigFile >> "ClassnameTemplates" >> "Contention" >> "superTexture"))} else {""};
_unit setVariable ["IP_Faction", "Contention"];
[_unit, _skill] call IP_fnc_setSkill;

if (!isNil "_template") then {
	_hasHeadgear = if (isNumber(_template >> "headgear")) then {(getNumber(_template >> "headgear"))} else {1};
	_hasGoggles = if (isNumber(_template >> "goggles")) then {(getNumber(_template >> "goggles"))} else {1};
	_hasVest = if (isNumber(_template >> "vest")) then {(getNumber(_template >> "vest"))} else {1};
	_backpackPool = if (isArray(_template >> "backpackPool")) then {(getArray(_template >> "backpackPool"))} else {[]};
	_handgrenadeCount = if (isNumber(_template >> "handgrenadeCount")) then {(getNumber(_template >> "handgrenadeCount"))} else {0};
	_handMagCount = if (isNumber(_template >> "handMagCount")) then {(getNumber(_template >> "handMagCount"))} else {0};
	_handWeaponPool = if (isArray(_template >> "handWeaponPool")) then {(getArray(_template >> "handWeaponPool"))} else {[]};
	_items = if (isArray(_template >> "items")) then {(getArray(_template >> "items"))} else {[]};
	_primMagCount = if (isNumber(_template >> "primMagCount")) then {(getNumber(_template >> "primMagCount"))} else {0};
	_primWeaponPool = if (isArray(_template >> "primWeaponPool")) then {(getArray(_template >> "primWeaponPool"))} else {[]};
	_primWeaponProbability = if (isNumber(_template >> "primWeaponProbability")) then {(getNumber(_template >> "primWeaponProbability"))} else {1};
	_secMagazines = if (isArray(_template >> "secMagazines")) then {(getArray(_template >> "secMagazines"))} else {[]};
	_secWeapon = if (isText(_template >> "secWeapon")) then {(getText(_template >> "secWeapon"))} else {""};
	_skill = if (isNumber(_template >> "skill")) then {(getNumber(_template >> "skill"))} else {_skill};

	[_unit, _skill] call IP_fnc_setSkill;
	if (_hasHeadgear != 1) then {removeHeadgear _unit};
	if (_hasGoggles != 1) then {removeGoggles _unit};
	if (_hasVest != 1) then {removeVest _unit};
	if (count _backpackPool > 0) then {
		_backpack = _backpackPool call BIS_fnc_selectRandom;
		_unit addBackPack _backpack;
	} else {
		removeBackpack _unit;
	};
	
	if ((count _primWeaponPool > 0) OR {count _handWeaponPool > 0}) then {removeAllWeapons _unit};
	if (_secWeapon != "") then {_unit addWeapon _secWeapon};
	{_unit addMagazine _x} forEach _secMagazines;
	{_unit addItem _x} forEach _items;
	_unit addMagazines ["handGrenade", _handgrenadeCount];

	if ((count _primWeaponPool > 0) && {random 1 <= _primWeaponProbability}) then {
		_primWeapon = _primWeaponPool call BIS_fnc_selectRandom;
		_primMag = (getArray(configFile >> "CfgWeapons" >> _primWeapon >> "magazines")) select 0;
		_unit addMagazines [_primMag, _primMagCount];
		_unit addWeapon _primWeapon;
		_unit selectWeapon _primWeapon;
	};

	if (count _handWeaponPool > 0) then {
		_handWeapon = _handWeaponPool call BIS_fnc_selectRandom;
		_handMag = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "magazines")) select 0;
		_unit addMagazines [_handMag, _handMagCount];
		_unit addWeapon _handWeapon;
	};	
};

{_unit unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "ItemGPS", "ItemMap"];
if (_night select 0) then {
	if (_night select 1) then {
		_unit linkItem "NVGoggles";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit enableIRLasers true;
	} else {
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit enableGunLights "forceOn";
	};
};

if (_silenced) then {
	_silencer = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencer") then {_unit addHandgunItem _silencer};
	_silencer = (getArray(configFile >> "CfgWeapons" >> _primWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencer") then {_unit addPrimaryWeaponItem _silencer};
};

if ((count _superTexture > 0) && {uniform _unit == _superUniform}) then {
	// [[_unit, (_superTexture select 0)], "IP_fnc_setObjectMaterialGlobal"] call BIS_fnc_MP;
	// _unit setObjectTextureGlobal [0, (_superTexture select 1)]; // setObjectTextureGlobal broken!
	[[_unit, [0, (_superTexture select 1)]], "IP_fnc_setObjectTexture", nil, true] call BIS_fnc_MP;
};

if !(_takeWeapons) then {
	_unit addEventHandler ["Killed", {removeAllWeapons (_this select 0)}];
};
	
_unit