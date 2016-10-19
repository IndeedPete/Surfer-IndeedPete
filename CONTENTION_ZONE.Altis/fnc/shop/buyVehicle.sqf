private ["_i", "_vehicles", "_vehicle", "_category", "_price", "_unique", "_enhancementsInPossession", "_vehiclesInPossession"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a vehicle first!"};

_vehicles = IP_CampVehicleFilter call IP_fnc_vehicleFilter;
_vehicle = _vehicles select _i;
_category = [(missionConfigFile >> "ShopCampVehicles"), _vehicle] call IP_fnc_getConfigCategory;	
_price = getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "price");
_unique = if (isNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "unique")) then {(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _vehicle >> "unique"))} else {0};
_enhancementsInPossession = player getVariable ["IP_ShopCampEnhancements", []];
_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];

switch (true) do {
	case (_category in ["Cars", "Armour"]): {
		private ["_space"];
		_countInPossession = {([(missionConfigFile >> "ShopCampVehicles"), _x] call IP_fnc_getConfigCategory) in ["Cars", "Armour"]} count _vehiclesInPossession;
		_garages = "isNumber(_x >> 'garage')" configClasses (missionConfigFile >> "ShopCampEnhancements");
		_space = 0;
		
		{
			if ((configName _x) in _enhancementsInPossession) then {
				_add = getNumber(_x >> "garage");
				_space = _space + _add;
			};
		} forEach _garages;
		
		if (_countInPossession >= _space) exitWith {hint "Your garage is full!"};
		
		if (_price call IP_fnc_purchase) then {
			_spot = _countInPossession + 1;
			_marker = "mShopGarage" + str(_spot);
			_created = [_vehicle, _marker, _category] call IP_fnc_createCampVehicle;
			_garageVehicles = player getVariable ["IP_ShopGarageVehicles", []];
			_garageVehicles pushBack _created;
			_vehiclesInPossession pushBack _vehicle;
			player setVariable ["IP_ShopGarageVehicles", _garageVehicles];
			player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
			call IP_fnc_closeShop;
			if (_unique == 1) then {
				_index = IP_CampVehicleCategories find _category;
				_sub = IP_AvailableCampVehicles select _index;
				_sub = _sub - [_vehicle];
				IP_AvailableCampVehicles set [_index, _sub];
			};
			["CampVehicles", _i] spawn IP_fnc_openShop;
		};
	};
	
	case (_category == "Air"): {
		private ["_space"];
		_countInPossession = {([(missionConfigFile >> "ShopCampVehicles"), _x] call IP_fnc_getConfigCategory) == "Air"} count _vehiclesInPossession;
		_hangars = "isNumber(_x >> 'hangar')" configClasses (missionConfigFile >> "ShopCampEnhancements");
		_space = 0;
		
		{
			if ((configName _x) in _enhancementsInPossession) then {
				_add = getNumber(_x >> "hangar");
				_space = _space + _add;
			};
		} forEach _hangars;
		
		if (_countInPossession >= _space) exitWith {hint "Your hangar is full!"};
		
		if (_price call IP_fnc_purchase) then {
			_spot = _countInPossession + 1;
			_marker = "mShopHangar" + str(_spot);
			_created = [_vehicle, _marker, _category] call IP_fnc_createCampVehicle;
			_hangarVehicles = player getVariable ["IP_ShopHangarVehicles", []];
			_hangarVehicles pushBack _created;
			_vehiclesInPossession pushBack _vehicle;
			player setVariable ["IP_ShopHangarVehicles", _hangarVehicles];
			player setVariable ["IP_ShopCampVehicles", _vehiclesInPossession];
			call IP_fnc_closeShop;
			if (_unique == 1) then {
				_index = IP_CampVehicleCategories find _category;
				_sub = IP_AvailableCampVehicles select _index;
				_sub = _sub - [_vehicle];
				IP_AvailableCampVehicles set [_index, _sub];
			};
			["CampVehicles", _i] spawn IP_fnc_openShop;
		};
	};
	
	default {["%1 is not a recognised camp vehicle category!", _category] call BIS_fnc_error};
};