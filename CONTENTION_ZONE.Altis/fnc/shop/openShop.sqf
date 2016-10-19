private ["_setNavigation", "_setFilter", "_getFilterNames", "_name", "_funds", "_picture", "_catCfg"];

_setNavigation = {
	for "_i" from 0 to ((count IP_Navigation) - 1) do {
		_entry = IP_Navigation select _i;
		_displayName = getText(missionConfigFile >> "ShopCategories" >> _entry >> "displayName");
		_index = lbAdd [2100, _displayName];
		lbSetValue [2100, _index, _i];
	};
	
	_index = IP_Navigation find IP_LastOpened;
	lbSetCurSel [2100, _index];
};

_setFilter = {
	params [
		["_filters", [], [[]]],
		["_selectedIndex", -1, [0]]
	];
	
	for "_i" from 0 to ((count _filters) - 1) do {
		_index = lbAdd [2101, (_filters select _i)];
		lbSetValue [2101, _index, _i];
	};
	
	if (_selectedIndex >= 0) then {
		lbSetCurSel [2101, _selectedIndex];
	};
};

_getFilterNames = {
	private ["_cfg", "_categories", "_filterNames"];
	_cfg = _this select 0;
	_categories = _this select 1;
	_filterNames = [];
	
	{
		_add = if (isText(_cfg >> _x >> "displayName")) then {(getText(_cfg >> _x >> "displayName"))} else {_x};
		_filterNames pushBack _add;
	} forEach _categories;	
	
	_filterNames
};

params [
	["_category", IP_LastOpened, [""]],
	["_selectedIndex", 0, [0]]
];
IP_LastOpened = _category;

_box = player getVariable ["IP_ShopBox", ObjNull];
if (isNull _box) exitWith {"Shop box is null!" call BIS_fnc_error};
_name = name player;
_rank = [player, false] call IP_fnc_getRank;
_funds = [(player getVariable ["IP_ShopMoney", 0])] call IP_fnc_numberText;
_catCfg = (missionConfigFile >> "ShopCategories" >> _category);
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

