private ["_i", "_selling", "_currency", "_divisor", "_magazine", "_price", "_count", "_title", "_priceStr"];
_i = _this select 0;
_selling = _this select 1;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");

if (_selling) then {
	_magazine = lbData [1501, _i];
	if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader does not accept this magazine."};
	//_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = ["ShopMagazines", _magazine] call IP_fnc_getPrice;
	_price = _price / _divisor;
	_box = player getVariable ["IP_ShopBox", ObjNull];
	_magazines = magazineCargo _box;
	_count = {_x == _magazine} count _magazines;
} else {
	_magazines = IP_MagazineFilter call IP_fnc_magazineFilter;
	_magazine = _magazines select _i;
	//_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = ["ShopMagazines", _magazine] call IP_fnc_getPrice;
	_count = 10;
};

_title = getText(configFile >> "CfgMagazines" >> _magazine >> "displayName");
_priceStr = [_price] call IP_fnc_numberText;
player setVariable ["IP_AmountPrice", _price];
player setVariable ["IP_AmountIndex", _i];
player setVariable ["IP_AmountSelling", _selling];
player setVariable ["IP_AmountMagazine", _magazine];

createDialog "IP_DLG_AMOUNT";
ctrlSetText [1001, _title];
ctrlSetText [1002, (ctrlText 1002 + (_currency + " " + _priceStr))];
1 call IP_fnc_amountSetTotal;
sliderSetRange [1900, 1, _count];
sliderSetPosition [1900, 1];