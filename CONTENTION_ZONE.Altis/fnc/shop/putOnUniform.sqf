private ["_i", "_box", "_inPosession", "_uniform", "_category", "_items", "_insignia"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a uniform first!"};

_box = player getVariable ["IP_ShopBox", ObjNull];
_inPosession = player getVariable ["IP_ShopUniforms", []];
_uniform = _inPosession select _i;
_category = [(missionConfigFile >> "ShopUniforms"), _uniform] call IP_fnc_getConfigCategory;
_items = uniformItems player;
_insignia = player call BIS_fnc_getUnitInsignia;

player forceAddUniform _uniform;
if (isArray(missionConfigFile >> "ShopClothes" >> _category >> _uniform >> "texture")) then {
	_arr = getArray(missionConfigFile >> "ShopClothes" >> _category >> _uniform >> "texture");
	player setObjectMaterial [0, (_arr select 0)];
	player setObjectTexture [0, (_arr select 1)];
} else {
	if (isText(missionConfigFile >> "ShopClothes" >> _category >> _uniform >> "texture")) then {player setObjectTexture [0, (getText(missionConfigFile >> "ShopClothes" >> _category >> _uniform >> "texture"))]};
};

{_box addItemCargo [_x, 1]} forEach _items;
if (_insignia != "") then {[player, _insignia] call BIS_fnc_setUnitInsignia};
hint "The items you have carried in your old uniform have been stored in your box!";