private ["_getDescription", "_control", "_i", "_currency", "_divisor", "_text"];

_getDescription = {
	_item = _this select 0;
	_category = _this select 1;
	
	_parent = _item call IP_fnc_getTopConfig;
	_customDescription = if (isText(missionConfigFile >> "ShopItems" >> _category >> _item >> "description")) then {
		((getText(missionConfigFile >> "ShopItems" >> _category >> _item >> "description")) + "<br/>")
	} else {
		""
	};	
	
	_description = getText(configFile >> _parent >> _item >> "descriptionShort");
	_description = _description  + "<br/>" + _customDescription;
	_description
};

_control = _this select 0;
_i = _this select 1;
if (_i < 0) exitWith {};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");

if (str(_control) == "Control #1500") then {
	_items = IP_ItemFilter call IP_fnc_itemFilter;
	_item = _items select _i;
	_category = [(missionConfigFile >> "ShopItems"), _item] call IP_fnc_getConfigCategory;
	_description = [_item, _category] call _getDescription;
	_price = "Price: " + _currency + " " + ([(["ShopItems", _item] call IP_fnc_getPrice)] call IP_fnc_numberText);
	_text = _description + _price;
} else {
	_item = _control lbData _i;	
	_category = [(missionConfigFile >> "ShopItems"), _item] call IP_fnc_getConfigCategory;
	_description = [_item, _category] call _getDescription;
	_price = "Price: " + _currency + " " + ([((["ShopItems", _item] call IP_fnc_getPrice) / _divisor)] call IP_fnc_numberText);
	_text = _description + "Selling " + _price;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);