switch (_category) do {
	// Missions
	case "Missions": {
		_last = player getVariable ["IP_ShopInsertion", ""];
		_picture = player getVariable ["IP_ShopPicture", (getText(missionConfigFile >> "ShopMetaInformation" >> "defaultPicture"))];
		_filterNames = [] call IP_fnc_insertionFilter;
		_index = _filterNames find _last;		
		
		_handle = createDialog "IP_DLG_SHOP_MISSIONS";
		call _setNavigation;
		if (count(_filterNames select 0) > 0) then {[(_filterNames select 0), _index] call _setFilter};
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1200, _picture];
		ctrlSetText [1000, ((getText(_catCfg >> "labelName")) + (name player))];
		ctrlSetText [1001, ((getText(_catCfg >> "labelRank")) + ([player, false] call IP_fnc_getRank))];
		ctrlSetText [1002, ((getText(_catCfg >> "labelFunds")) + _currency + " " + _funds)];
		((findDisplay 10000) displayCtrl 1100) ctrlSetStructuredText (parseText "");
		
		for "_i" from 0 to ((count IP_AvailableMissions) - 1) do {
			_entry = IP_AvailableMissions select _i;
			_title = getText(missionConfigFile >> "ShopMissions" >> _entry >> "title"); 
			_rew = [(getNumber(missionConfigFile >> "ShopMissions" >> _entry >> "reward"))] call IP_fnc_numberText;  
			_text = _title + " " + _currency + " " + _rew;
			_index = lbAdd [1500, _text];
		};
	};
	
	// Personnel
	case "Personnel": {
		_lastFilter = missionNamespace getVariable ["IP_PersonnelFilter", "All"];
		_filterIndex = IP_PersonnelFilters find _lastFilter;
		_filterNames = [(missionConfigFile >> "ShopPersonnel"), IP_PersonnelFilters] call _getFilterNames;
		_tcr = [] call IP_fnc_calculateTotalCostRate;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;
		[_filterNames, _filterIndex] call _setFilter;
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1002, (getText(_catCfg >> "labelFunds"))];
		ctrlSetText [1003, (str(_tcr * 100) + "%")];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		ctrlSetText [1601, (getText(_catCfg >> "labelPurchaseButton"))];
		ctrlSetText [1602, (getText(_catCfg >> "labelSellButton"))];
		_txt = if (player getVariable ["IP_ShopTeamSilenced", false]) then {(getText(_catCfg >> "labelAdditionalButtonOn"))} else {(getText(_catCfg >> "labelAdditionalButtonOff"))};
		ctrlSetText [1603, _txt];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");	
		
		_team = player getVariable ["IP_ShopTeam", []];
		for "_i" from 0 to ((count _team) - 1) do {
			_entry = _team select _i;
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_category = [(missionConfigFile >> "ShopPersonnel"), _entry] call IP_fnc_getConfigCategory;
			_costRate = str((getNumber(missionConfigFile >> "ShopWeapons" >> _category >> _entry >> "costRate")) * 100);
			_text = _title + " " + _costRate + "%"; 
			_index = lbAdd [1501, _text];
		};
	};
	
	// Weapons
	case "Weapons": {
		_lastFilter = missionNamespace getVariable ["IP_WeaponFilter", "All"];
		_filterIndex = IP_WeaponFilters find _lastFilter;
		_filterNames = [(missionConfigFile >> "ShopWeapons"), IP_WeaponFilters] call _getFilterNames;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;		
		[_filterNames, _filterIndex] call _setFilter;		
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		ctrlSetText [1603, (getText(_catCfg >> "labelAdditionalButton"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");	
		
		_weapons = weaponCargo _box;		
		for "_i" from 0 to ((count _weapons) - 1) do {
			_entry = _weapons select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_index = lbAdd [1501, _title];
			lbSetPicture [1501, _index, _picture];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Magazines
	case "Magazines": {
		IP_MagazineFilters = ["All", "Throw", "Put"] + ([((weaponCargo _box) + (weapons player))] call IP_fnc_uniqueArray);
		_lastFilter = missionNamespace getVariable ["IP_MagazineFilter", "All"];
		if !(_lastFilter in IP_MagazineFilters) then {IP_MagazineFilters pushBack _lastFilter};
		_filterIndex = IP_MagazineFilters find _lastFilter;
		_filterNames = [(configFile >> "CfgWeapons"), IP_MagazineFilters] call _getFilterNames;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;		
		[_filterNames, _filterIndex] call _setFilter;		
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");
		
		_magazines = (magazineCargo _box) call IP_fnc_clusterArray;		
		for "_i" from 0 to ((count _magazines) - 1) do {
			_cell = _magazines select _i;
			_entry = _cell select 0;
			_count = _cell select 1;
			_title = getText(configFile >> "CfgMagazines" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgMagazines" >> _entry >> "picture");
			
			_text = str(_count) + " " +  _title;
			_index = lbAdd [1501, _text];
			lbSetPicture [1501, _index, _picture];
			lbSetData [1501, _index, _entry];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Items
	case "Items": {
		_lastFilter = missionNamespace getVariable ["IP_ItemFilter", "All"];
		_filterIndex = IP_ItemFilters find _lastFilter;
		_filterNames = [(missionConfigFile >> "ShopItems"), IP_ItemFilters] call _getFilterNames;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;		
		[_filterNames, _filterIndex] call _setFilter;		
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");	
		
		_items = ((itemCargo _box) + (backpackCargo _box)) call IP_fnc_clusterArray;	
		for "_i" from 0 to ((count _items) - 1) do {
			_cell = _items select _i;
			_entry = _cell select 0;
			_count = _cell select 1;
			_parent = _entry call IP_fnc_getTopConfig;
			_title = getText (configFile >> _parent >> _entry >> "displayName");
			_picture = getText(configFile >> _parent >> _entry >> "picture");			
			_text = str(_count) + " " +  _title;
			_index = lbAdd [1501, _text];
			lbSetPicture [1501, _index, _picture];
			lbSetData [1501, _index, _entry];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Uniforms
	case "Uniforms": {
		private "_uniformsInPossession";
		_lastFilter = missionNamespace getVariable ["IP_UniformFilter", "All"];
		_filterIndex = IP_UniformFilters find _lastFilter;
		_filterNames = [(missionConfigFile >> "ShopUniforms"), IP_UniformFilters] call _getFilterNames;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;
		[_filterNames, _filterIndex] call _setFilter;
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		ctrlSetText [1602, (getText(_catCfg >> "labelSellButton"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");	
		
		_uniformsInPossession = player getVariable ["IP_ShopUniforms", []];
		_uniform = uniform player;
		if ((_uniform != "") && {{_x == _uniform} count _uniformsInPossession == 0}) then {			
			private "_categoryIndex";
			_categoryIndex = 0;
			
			{
				_subset = _x;
				if ({_x == _uniform} count _subset > 0) exitWith {
					_categoryIndex = _forEachIndex;
				};
			} forEach IP_AvailableUniforms;
			
			_arr = (IP_AvailableUniforms select _categoryIndex) - [_uniform];
			IP_AvailableUniforms set [_categoryIndex, _arr];
			_uniformsInPossession pushBack _uniform;
			player setVariable ["IP_ShopUniforms", _uniformsInPossession];
		};
		
		for "_i" from 0 to ((count _uniformsInPossession) - 1) do {
			_entry = _uniformsInPossession select _i;
			_title = getText(configFile >> "CfgWeapons" >> _entry >> "displayName");
			_picture = getText(configFile >> "CfgWeapons" >> _entry >> "picture");
			_index = lbAdd [1501, _title];
			lbSetPicture [1501, _index, _picture];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Camp Enhancements
	case "CampEnhancements": {
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");
	
		for "_i" from 0 to ((count IP_AvailableCampEnhancements) - 1) do {
			_entry = IP_AvailableCampEnhancements select _i;
			_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "title");
			_price = [(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "price"))] call IP_fnc_numberText;
			_text = _title + " " + _currency + " " + _price;
			_index = lbAdd [1500, _text];
		};
		
		_enhancementInPossession = player getVariable ["IP_ShopCampEnhancements", []];
		for "_i" from 0 to ((count _enhancementInPossession) - 1) do {		
			_entry = _enhancementInPossession select _i;
			_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _entry >> "title");
			_index = lbAdd [1501, _title];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Camp Vehicles
	case "CampVehicles": {
		_lastFilter = missionNamespace getVariable ["IP_CampVehicleFilter", "All"];
		_filterIndex = IP_CampVehicleFilters find _lastFilter;
		_filterNames = [(missionConfigFile >> "ShopCampVehicles"), IP_CampVehicleFilters] call _getFilterNames;
		
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;		
		[_filterNames, _filterIndex] call _setFilter;		
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		ctrlSetText [1603, (getText(_catCfg >> "labelAdditionalButton"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");
		
		_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];	
		for "_i" from 0 to ((count _vehiclesInPossession) - 1) do {		
			_entry = _vehiclesInPossession select _i;
			_picture = getText(configFile >> "CfgVehicles" >> _entry >> "picture");
			_title = getText(configFile >> "CfgVehicles" >> _entry >> "displayName");
			_index = lbAdd [1501, _title];
			lbSetPicture [1501, _index, _picture];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	// Stock Market
	case "StockMarket": {
		_lastAccess = if !(isNil "IP_LastStockMarketAccess") then {IP_LastStockMarketAccess} else {date};
		_handle = createDialog "IP_DLG_SHOP_ITEMS";
		call _setNavigation;
		
		ctrlSetText [1800, (getText(_catCfg >> "displayName"))];
		ctrlSetText [1003, (_currency + " " + _funds)];
		ctrlSetText [1004, (getText(_catCfg >> "labelLeft"))];
		ctrlSetText [1005, (getText(_catCfg >> "labelRight"))];
		((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText "");
		
		if (((dateToNumber date) - (dateToNumber _lastAccess) >= 0.000114173) OR {(date select 0) > (_lastAccess select 0)}) then {
			[] call IP_fnc_updateStocks;
			IP_LastStockMarketAccess = date;
		};
	
		for "_i" from 0 to ((count IP_AvailableStocks) - 1) do {
			_entry = IP_AvailableStocks select _i;
			_identifier = _entry select 0;
			_title = getText(missionConfigFile >> "ShopStocks" >> _identifier >> "displayName");
			_price = _entry select 1;
			_lastPrice = if (count IP_LastStocks > 0) then {((IP_LastStocks select _i) select 1)} else {-1};
			_picture = if (_price >= _lastPrice) then {"stock_up_co"} else {"stock_down_co"};
			_text = _title + " " + _currency + " " + str(_price);
			_index = lbAdd [1500, _text];
			lbSetPicture [1500, _index, ("Campaigns\IP_CMP_ICE\img\shop\" + _picture + ".paa")];
		};
		
		_stocksInDepot = player getVariable ["IP_ShopStocks", []];
		for "_i" from 0 to ((count _stocksInDepot) - 1) do {		
			_entry = _stocksInDepot select _i;
			_identifier = _entry select 0;
			_count = [(_entry select 1)] call IP_fnc_numberText;
			_title = getText(missionConfigFile >> "ShopStocks" >> _identifier >> "displayName");
			_text = _count + " " +  _title;
			_index = lbAdd [1501, _text];
			lbSetData [1501, _index, _identifier];
		};
		
		lbSetCurSel [1500, _selectedIndex];
	};
	
	default {["Category %1 not recognised!", _category] call BIS_fnc_error};
};