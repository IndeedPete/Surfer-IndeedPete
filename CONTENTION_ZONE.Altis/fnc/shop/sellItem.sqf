private ["_i", "_itemOrBackpack", "_box", "_divisor", "_price"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select an item first!"};

_itemOrBackpack = lbData [1501, _i];
_box = player getVariable ["IP_ShopBox", ObjNull];
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
_price = ["ShopItems", _itemOrBackpack] call IP_fnc_getPrice;
_price = _price / _divisor;

if (isClass(configFile >> "CfgVehicles" >> _itemOrBackpack)) then {
	private "_backpacks";
	_backpacks = backpackCargo _box;
	_count = {_x == _itemOrBackpack} count _backpacks;
	_backpacks = _backpacks - [_itemOrBackpack];

	for "_i" from 1 to (_count - 1) do {
		_backpacks = _backpacks + [_itemOrBackpack];
	};

	clearBackpackCargo _box;
	{_box addBackpackCargo [_x, 1]} forEach _backpacks;
} else {
	private "_items";
	_items = itemCargo _box;
	_count = {_x == _itemOrBackpack} count _items;
	_items = _items - [_itemOrBackpack];

	for "_i" from 1 to (_count - 1) do {
		_items = _items + [_itemOrBackpack];
	};

	clearItemCargo _box;
	{_box addItemCargo [_x, 1]} forEach _items;
};

_price call IP_fnc_addMoney;
call IP_fnc_closeShop;
["Items", _i] spawn IP_fnc_openShop;