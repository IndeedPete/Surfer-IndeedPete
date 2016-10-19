switch (_this) do {
	case 1601: {
		switch (IP_LastOpened) do {
			case "Missions": {
				_i = lbCurSel 1500;
				_i call IP_fnc_selectMission;
				call IP_fnc_closeShop;
				["Missions", _i] spawn IP_fnc_openShop;
			};
			
			case "Personnel": {
				(lbCurSel 1500) call IP_fnc_addPerson;
			};
			
			case "Weapons": {
				(lbCurSel 1500) call IP_fnc_buyWeapon;
			};
			
			case "Magazines": {
				[(lbCurSel 1500), false] call IP_fnc_openMagazineAmountDialog;
			};
			
			case "Items": {
				(lbCurSel 1500) call IP_fnc_buyItem;
			};
			
			case "Uniforms": {
				(lbCurSel 1500) call IP_fnc_buyUniform;
			};
			
			case "CampEnhancements": {
				(lbCurSel 1500) call IP_fnc_buyEnhancement;
			};
			
			case "CampVehicles": {
				(lbCurSel 1500) call IP_fnc_buyVehicle;
			};
			
			case "StockMarket": {
				[(lbCurSel 1500), false] call IP_fnc_openStockAmountDialog;
			};
			
			default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
		};
	};
	
	case 1602: {
		switch (IP_LastOpened) do {
			case "Missions": {
				[] call IP_fnc_closeShop;
				[] spawn IP_fnc_insert;
			};
			
			case "Personnel": {
				(lbCurSel 1501) call IP_fnc_removePerson;
			};
			
			case "Weapons": {
				(lbCurSel 1501) call IP_fnc_sellWeapon;
			};
			
			case "Magazines": {
				[(lbCurSel 1501), true] call IP_fnc_openMagazineAmountDialog;
			};
			
			case "Items": {
				(lbCurSel 1501) call IP_fnc_sellItem;
			};
			
			case "Uniforms": {
				(lbCurSel 1501) call IP_fnc_putOnUniform;
			};
			
			case "CampEnhancements": {
				hint "Camp enhancements cannot be sold back to the shop!";
			};
			
			case "CampVehicles": {
				(lbCurSel 1501) call IP_fnc_sellVehicle;
			};
			
			case "StockMarket": {
				[(lbCurSel 1501), true] call IP_fnc_openStockAmountDialog;
			};
			
			default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
		};
	};
	
	case 1603: {
		switch (IP_LastOpened) do {
			case "Personnel": {
				_silenced = if (player getVariable ["IP_ShopTeamSilenced", false]) then {false} else {true};
				player setVariable ["IP_ShopTeamSilenced", _silenced];
				
				if (_silenced) then {
					ctrlSetText [1603, (getText(missionConfigFile >> "ShopCategories" >> "Personnel" >> "labelAdditionalButtonOn"))];
					hint "Your selected teammates will bring silenced weapons if possible.";
				} else {
					ctrlSetText [1603, (getText(missionConfigFile >> "ShopCategories" >> "Personnel" >> "labelAdditionalButtonOff"))];
					hint "Your selected teammates will not bring silenced weapons.";
				};
			};
			
			case "Weapons": {
				_lsb = missionNamespace getVariable ["IP_LastLSB", 1500];
				_i = lbCurSel _lsb;
				if (_i == -1) exitWith {hint "You have to select a weapon first!"};
				
				_weapons = if (_lsb == 1500) then {
					(IP_WeaponFilter call IP_fnc_weaponFilter)
				} else {
					_box = player getVariable ["IP_ShopBox", ObjNull];
					(weaponCargo _box)
				};
				
				IP_MagazineFilter = _weapons select _i;
				call IP_fnc_closeShop;
				["Magazines", 0] spawn IP_fnc_openShop;
			};
			
			case "Magazines": {
				hint "This button is currently just a placeholder until I find a useful purpose for it. If you have any idea what function this dialog could be missing, please let me know.\n\nBest,\nIndeedPete";
			};
			
			case "Items": {
				hint "This button is currently just a placeholder until I find a useful purpose for it. If you have any idea what function this dialog could be missing, please let me know.\n\nBest,\nIndeedPete";
			};
			
			case "Uniforms": {
				hint "This button is currently just a placeholder until I find a useful purpose for it. If you have any idea what function this dialog could be missing, please let me know.\n\nBest,\nIndeedPete";
			};
			
			case "CampEnhancements": {
				hint "This button is currently just a placeholder until I find a useful purpose for it. If you have any idea what function this dialog could be missing, please let me know.\n\nBest,\nIndeedPete";
			};
			
			case "CampVehicles": {
				private "_category";
				_index = lbCurSel 1501;
				if (_index < 0) exitWith {hint "You have to select a vehicle first!"};
				
				_mission = player getVariable ["IP_ShopMission", ""];
				if (_mission == "") exitWith {hint "You have to select a mission first!"};
				_insertionTypes = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "insertionTypes");
			
				_vehiclesInPossession = player getVariable ["IP_ShopCampVehicles", []];
				_vehicle = _vehiclesInPossession select _index;
				_category = [(missionConfigFile >> "ShopCampVehicles"), _vehicle] call IP_fnc_getConfigCategory;
				if (_category == "Armour") then {_category = "Cars"};
				if ((_vehicle call IP_fnc_getCargoSeats) < 1) exitWith {hint "This vehicle cannot be selected for insertion. It does not have any capacity to carry troops."};
				if ({_x == _category} count _insertionTypes == 0) exitWith {hint "Your selected mission does not support this vehicle for insertion!"};
				
				_displayName = getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName");
				["InsertionSelected", [_displayName]] call BIS_fnc_showNotification;
				player setVariable ["IP_ShopInsertion", _vehicle];
			};
			
			case "StockMarket": {
				if (IP_TESTMODE) then {
					call IP_fnc_closeShop;
					[] call IP_fnc_updateStocks;
					["StockMarket"] spawn IP_fnc_openShop;
				} else {
					hint "This button is currently just a placeholder until I find a useful purpose for it. If you have any idea what function this dialog could be missing, please let me know.\n\nBest,\nIndeedPete";
				};
			};
			
			default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
		};
	};
	
	default {["1% is an unknown button IDC!", _this] call BIS_fnc_error};
};