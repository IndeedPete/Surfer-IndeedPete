private ["_getOrigin", "_getPrice", "_getMags", "_getOptics", "_getMuzzles", "_getPointerStr", "_control", "_i", "_text"];

_getOrigin = {
	private "_origin";	
	_weapon = _this select 0;
	_category = _this select 1;
	_cfg = missionConfigFile >> "ShopWeapons" >> _category;
	
	_origin = getText(_cfg >> _weapon >> "origin");
	if (isClass(_cfg >> _origin)) then {_origin = getText(_cfg >> _origin >> "origin")};	
	
	_origin = if (isText(missionConfigFile >> "Factions" >> _origin >> "displayNameShort")) then {"Origin: " + getText(missionConfigFile >> "Factions" >> _origin >> "displayNameShort") + "<br/>"} else {""};
	_origin
};

_getPrice = {
	private "_amount";
	_weapon = _this select 0;
	_buying = _this select 1;
	//_category = _this select 2;
	_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
	_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
	//_cfg = missionConfigFile >> "ShopWeapons" >> _category;
	
	
	_amount = ["ShopWeapons", _weapon] call IP_fnc_getPrice;
	/*_amount = if (isNumber(_cfg >> _weapon >> "price")) then {
		(getNumber(_cfg >> _weapon >> "price"))
	} else {
		_ref = getText(_cfg >> _weapon >> "price");
		(getNumber(_cfg >> _ref >> "price"))
	};*/
	
	if (!_buying) then {_amount = _amount / _divisor};	
	_price = ("Price: " + _currency + " " + ([_amount] call IP_fnc_numberText) + "<br/>");
	_price
};

_getMags = {
	private "_magazines";	
	_weapon = _this;
	_magArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines");
	_magazines = "Magazines:";
	
	{
		_mag = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
		_magazines = _magazines + " " + _mag + ";";
	} forEach _magArr;
	
	_magazines = _magazines + "<br/>";
	_magazines
};

_getOptics = {
	private "_optics";	
	_weapon = _this;
	_opticArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
	_optics = "Optics:";
	
	if (count _opticArr == 0) then {
		_optics = _optics + " N.A.";
	} else {
		{
			_optic = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_optics = _optics + " " + _optic + ";";
		} forEach _opticArr;
	};
	
	_optics = _optics + "<br/>";
	_optics
};

_getMuzzles = {
	private "_muzzles";	
	_weapon = _this;
	_muzzleArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	_muzzles = "Muzzles:";
	
	if (count _muzzleArr == 0) then {
		_muzzles = _muzzles + " N.A.";
	} else {
		{
			_muzzle = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_muzzles = _muzzles + " " + _muzzle + ";";
		} forEach _muzzleArr;
	};
	
	_muzzles = _muzzles + "<br/>";
	_muzzles
};

_getPointerStr = {
	private "_pointerStr";	
	_weapon = _this;
	_pointerArr = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
	_pointerStr = "Pointer:";
	
	if (count _pointerArr == 0) then {
		_pointerStr = _pointerStr + " N.A.";
	} else {
		{
			_pointer = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_pointerStr = _pointerStr + " " + _pointer + ";";
		} forEach _pointerArr;
	};
	
	_pointerStr = _pointerStr + "<br/>";
	_pointerStr
};

_control = str(_this select 0);
_i = _this select 1;
if (_i < 0) exitWith {};

if (_control == "Control #1500") then {
	_weapons = IP_WeaponFilter call IP_fnc_weaponFilter;
	_weapon = _weapons select _i;
	_category = [(missionConfigFile >> "ShopWeapons"), _weapon] call IP_fnc_getConfigCategory;
	
	_description = getText(configFile >> "CfgWeapons" >> _weapon >> "descriptionShort") + "<br/>";
	_origin = [_weapon, _category] call _getOrigin;
	_price = [_weapon, true, _category] call _getPrice;
	_magazines = _weapon call _getMags;
	_optics = _weapon call _getOptics;
	_muzzles = _weapon call _getMuzzles;
	_pointerStr = _weapon call _getPointerStr;
	_text = _description + _origin + _price + _magazines + _optics + _muzzles + _pointerStr;
} else {
	_box = player getVariable ["IP_ShopBox", ObjNull];
	_weapons = weaponCargo _box;	
	_weapon = [(_weapons select _i)] call BIS_fnc_baseWeapon;
	_category = [(missionConfigFile >> "ShopWeapons"), _weapon] call IP_fnc_getConfigCategory;
	
	_description = getText(configFile >> "CfgWeapons" >> _weapon >> "descriptionShort") + "<br/>";
	_origin = [_weapon, _category] call _getOrigin;
	_price = [_weapon, false, _category] call _getPrice;
	_magazines = _weapon call _getMags;
	_optics = _weapon call _getOptics;
	_muzzles = _weapon call _getMuzzles;
	_pointerStr = _weapon call _getPointerStr;
	_text = _description + _origin + "Selling " + _price + _magazines + _optics + _muzzles + _pointerStr;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);