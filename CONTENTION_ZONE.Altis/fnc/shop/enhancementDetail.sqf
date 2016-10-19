private ["_control", "_i", "_text"];
_control = _this select 0;
_i = _this select 1;
if (_i < 0) exitWith {};

if (str(_control) == "Control #1500") then {
	_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
	_enhancement = IP_AvailableCampEnhancements select _i;	
	_buildTime = if (isNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "buildTime")) then {(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "buildTime"))} else {(getNumber(missionConfigFile >> "ShopMetaInformation" >> "defaultBuildTime"))};
	_buildTime = "Time to Deploy: " + str(_buildTime) + " Hour(s)" + "<br/>";
	_description = getText(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "description") + "<br/>";
	_price = "Price: " + _currency + " " + ([(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "price"))] call IP_fnc_numberText); 
	_text = _description + _buildTime + _price;
} else {
	_enhancements = player getVariable ["IP_ShopCampEnhancements", []];
	_enhancement = _enhancements select _i;	
	_description = getText(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "description") + "<br/>";
	_text = _description;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);