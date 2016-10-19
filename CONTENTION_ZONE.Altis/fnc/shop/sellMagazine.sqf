private ["_i", "_magazine", "_divisor", "_price", "_box", "_magazines", "_count"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};

_magazine = lbData [1501, _i];
if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader does not accept this magazine."};
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
_price = _price / _divisor;

_box = player getVariable ["IP_ShopBox", ObjNull];
_magazines = magazineCargo _box;
_count = {_x == _magazine} count _magazines;
_magazines = _magazines - [_magazine];

for "_i" from 1 to (_count - 1) do {
	_magazines = _magazines + [_magazine];
};

clearMagazineCargo _box;
{_box addMagazineCargo [_x, 1]} forEach _magazines;
_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
["Magazines", _i] spawn IP_fnc_openShop;