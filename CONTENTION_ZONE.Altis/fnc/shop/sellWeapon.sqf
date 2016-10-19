private ["_i", "_box", "_weapons", "_weapon", /*"_category",*/ "_divisor", /*"_cfg",*/ "_price", "_count"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a weapon first!"};

_box = player getVariable ["IP_ShopBox", ObjNull];
_weapons = weaponCargo _box;
_weapon = [(_weapons select _i)] call BIS_fnc_baseWeapon;
//_category = [(missionConfigFile >> "ShopWeapons"), _weapon] call IP_fnc_getConfigCategory;
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
//_cfg = missionConfigFile >> "ShopWeapons" >> _category;

/*
if (!((isNumber(_cfg >> _weapon >> "price")) OR (isText(_cfg >> _weapon >> "price")))) exitWith {hint "The trader does not accept this weapon."};
_price = if (isNumber(_cfg >> _weapon >> "price")) then {
	(getNumber(_cfg >> _weapon >> "price"))
} else {
	_ref = getText(_cfg >> _weapon >> "price");
	(getNumber(_cfg >> _ref >> "price"))
};*/

_price = ["ShopWeapons", _weapon] call IP_fnc_getPrice;
_price = _price / _divisor;
_count = {_x == _weapon} count _weapons;
_weapons = _weapons - [_weapon];

for "_i" from 1 to (_count - 1) do {
	_weapons = _weapons + [_weapon];
};

clearWeaponCargo _box;
{_box addWeaponCargo [_x, 1]} forEach _weapons;
_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
["Weapons", _i] spawn IP_fnc_openShop;