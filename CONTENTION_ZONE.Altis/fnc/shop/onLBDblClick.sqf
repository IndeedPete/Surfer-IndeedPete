switch (IP_LastOpened) do {
	case "Missions": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_selectMission;
			call IP_fnc_closeShop;
			["Missions", (_this select 0)] spawn IP_fnc_openShop;
		};
	};
	
	case "Personnel": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_addPerson;
		};
		
		if ((_this select 1) == 1501) then {
			(_this select 0) call IP_fnc_removePerson;
		};
	};
	
	case "Weapons": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_buyWeapon;
		};
		
		if ((_this select 1) == 1501) then {
			(_this select 0) call IP_fnc_sellWeapon;
		};
	};
	
	case "Magazines": {
		_selling = if ((_this select 1) == 1501) then {true} else {false};
		[(_this select 0), _selling] call IP_fnc_openMagazineAmountDialog;
	};
	
	case "Items": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_buyItem;
		};
		
		if ((_this select 1) == 1501) then {
			(_this select 0) call IP_fnc_sellItem;
		};
	};
	
	case "Uniforms": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_buyUniform;
		};
		
		if ((_this select 1) == 1501) then {
			(_this select 0) call IP_fnc_putOnUniform;
		};
	};
	
	case "CampEnhancements": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_buyEnhancement;
		};
		
		if ((_this select 1) == 1501) then {
			hint "Camp enhancements cannot be sold back to the shop!";
		};
	};
	
	case "CampVehicles": {
		if ((_this select 1) == 1500) then {
			(_this select 0) call IP_fnc_buyVehicle;
		};
		
		if ((_this select 1) == 1501) then {
			(_this select 0) call IP_fnc_sellVehicle;
		};
	};
	
	case "StockMarket": {
		_selling = if ((_this select 1) == 1501) then {true} else {false};
		[(_this select 0), _selling] call IP_fnc_openStockAmountDialog;
	};
	
	default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
};