private ["_stockClasspaths", "_priceRange", "_min", "_max"];
_stockClasspaths = "((isText(_x >> 'displayName')) && {(if (isNumber(_x >> 'show')) then {(getNumber(_x >> 'show'))} else {1}) == 1})" configClasses (missionConfigFile >> "ShopStocks");
_priceRange = getArray(missionConfigFile >> "ShopMetaInformation" >> "stockPriceRange");
_min = _priceRange select 0;
_max = _priceRange select 1;
IP_LastStocks = if (!(isNil "IP_AvailableStocks") && {count IP_AvailableStocks > 0}) then {IP_AvailableStocks} else {[]};
IP_AvailableStocks = [];
{
	_stock = configName _x;
	_oldPrice = if (count IP_LastStocks > 0) then {
		((IP_LastStocks select _forEachIndex) select 1)
	} else {
		-1
	};
	
	_price = if (_oldPrice < 0) then {
		((random(_max - _min)) + _min)
	} else {
		_raiseProb = 1 - (_oldPrice / _max);
		_factor = random 0.5;
		_raise = if (random 1 <= _raiseProb) then {1} else {-1};
		_add = _raise * _factor * _oldPrice;
		_newPrice = if ((_oldPrice + _add) > _min) then {(_oldPrice + _add)} else {_min};
		_newPrice = if (_newPrice <= _max) then {_newPrice} else {_max};
		_newPrice
	};
	
	IP_AvailableStocks pushBack [_stock, ([_price, 100] call IP_fnc_round)];
} forEach _stockClasspaths;
IP_LastStockMarketAccess = date;