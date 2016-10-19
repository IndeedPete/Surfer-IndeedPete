private ["_unitOrPos", "_skill", "_unit", "_template", "_superUniform", "_superTexture", "_superHeadgear", "_superHeadgearProbability", "_superGoggles", "_superVests", "_superUniforms", "_superBackpackPool", "_superBackpackProbability", "_superItems"];
_unitOrPos = [_this, 0, [0, 0, 0], [[], ObjNull]] call BIS_fnc_param;
_skill = [_this, 1, 3, [0]] call BIS_fnc_param;

if (true) exitWith {[_unitOrPos, "Freezoner", west] call IP_fnc_createMerc};

_unit = if (typeName _unitOrPos == "ARRAY") then {
	createCenter west;
	_grp = createGroup west;
	_unit = _grp createUnit ["B_Soldier_F", _unitOrPos, [], 0, "NONE"];
	_unit setVariable ["BIS_enableRandomization", false];
	_unit
} else {
	_unitOrPos
};

_template = (missionConfigFile >> "ClassnameTemplates" >> "Freezoners");
_superUniform = if (isText(missionConfigFile >> "ClassnameTemplates" >> "Freezoners" >> "superUniform")) then {(getText(missionConfigFile >> "ClassnameTemplates" >> "Freezoners" >> "superUniform"))} else {""};
_superTexture = if ((_superUniform != "") && (isArray(missionConfigFile >> "ClassnameTemplates" >> "Freezoners" >> "superTexture"))) then {(getArray(missionConfigFile >> "ClassnameTemplates" >> "Freezoners" >> "superTexture"))} else {""};
_unit setVariable ["IP_Faction", "Freezoners"];
[_unit, _skill] call IP_fnc_setSkill;

_superHeadgear = if (isArray(_template >> "superHeadgear")) then {(getArray(_template >> "superHeadgear"))} else {[]};
_superHeadgearProbability = if (isNumber(_template >> "superHeadgearProbability")) then {(getNumber(_template >> "superHeadgearProbability"))} else {1};
_superGoggles = if (isArray(_template >> "superGoggles")) then {(getArray(_template >> "superGoggles"))} else {[]};
_superGogglesProbability = if (isNumber(_template >> "superGlogglesProbability")) then {(getNumber(_template >> "superGlogglesProbability"))} else {1};
_superVests = if (isArray(_template >> "superVests")) then {(getArray(_template >> "superVests"))} else {((missionConfigFile >> "ShopItems" >> "LightVests") call IP_fnc_getConfigEntries)};
_superVestProbability = if (isNumber(_template >> "superVestProbability")) then {(getNumber(_template >> "superVestProbability"))} else {1};
_superUniforms = if (isArray(_template >> "superUniforms")) then {(getArray(_template >> "superUniforms"))} else {[]};
_superBackpackPool = if (isArray(_template >> "superBackpackPool")) then {(getArray(_template >> "superBackpackPool"))} else {[]};
_superBackpackProbability = if (isNumber(_template >> "superBackpackProbability")) then {(getNumber(_template >> "superBackpackProbability"))} else {1};
_superItems = if (isArray(_template >> "superItems")) then {(getArray(_template >> "superItems"))} else {[]};

{_unit unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "ItemGPS", "ItemMap", "ItemCompass", "ItemWatch"];
removeAllWeapons _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeVest _unit;
removeUniform _unit;
removeBackpack _unit;

if ((count _superHeadgear > 0) && {random 1 <= _superHeadgearProbability}) then {
	_headgear = _superHeadgear call BIS_fnc_selectRandom;
	_unit addHeadgear _headgear;
};

if ((count _superGoggles > 0) && {random 1 <= _superGogglesProbability}) then {
	_goggles = _superGoggles call BIS_fnc_selectRandom;
	_unit addGoggles _goggles;
};

if ((count _superVests > 0) && {random 1 <= _superVestProbability}) then {
	_vest = _superVests call BIS_fnc_selectRandom;
	_unit addVest _vest;
};

if (count _superUniforms > 0) then {
	_uniform = _superUniforms call BIS_fnc_selectRandom;
	_unit forceAddUniform _uniform;
};

if ((count _superBackpackPool > 0) && {random 1 <= _superBackpackProbability}) then {
	_backpack = _superBackpackPool call BIS_fnc_selectRandom;
	_unit addBackPack _backpack;
};

{_unit addItem _x} forEach _superItems;
_unit linkItem (["ItemCompass", "ItemMap"] call BIS_fnc_selectRandom);
if ((count _superTexture > 0) && {uniform _unit == _superUniform}) then {
	// [[_unit, (_superTexture select 0)], "IP_fnc_setObjectMaterialGlobal"] call BIS_fnc_MP;
	// _unit setObjectTextureGlobal [0, (_superTexture select 1)]; // setObjectTextureGlobal broken!
	[[_unit, [0, (_superTexture select 1)]], "IP_fnc_setObjectTexture", nil, true] call BIS_fnc_MP;
};

_unit