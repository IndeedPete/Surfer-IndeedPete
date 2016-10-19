private ["_control", "_i", "_currency", "_text"];
_control = str(_this select 0);
_i = _this select 1;
if (_i < 0) exitWith {};
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

if (_control == "Control #1500") then {
	_vehicles = IP_CampVehicleFilter call IP_fnc_vehicleFilter;
	_vehicle = _vehicles select _i;
	_category = [(missionConfigFile >> "ShopCampVehicles"), _vehicle] call IP_fnc_getConfigCategory;
	
	_description = if (isText(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "description")) then {(getText(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "description") + "<br/>")} else {""};
	_seats = "Capacity: " + str(_vehicle call IP_fnc_getCargoSeats) + " Teammate(s) (Including Player)<br/>";
	_cas = if (_category == "Air") then {
		_cas = if ((isNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "cas")) && {(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "cas")) == 1}) then {"CAS Ready: Yes<br/>"} else {"CAS Ready: No<br/>"};
		_cas
	} else {""};
	_price = "Price: " + _currency + " " + ([(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "price"))] call IP_fnc_numberText); 
	_text = _description + _seats + _cas + _price;
} else {
	_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
	_vehicles = player getVariable ["IP_ShopCampVehicles", []];
	_vehicle = _vehicles select _i;
	_category = [(missionConfigFile >> "ShopCampVehicles"), _vehicle] call IP_fnc_getConfigCategory;
	
	_description = if (isText(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "description")) then {(getText(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "description") + "<br/>")} else {""};
	_seats = "Capacity: " + str(_vehicle call IP_fnc_getCargoSeats) + " Teammate(s) (Including Player)<br/>";
	_cas = if (_category == "Air") then {
		_cas = if ((isNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "cas")) && {(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "cas")) == 1}) then {"CAS Ready: Yes<br/>"} else {"CAS Ready: No<br/>"};
		_cas
	} else {""};
	_price = "Selling Price: " + _currency + " " + ([(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "price") / _divisor)] call IP_fnc_numberText); 
	_text = _description + _seats + _cas + _price;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);