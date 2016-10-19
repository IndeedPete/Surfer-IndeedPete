private ["_getPrice", "_i", "_selling", "_currency", "_divisor", "_stock", "_price", "_count", "_title", "_priceStr"];
_getPrice = {
	private "_price";
	_price = 1;
	
	{
		if ((_x select 0) == _this) exitWith {
			_price = _x select 1;
		};
	} forEach IP_AvailableStocks;
	
	_price
};

_i = _this select 0;
_selling = _this select 1;
if (_i == -1) exitWith {hint "You have to select a stock first!"};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

if (_selling) then {
	_stock = lbData [1501, _i];
	if (!(isText(missionConfigFile >> "ShopStocks" >> _stock >> "displayName"))) exitWith {hint "The trader does not accept this stock."};
	_price = _stock call _getPrice;
	_stocks = player getVariable ["IP_ShopStocks", []];
	_count = (_stocks select _i) select 1;
} else {
	_stockArr = IP_AvailableStocks select _i;
	_stock = _stockArr select 0;
	_price = _stockArr select 1;
	_count = 10000;
};

_title = getText(missionConfigFile >> "ShopStocks" >> _stock >> "displayName");
_priceStr = str(_price);
player setVariable ["IP_AmountPrice", _price];
player setVariable ["IP_AmountIndex", _i];
player setVariable ["IP_AmountSelling", _selling];
player setVariable ["IP_AmountStock", _stock];

createDialog "IP_DLG_AMOUNT";
ctrlSetText [1001, _title];
ctrlSetText [1002, (ctrlText 1002 + (_currency + " " + _priceStr))];
1 call IP_fnc_amountSetTotal;
sliderSetRange [1900, 1, _count];
sliderSetPosition [1900, 1];