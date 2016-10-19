private ["_control", "_i", "_currency", "_divisor", "_text"];
_control = _this select 0;
_i = _this select 1;
if (_i < 0) exitWith {};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");

if (str(_control) == "Control #1500") then {
	_magazines = IP_MagazineFilter call IP_fnc_magazineFilter;
	_magazine = _magazines select _i;	
	_description = getText(configFile >> "CfgMagazines" >> _magazine >> "descriptionShort") + "<br/>";
	_price = "Price: " + _currency + " " + ([(["ShopMagazines", _magazine] call IP_fnc_getPrice)] call IP_fnc_numberText); 
	_text = _description + _price;
} else {
	_magazine = _control lbData _i;	
	_description = getText(configFile >> "CfgMagazines" >> _magazine >> "descriptionShort") + "<br/>";
	_price = "Price: " + _currency + " " + ([((["ShopMagazines", _magazine] call IP_fnc_getPrice) / _divisor)] call IP_fnc_numberText); 
	_text = _description + "Selling " + _price;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);