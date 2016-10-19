private ["_amount", "_price", "_currency", "_total", "_totalStr", "_amountStr"];
_amount = ceil(_this);
_price = player getVariable ["IP_AmountPrice", 0];
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

_total = _amount * _price;
_totalStr = [_total] call IP_fnc_numberText;
_amountStr = [_amount] call IP_fnc_numberText;
ctrlSetText [1003, ("Total: " + _currency + " " + _totalStr)];
ctrlSetText [1004, ("Amount: " + _amountStr)];