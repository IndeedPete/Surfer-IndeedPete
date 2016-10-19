params ["_index", "_currency"];
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");
if (_index < 0) exitWith {};

switch (IP_LastOpened) do {
	case "Missions": {
		_last = player getVariable ["IP_ShopInsertion", ""];
		_insertionTypes = [] call IP_fnc_insertionFilter;
		_displayName = (_insertionTypes select 0) select _index;
		_insertionType = (_insertionTypes select 1) select _index;
		if (_last == _insertionType) exitWith {};
		["InsertionSelected", [_displayName]] call BIS_fnc_showNotification;
		player setVariable ["IP_ShopInsertion", _insertionType];
	};
	
	case "Personnel": {
		_filter = IP_PersonnelFilters select _index;
		_data = _filter call IP_fnc_personnelFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_category = [(missionConfigFile >> "ShopPersonnel"), _entry] call IP_fnc_getConfigCategory;
			_costRate = str((getNumber(missionConfigFile >> "ShopWeapons" >> _category >> _entry >> "costRate")) * 100);
			_text = _title + " " + _costRate + "%";
			_index = lbAdd [1500, _text];
		};
		
		IP_PersonnelFilter = _filter;
	};
	
	case "Weapons": {
		_filter = IP_WeaponFilters select _index;
		_data = _filter call IP_fnc_weaponFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			//_category = [(missionConfigFile >> "ShopWeapons"), _entry] call IP_fnc_getConfigCategory;
			//_price = [(getNumber(missionConfigFile >> "ShopWeapons" >> _category >> _entry >> "price"))] call IP_fnc_numberText;
			_price = [(["ShopWeapons", _entry] call IP_fnc_getPrice)] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, _picture];
		};
		
		IP_WeaponFilter = _filter;
	};
	
	case "Magazines": {
		_filter = IP_MagazineFilters select _index;
		_data = _filter call IP_fnc_magazineFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_title = getText(configFile >> "CfgMagazines" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgMagazines" >> _entry >> "picture");
			//_price = [(getNumber(missionConfigFile >> "ShopMagazines" >> _entry >> "price"))] call IP_fnc_numberText;
			_price = [(["ShopMagazines", _entry] call IP_fnc_getPrice)] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, _picture];
		};
		
		IP_MagazineFilter = _filter;
	};
	
	case "Items": {
		_filter = IP_ItemFilters select _index;
		_data = _filter call IP_fnc_itemFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_parent = _entry call IP_fnc_getTopConfig;
			_title = getText(configFile >> _parent >> _entry >> "displayName");
			_picture = getText(configFile >> _parent >> _entry >> "picture");
			//_category = [(missionConfigFile >> "ShopItems"), _entry] call IP_fnc_getConfigCategory;
			_price = [(["ShopItems", _entry] call IP_fnc_getPrice)] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, _picture];
		};
		
		IP_ItemFilter = _filter;
	};
	
	case "Uniforms": {
		_filter = IP_UniformFilters select _index;
		_data = _filter call IP_fnc_uniformFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			//_category = [(missionConfigFile >> "ShopUniforms"), _entry] call IP_fnc_getConfigCategory;
			_price = [(["ShopUniforms", _entry] call IP_fnc_getPrice)] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, _picture];
		};
		
		IP_UniformFilter = _filter;
	};
	
	case "CampEnhancements": {};
	
	case "CampVehicles": {
		_filter = IP_CampVehicleFilters select _index;
		_data = _filter call IP_fnc_vehicleFilter;
		
		lbClear 1500;
		lbSetCurSel [1500, -1];
		for "_i" from 0 to ((count _data) - 1) do {
			_entry = _data select _i;
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgVehicles" >> _entry >> "picture");
			_category = [(missionConfigFile >> "ShopCampVehicles"), _entry] call IP_fnc_getConfigCategory;
			_price = [(getNumber(missionConfigFile >> "ShopCampVehicles" >> _category >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, _picture];
		};
		
		IP_CampVehicleFilter = _filter;
	};
	
	default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
};