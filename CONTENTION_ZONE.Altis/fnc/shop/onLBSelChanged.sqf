switch (IP_LastOpened) do {
	case "Missions": {
		_this call IP_fnc_missionDetail;
	};
	
	case "Personnel": {
		_this call IP_fnc_personDetail;
	};
	
	case "Weapons": {
		_this call IP_fnc_weaponDetail;
	};
	
	case "Magazines": {
		_this call IP_fnc_magazineDetail;
	};
	
	case "Items": {
		_this call IP_fnc_itemDetail;
	};
	
	case "Uniforms": {
		_this call IP_fnc_uniformDetail;
	};
	
	case "CampEnhancements": {
		_this call IP_fnc_enhancementDetail;
	};
	
	case "CampVehicles": {
		_this call IP_fnc_vehicleDetail;
	};
	
	case "StockMarket": {
		_this call IP_fnc_stockDetail;
	};
	
	default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
};