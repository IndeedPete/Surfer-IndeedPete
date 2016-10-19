private ["_i", "_magazines", "_magazine", "_price"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a magazine first!"};

_magazines = IP_MagazineFilter call IP_fnc_magazineFilter;
_magazine = _magazines select _i;
_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");

if (_price call IP_fnc_purchase) then {
	_box = player getVariable ["IP_ShopBox", ObjNull];
	_box addMagazineCargo [_magazine, 1];
	call IP_fnc_closeShop;
	["Magazines", _i] spawn IP_fnc_openShop;
};