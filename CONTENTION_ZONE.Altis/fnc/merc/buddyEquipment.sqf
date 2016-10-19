private ["_weapons", "_vest", "_goggles", "_headgear", "_backpack", "_silenced", "_night"];

_unit = [_this, 0, IP_Buddy, [objNull]] call BIS_fnc_param;
_mission = [_this, 1, (getText(missionConfigFile >> "name")), [""]] call BIS_fnc_param;

if (_mission != "") then {
	_buddyEquipment = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "buddyEquipment");
	_weapons = (_buddyEquipment select 0);
	_vest = _buddyEquipment select 1;
	_goggles = _buddyEquipment select 2;
	_headgear = _buddyEquipment select 3;
	_backpack =	_buddyEquipment select 4;
	_silenced = call compile (_buddyEquipment select 5);
	_night = [((dayTime < 7) OR (dayTime > 19)), (call compile (_buddyEquipment select 6))];	
} else {
	_weapons = toUpper([_this, 2, "RIFLEMAN", [""]] call BIS_fnc_param);
	_vest = [_this, 3, "V_I_G_resistanceLeader_F", [""]] call BIS_fnc_param;
	_goggles = [_this, 4, "", [""]] call BIS_fnc_param;
	_headgear = [_this, 5, "", [""]] call BIS_fnc_param;
	_backpack = [_this, 6, "", [""]] call BIS_fnc_param;
	_silenced = [_this, 7, false, [true]] call BIS_fnc_param;
	_night = [_this, 8, [((dayTime < 7) OR (dayTime > 19)), true], [[]]] call BIS_fnc_param;
};

removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeVest _unit;
if (_vest != "") then {_unit addVest _vest};
if (_goggles != "") then {_unit addGoggles _goggles};
if (_headgear != "") then {_unit addHeadgear _headgear};
if (_backpack != "") then {_unit addBackpack _backpack};

if (_weapons == "NONE") exitWith{};
{_unit addItem _x} forEach ["FirstAidKit", "FirstAidKit"];
_unit addMagazines ["11Rnd_45ACP_Mag", 3];

switch (_weapons) do {
	case "RIFLEMAN": {
		_unit addMagazines ["handGrenade", 4];
		_unit addMagazines ["30Rnd_65x39_caseless_mag", 10];
		_unit addWeapon "arifle_MX_Black_F";
		_unit addPrimaryWeaponItem "optic_Nightstalker";
	};
	case "GRENADIER": {
		_unit addMagazines ["handGrenade", 2];
		_unit addMagazines ["1Rnd_HE_Grenade_shell", 6];
		_unit addMagazines ["30Rnd_65x39_caseless_mag", 8];
		_unit addWeapon "arifle_MX_GL_Black_F";
		_unit addPrimaryWeaponItem "optic_Nightstalker";
	};
	case "AUTORIFLEMAN": {
		_unit addMagazines ["handGrenade", 4];
		_unit addMagazines ["100Rnd_65x39_caseless_mag", 4];
		_unit addWeapon "arifle_MX_SW_Black_F";
		_unit addPrimaryWeaponItem "optic_Nightstalker";
	};
	case "MARKSMAN": {
		_unit addMagazines ["handGrenade", 4];
		_unit addMagazines ["30Rnd_65x39_caseless_mag", 10];
		_unit addWeapon "arifle_MXM_Black_F";
		_unit addPrimaryWeaponItem "optic_Nightstalker";
	};
	case default {};
};

_unit addWeapon "hgun_Pistol_heavy_01_MRD_F";

//if (_night select 0) then {
	if (_night select 1) then {
		//_unit addItem "NVGoggles";
		//_unit assignItem "NVGoggles";
		_unit addItem "NVGoggles";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
	} else {
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit enableGunLights "forceOn";
	};
//};

if (_silenced) then {
	_silencerPrim = (getArray(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencerPrim") then {_unit addPrimaryWeaponItem _silencerPrim};
	_silencerHand = (getArray(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) select 0;
	if (!isNil "_silencerHand") then {_unit addHandgunItem _silencerHand};
};