private ["_price", "_currency", "_currencyShort", "_money", "_newMoney", "_res"];
_price = _this;
_price = round _price;
if (_price < 1) exitWith {false};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currency");
_currencyShort = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

_money = player getVariable ["IP_ShopMoney", 0];
_newMoney = _money - _price;
if (_newMoney < 0) then {
	hint format ["Your funds are insufficient!\nMoney needed: %1 %2\nIn possession: %1 %3", _currencyShort, ([_price] call IP_fnc_numberText), ([_money] call IP_fnc_numberText)];
	_res = false;
} else {
	player setVariable ["IP_ShopMoney", _newMoney];
	player createDiaryRecord ["Funds", [(name player), "Withdrawal: -" + ([_price] call IP_fnc_numberText) + " " + _currency + "<br/>New Account Balance: +" + ([_newMoney] call IP_fnc_numberText) + " " + _currency]];
	["MoneySpent", [([_price] call IP_fnc_numberText), _currencyShort]] call BIS_fnc_showNotification;
	_res = true;
};

_res