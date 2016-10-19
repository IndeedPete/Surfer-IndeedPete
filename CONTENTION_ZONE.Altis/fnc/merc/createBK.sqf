private ["_primWeaponPool"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_skill = [_this, 1, 5, [0]] call BIS_fnc_param;
_silenced = [_this, 2, false, [true]] call BIS_fnc_param;
_night = [_this, 3, [((dayTime < 7) OR (dayTime > 19)), false], [[]]] call BIS_fnc_param;

_classArr = toArray(typeOf _unit); 
_classArr set [0, 66]; // 66 - Unicode B
_class = toString(_classArr);

 if (((rank _unit) == "PRIVATE") OR ((rank _unit) == "CORPORAL")) then {_unit setRank "SERGEANT"};
_rank = rank _unit;

_backpack = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "backpack");
_glasses = getArray(missionConfigFile >> "MainValues" >> "glassGoggles");
_handgrenadeCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "handgrenadeCount");
_handMagCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "handMagCount");
_handWeapon = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "handWeapon");
_headgearPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "headgearPool");
_identity = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "identity");
_items = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "items");
_primMagCount = getNumber(missionConfigFile >> "ShopPersonnel" >> _class >> "primMagCount");
_primWeaponPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "primWeaponPool");
{
	if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {_primWeaponPool = _primWeaponPool - [_x]};
} forEach _primWeaponPool;
_uniform = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "uniform");
_secMagazines = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "secMagazines");
_secWeapon = getText(missionConfigFile >> "ShopPersonnel" >> _class >> "secWeapon");
_vestPool = getArray(missionConfigFile >> "ShopPersonnel" >> _class >> "vestPool");

removeAllWeapons _unit;
removeHeadgear _unit;
removeVest _unit;
removeBackpack _unit;
_unit unlinkItem "NVGoggles";
_unit unlinkItem "NVGoggles_OPFOR";
_unit unlinkItem "NVGoggles_INDEP";
removeUniform _unit;

_unit setVariable ["IP_Faction", "BritishKnights"];
[_unit, _skill] call IP_fnc_setSkill;
if (_identity != "") then {_unit setIdentity _identity};

_unit forceAddUniform _uniform;
if (isArray(missionConfigFile >> "Factions" >> "BritishKnights" >> "Ranks" >> _rank >> "texture")) then {
	_arr = getArray(missionConfigFile >> "Factions" >> "BritishKnights" >> "Ranks" >> _rank >> "texture");
	_unit setObjectMaterial [0, (_arr select 0)];
	_unit setObjectTexture [0, (_arr select 1)];
} else {
	if (isText(missionConfigFile >> "Factions" >> "BritishKnights" >> "Ranks" >> _rank >> "texture")) then {_unit setObjectTexture [0, (getText(missionConfigFile >> "Factions" >> "BritishKnights" >> "Ranks" >> _rank >> "texture"))]};
};

_headgear = _headgearPool call BIS_fnc_selectRandom;
if (_headgear != "") then {_unit addHeadgear _headgear};

_glass = _glasses call BIS_fnc_selectRandom;
if (_glass != "") then {_unit addGoggles _glass};

_vest = _vestPool call BIS_fnc_selectRandom;
if (_vest != "") then {_unit addVest _vest};

if (_backpack != "") then {_unit addBackpack _backpack};

{_unit addMagazine _x} forEach _secMagazines;
if (_secWeapon != "") then {_unit addWeapon _secWeapon};
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
	
_handMag = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "magazines")) select 0;
_unit addMagazines [_handMag, _handMagCount];
_unit addWeapon _handWeapon;
if (_silenced) then {
	_silencer = (getArray(configFile >> "CfgWeapons" >> _handWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencer") then {_unit addHandgunItem _silencer};
};

if (_night select 0) then {
	if (_night select 1) then {
		_unit linkItem "NVGoggles";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
	} else {
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit enableGunLights "forceOn";
	};
};