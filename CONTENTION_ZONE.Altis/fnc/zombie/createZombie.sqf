private ["_unitOrPos", "_anchor", "_side", "_isAnimal", "_skill", "_controllerParams", "_zombie", "_facePool", "_face", "_uniforms", "_uniform", "_params"];
_unitOrPos = [_this, 0, [0, 0, 0], [[], ObjNull]] call BIS_fnc_param;
_anchor = [_this, 1, _unitOrPos, [ObjNull, []]] call BIS_fnc_param;
_side = [_this, 2, east, [west]] call BIS_fnc_param;
_isAnimal = false;//[_this, 3, false, [true]] call BIS_fnc_param; // Animal Zombies do not work ATM.
_skill = [_this, 4, 0, [0]] call BIS_fnc_param;
_controllerParams = [_this, 5, [], [[]]] call BIS_fnc_param; // _centre - OBJECT, ARRAY, MARKER, idleRadius - NUMBER, _detectionRadius - NUMBER

if ((isNil "IP_AvailableItems") OR (isNil "IP_AvailableUniforms")) exitWith {
	"Maybe IP_fnc_shopInit was not run? Exiting..." call BIS_fnc_error;
};

_zombie = if (typeName _unitOrPos == "ARRAY") then {
	createCenter _side;
	_grp = createGroup _side;
	_zombie = if (_isAnimal) then {
		_classParams = switch (floor(random 5)) do {
			case 0: {["Fin_sand_F", "images\zombie_dog_yellow_co.paa"]};
			case 1: {["Alsatian_Sandblack_F", "images\zombie_pastor_black_co.paa"]};
			case 2: {["Alsatian_Sandblack_F", "images\zombie_pastor_co.paa"]};
			case 3: {["Alsatian_Sandblack_F", "images\zombie_pastor_co2.paa"]};
			case 4: {["Alsatian_Sandblack_F", "images\zombie_pastor_sand_co.paa"]};
			default {["Fin_sand_F", "images\zombie_dog_yellow_co.paa"]};
		};
		_zombie = _grp createUnit [(_classParams select 0), _unitOrPos, [], 0, "NONE"];
		_zombie setObjectTexture [0, (_classParams select 1)];
		_zombie
	} else {
		_zombie = _grp createUnit ["O_G_Soldier_F", _unitOrPos, [], 0, "NONE"];
		_zombie setVariable ["BIS_enableRandomization", false];
		_zombie
	};
	_zombie
} else {
	_unitOrPos
};

{_zombie setVariable _x} forEach [["IP_Faction", "Zombies"], ["IP_ZombieAnchor", _anchor]];
[_zombie, _skill] call IP_fnc_setSkill;
_zombie setUnitPos "UP";
_zombie allowFleeing 0;
{_zombie disableAI _x} forEach ["FSM", "AUTOTARGET", "TARGET"];

if (!_isAnimal) then {
	removeAllWeapons _zombie;
	removeHeadgear _zombie;
	{_zombie unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
	removeGoggles _zombie;
	removeVest _zombie;
	removeBackpack _zombie;
	removeUniform _zombie;

	_facePool = (configFile >> "CfgFaces" >> "Man_A3") call IP_fnc_getConfigEntries;
	_facePool = _facePool - ["Custom"];
	_face = _facePool call BIS_fnc_selectRandom;
	_zombie setFace _face;

	_uniforms = (IP_AvailableUniforms select (IP_UniformCategories find "Civilian")) + (IP_AvailableUniforms select (IP_UniformCategories find "Paramilitary")) + (IP_AvailableUniforms select (IP_UniformCategories find "Military"));
	_uniforms = if (isArray(missionConfigFile >> "Factions" >> "Zombies" >> "blacklistUniforms")) then {(_uniforms - (getArray(missionConfigFile >> "Factions" >> "Zombies" >> "blacklistUniforms")))} else {_uniforms};
	_uniform = _uniforms call BIS_fnc_selectRandom;
	_category = [(missionConfigFile >> "ShopUniforms"), _uniform] call IP_fnc_getConfigCategory;
	_zombie forceAddUniform _uniform;
	if (isArray(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "zombieTexture")) then {
		_arr = getArray(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "zombieTexture");
		_zombie setObjectMaterial [0, (_arr select 0)];
		_zombie setObjectTextureGlobal [0, (_arr select 1)];
	} else {
		if (isText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "zombieTexture")) then {_zombie setObjectTextureGlobal [0, (getText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "zombieTexture"))]};	
	};

	if ((random 1) > 0.9) then {
		private "_headgearPool";
		_headgearPool = IP_AvailableItems select (IP_ItemCategories find "HeadgearSoft");
		_headgearPool = if (isArray(missionConfigFile >> "Factions" >> "Zombies" >> "blacklistHeadgear")) then {(_headgearPool - (getArray(missionConfigFile >> "Factions" >> "Zombies" >> "blacklistHeadgear")))} else {_headgearPool};
		_headgear = _headgearPool call BIS_fnc_selectRandom;
		_zombie addHeadgear _headgear;
	};

	if ((random 1) > 0.9) then {
		_gogglesPool = IP_AvailableItems select (IP_ItemCategories find "Goggles");
		_goggles = _gogglesPool call BIS_fnc_selectRandom;
		_zombie addGoggles _goggles;
	};

	if ((random 1) > 0.95) then {
		private "_vests";
		_vests = IP_AvailableItems select (IP_ItemCategories find "VestsLight");
		_vest = _vests call BIS_fnc_selectRandom;
		_zombie addVest _vest;
	};
};

_params = [_zombie];
{_params pushBack _x} forEach _controllerParams;
_params spawn IP_fnc_zombieController;
_zombie