private ["_amount", "_i", "_selling", "_stock", "_stocks"];
_amount = ceil(_this);
_i = player getVariable ["IP_AmountIndex", 0];
_selling = player getVariable ["IP_AmountSelling", false];
_stock = player getVariable ["IP_AmountStock", ""];
_stocks = player getVariable ["IP_ShopStocks", []];

if (_stock == "") exitWith {"No stock class given!" call BIS_fnc_error};

if (_selling) then {
	private "_price";
	_price = 1;
	
	{
		if ((_x select 0) == _stock) exitWith {
			_price = _x select 1;
		};
	} forEach IP_AvailableStocks;
	
	_total = _amount * _price;
	_count = (_stocks select _i) select 1;
	_newAmount = _count - _amount;
	
	if (_newAmount > 0) then {
		(_stocks select _i) set [1, _newAmount];
	} else {
		_stocks deleteAt _i;
	};
	
	player setVariable ["IP_ShopStocks", _stocks];
	_total call IP_fnc_addMoney;
	closeDialog 0;
	_i spawn {
		sleep 0.03;
		call IP_fnc_closeShop;
		["StockMarket", _this] spawn IP_fnc_openShop;
	};
} else {
	_price = (IP_AvailableStocks select _i) select 1;
	_total = _amount * _price;
	
	if (_total call IP_fnc_purchase) then {
		private "_index";
		_index = -1;
		
		{
			if (((_x select 0) == _stock) && {(_x select 2) == _price}) exitWith {
				_index = _forEachIndex;
			};
		} forEach _stocks;
		
		_count = if (_index < 0) then {0} else {(_stocks select _index) select 1};
		_newAmount = _count + _amount;
		
		if (_index >= 0) then {
			(_stocks select _index) set [1, _newAmount];
		} else {
			_stocks pushBack [_stock, _newAmount, _price];
		};
		
		player setVariable ["IP_ShopStocks", _stocks];
		closeDialog 0;
		_i spawn {
			sleep 0.03;
			call IP_fnc_closeShop;
			["StockMarket", _this] spawn IP_fnc_openShop;
		};
	};
};