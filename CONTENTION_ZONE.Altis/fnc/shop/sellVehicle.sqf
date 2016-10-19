private ["_i", "_vehiclesInPossession", "_vehicle", "_category", "_unique", "_divisor", "_price"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a vehicle first!"};

_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];
_vehicle = _vehiclesInPossession select _i;
_category = [(missionConfigFile >> "ShopCampVehicles"), _vehicle] call IP_fnc_getConfigCategory;
_unique = if (isNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "unique")) then {(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "unique"))} else {0};
_divisor = getNumber(missionConfigFile >> "ShopMetaInformation" >> "sellingDisvisor");
_price = getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "price") / _divisor;

switch (true) do {
	case (_category in ["Cars", "Armour"]): {
		private ["_garageVehicles", "_i"];
		_garageVehicles = player getVariable ["IP_ShopGarageVehicles", []];
		
		_count = {_x == _vehicle} count _vehiclesInPossession;
		_vehiclesInPossession = _vehiclesInPossession - [_vehicle];
		if (_count > 1) then {		
			for "_i" from 1 to (_count - 1) do {
				_vehiclesInPossession pushBack _vehicle;
			};
		};
		
		{deleteVehicle _x} forEach _garageVehicles;
		_garageVehicles = [];		
		_i = 0;		
		{
			_cat = [(missionConfigFile >> "ShopCampVehicles"), _x] call IP_fnc_getConfigCategory;			
			if (_cat in ["Cars", "Armour"]) then {
				_marker = "mShopGarage" + str(_i);
				_created = [_x, _marker, _cat] call IP_fnc_createCampVehicle;
				_garageVehicles pushBack _created;
				_i = _i + 1;
			};
		} forEach _vehiclesInPossession;
		
		player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
		player setVariable ["IP_ShopGarageVehicles", _garageVehicles];
	};
	
	case (_category == "Air"): {
		private ["_hangarVehicles", "_i"];
		_hangarVehicles = player getVariable ["IP_ShopHangarVehicles", []];
		
		_count = {_x == _vehicle} count _vehiclesInPossession;
		_vehiclesInPossession = _vehiclesInPossession - [_vehicle];
		if (_count > 1) then {		
			for "_i" from 1 to (_count - 1) do {
				_vehiclesInPossession pushBack _vehicle;
			};
		};
		
		{deleteVehicle _x} forEach _hangarVehicles;
		_hangarVehicles = [];		
		_i = 0;		
		{
			_cat = [(missionConfigFile >> "ShopCampVehicles"), _x] call IP_fnc_getConfigCategory;			
			if (_cat == "Air") then {
				_marker = "mShopHangar" + str(_i);
				_created = [_x, _marker, _cat] call IP_fnc_createCampVehicle;
				_hangarVehicles pushBack _created;
				_i = _i + 1;
			};
		} forEach _vehiclesInPossession;
		
		player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
		player setVariable ["IP_ShopHangarVehicles", _hangarVehicles];
	};
	
	default {["%1 is not a recognised camp vehicle category!", _category] call BIS_fnc_error};
};

call IP_fnc_closeShop;
if (_unique == 1) then {
	_index = IP_CampVehicleCategories find _category;
	_sub = IP_AvailableCampVehicles select _index;
	_sub pushBack _vehicle;
	IP_AvailableCampVehicles set [_index, _sub];
};
_price call IP_fnc_addMoney;
["CampVehicles", _i] spawn IP_fnc_openShop;