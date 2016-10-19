private ["_i", "_items", "_item", "_price"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select an item first!"};

_items = IP_ItemFilter call IP_fnc_itemFilter;
_item = _items select _i;
_price = ["ShopItems", _item] call IP_fnc_getPrice;

if (_price call IP_fnc_purchase) then {
	_box = player getVariable ["IP_ShopBox", ObjNull];
	if ((isClass(configFile >> "CfgWeapons" >> _item)) OR (isClass(configFile >> "CfgGlasses" >> _item))) then {
		_box addItemCargo [_item, 1];
	} else {
		_box addBackpackCargo [_item, 1];
	};
	
	call IP_fnc_closeShop;
	["Items", _i] spawn IP_fnc_openShop;
};