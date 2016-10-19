private ["_amount", "_i", "_selling", "_magazine", "_box"];
_amount = ceil(_this);
_i = player getVariable ["IP_AmountIndex", 0];
_selling = player getVariable ["IP_AmountSelling", false];
_magazine = player getVariable ["IP_AmountMagazine", ""];
_box = player getVariable ["IP_ShopBox", ObjNull];

if (_magazine == "") exitWith {"No magazine class given!" call BIS_fnc_error};

if (_selling) then {
	private "_magazines";
	if (!(isNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price"))) exitWith {hint "The trader does not accept this magazine."};
	_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
	_price = ["ShopMagazines", _magazine] call IP_fnc_getPrice;
	//_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = _price / _divisor;
	_total = _amount * _price;
	
	_magazines = magazineCargo _box;
	_count = ({_x == _magazine} count _magazines) - _amount;
	_magazines = _magazines - [_magazine];
	
	for "_i" from 1 to (_count) do {
		_magazines = _magazines + [_magazine];
	};
	
	clearMagazineCargo _box;
	{_box addMagazineCargo [_x, 1]} forEach _magazines;
	_total call IP_fnc_addMoney;
	closeDialog 0;
	_i spawn {
		sleep 0.03;
		call IP_fnc_closeShop;
		["Magazines", _this] spawn IP_fnc_openShop;
	};
} else {
	//_price = getNumber(missionConfigFile >> "ShopMagazines" >> _magazine >> "price");
	_price = ["ShopMagazines", _magazine] call IP_fnc_getPrice;
	_total = _amount * _price;
	
	if (_total call IP_fnc_purchase) then {
		_box addMagazineCargo [_magazine, _amount];
		closeDialog 0;
		_i spawn {
			sleep 0.03;
			call IP_fnc_closeShop;
			["Magazines", _this] spawn IP_fnc_openShop;
		};
	};
};