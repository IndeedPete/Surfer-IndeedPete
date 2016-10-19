private ["_add", "_currency", "_currencyShort", "_money"];
_add = _this;
_add = round _add;
if (_add < 1) exitWith {false};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currency");
_currencyShort = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

_money = player getVariable ["IP_ShopMoney", 0];
_money = _money + _add;
player setVariable ["IP_ShopMoney", _money];
player createDiaryRecord ["Funds", [(name player), "<br/>Deposit: +" + ([_add] call IP_fnc_numberText) + " " + _currency + " <br/>New Account Balance: +" + ([_money] call IP_fnc_numberText) + " " + _currency]];
["MoneyAdded", [([_add] call IP_fnc_numberText), _currencyShort]] call bis_fnc_showNotification;

true