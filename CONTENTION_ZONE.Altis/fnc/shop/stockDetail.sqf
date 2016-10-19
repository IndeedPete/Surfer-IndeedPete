private ["_control", "_i", "_currency", "_text"];
_control = _this select 0;
_i = _this select 1;
if (_i < 0) exitWith {};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

if (str(_control) == "Control #1500") then {
	_stockArr = IP_AvailableStocks select _i;
	_lastStockArr = if !(isNil "IP_LastStocks") then {IP_LastStocks} else {[]};
	_price = "Price: " + _currency + " " + str(_stockArr select 1) + "<br/>";
	_oldPrice = if (count _lastStockArr > 0) then {("Last Price: " + _currency + " " + str((_lastStockArr select _i) select 1) + "<br/>")} else {""};
	_text = _price + _oldPrice;
} else {
	private ["_price", "_index"];
	_price = 1;
	_index = -1;
	_stockArr = player getVariable ["IP_ShopStocks", []];
	_stock = (_stockArr select _i) select 0;
	_lastStockArr = if !(isNil "IP_LastStocks") then {IP_LastStocks} else {[]};
	
	{
		if ((_x select 0) == _stock) exitWith {
			_price = _x select 1;
			_index = _forEachIndex;
		};
	} forEach IP_AvailableStocks;
	
	_buyingPrice = "Original Buying Price: " + _currency + " " + str((_stockArr select _i) select 2) + "<br/>";
	_price = "Selling Price: " + _currency + " " + str(_price) + "<br/>";
	_oldPrice = if (count _lastStockArr > 0) then {("Last Selling Price: " + _currency + " " + str((_lastStockArr select _index) select 1) + "<br/>")} else {""};
	_text = _buyingPrice + _price + _oldPrice;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);