private ["_backpackPool", "_primWeaponPool", "_uniforms"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_skill = [_this, 1, 4, [0]] call BIS_fnc_param;
_silenced = [_this, 2, false, [true]] call BIS_fnc_param;
_night = [_this, 3, [((dayTime < 7) OR (dayTime > 19)), false], [[]]] call BIS_fnc_param;
_addMoney = [_this, 4, true, [true]] call BIS_fnc_param;

_classArr = toArray(typeOf _unit); 
_classArr set [0, 66]; // 66 - Unicode B
_class = toString(_classArr);

_unit setVariable ["BIS_enableRandomization", false];
_faction = _unit getVariable ["IP_Faction", "ION"];
_backpackPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "backpackPool");
{
	if (!(isClass(configFile >> "CfgVehicles" >> _x))) then {_backpackPool = _backpackPool - [_x]};
} forEach _backpackPool;
_handgrenadeCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "handgrenadeCount");
_handMagCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "handMagCount");
_handWeaponPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "handWeaponPool");
_headgear = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "headgear");
_items = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "items");
_primMagCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "primMagCount");
_primWeaponPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "primWeaponPool");
{
	if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_primWeaponPool = _primWeaponPool - [_x]};
} forEach _primWeaponPool;
_secMagazines = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "secMagazines");
_secWeapon = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "secWeapon");
_vest = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "vest");

removeAllWeapons _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
{_unit unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
removeUniform _unit;

[_unit, _skill] call IP_fnc_setSkill;

_facePool = (configFile >> "CfgFaces" >> "Man_A3") call IP_fnc_getConfigEntries;
_facePool = _facePool - ["Custom", "Nikos", "AfricanHead_03", "Miller", "IG_Leader"];
_face = _facePool call BIS_fnc_selectRandom;
//_name = getText(configFile >> "CfgFaces" >> "Man_A3" >> _face >> "dispalyName");
_unit setFace _face;
//_unit setName _name;

_uniforms = (missionConfigFile >> "ShopClothes") call IP_fnc_getConfigEntries;
_uniforms = if (isArray(missionConfigFile >> "Factions" >> _faction >> "blacklistUniforms")) then {(_uniforms - (getArray(missionConfigFile >> "Factions" >> _faction >> "blacklistUniforms")))} else {_uniforms};
{
	if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_uniforms = _uniforms - [_x]};
} forEach _uniforms;
_uniform = _uniforms call BIS_fnc_selectRandom;
_unit forceAddUniform _uniform;
if (isArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {
	_arr = getArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture");
	_unit setObjectMaterial [0, (_arr select 0)];
	_unit setObjectTexture [0, (_arr select 1)];
} else {
	if (isText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {_unit setObjectTexture [0, (getText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture"))]};
};

_rank = rank _unit;
if (isText(missionConfigFile >> "Factions" >> _faction >> "Ranks" >> _rank >> "rankInsignia")) then {
	_class = getText(missionConfigFile >> "Factions" >> _faction >> "Ranks" >> _rank >> "rankInsignia");
	[_unit, _class] call BIS_fnc_setUnitInsignia;
};

if (_headgear == 1) then {
	_headgearPool = (missionConfigFile >> "ShopItems" >> "Headgear") call IP_fnc_getConfigEntries;
	_headgearPool = if (isArray(missionConfigFile >> "Factions" >> _faction >> "blacklistHeadgear")) then {(_headgearPool - (getArray(missionConfigFile >> "Factions" >> _faction >> "blacklistHeadgear")))} else {_headgearPool};
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_headgearPool = _headgearPool - [_x]};
	} forEach _headgearPool;
	_headgear = _headgearPool call BIS_fnc_selectRandom;
	_unit addHeadgear _headgear;
};

if (round(random 1) <= 0.8) then {
	_gogglesPool = (missionConfigFile >> "ShopItems" >> "Goggles") call IP_fnc_getConfigEntries;
	_goggles = _gogglesPool call BIS_fnc_selectRandom;
	_unit addGoggles _goggles;
};

if (_vest == 1) then {
	private "_vests";
	_vests = (missionConfigFile >> "ShopItems" >> "Vests") call IP_fnc_getConfigEntries;
	{
		if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_vests = _vests - [_x]};
	} forEach _vests;
	_vest = _vests call BIS_fnc_selectRandom;
	_unit addVest _vest;
};

if (count _backpackPool > 0) then {
	_backpack = _backpackPool call BIS_fnc_selectRandom;
	_unit addBackPack _backpack;
};

if (_secWeapon != "") then {_unit addWeapon _secWeapon};
{_unit addMagazine _x} forEach _secMagazines;
{_unit addItem _x} forEach _items;
_unit addMagazines ["handGrenade", _handgrenadeCount];

if (count _primWeaponPool > 0) then {
	_primWeapon = _primWeaponPool call BIS_fnc_selectRandom;
	_primMag = (getArray(configFile >> "CfgWeapons" >> _primWeapon >> "magazines")) select 0;
	_unit addMagazines [_primMag, _primMagCount];
	_unit addWeapon _primWeapon;
	if (_silenced) then {
		_silencer = (getArray(configFile >> "CfgWeapons" >> _primWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
		if (!isNil "_silencer") then {_unit addPrimaryWeaponItem _silencer};
	};
};

if (count _handWeaponPool > 0) then {
	_handWeapon = _handWeaponPool call BIS_fnc_selectRandom;
	_handMag = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "magazines")) select 0;
	_unit addMagazines [_handMag, _handMagCount];
	_unit addWeapon _handWeapon;
	if (_silenced) then {
		_silencer = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
		if (!isNil "_silencer") then {_unit addHandgunItem _silencer};
	};
};

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

if (_addMoney) then {[_unit] call IP_fnc_takeMoney};