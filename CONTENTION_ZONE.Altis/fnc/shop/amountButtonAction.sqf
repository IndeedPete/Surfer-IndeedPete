switch (_this) do {
	case 1600: {
		switch (IP_LastOpened) do {
			case "Magazines": {
				(sliderPosition 1900) call IP_fnc_buyOrSellMagazine;
			};
			
			case "StockMarket": {
				(sliderPosition 1900) call IP_fnc_buyOrSellStock;
			};
			
			default {["%1 is not a recognised shop category!", IP_LastOpened] call BIS_fnc_error};
		};
	};
	
	default {["1% is an unknown button IDC!", _this] call BIS_fnc_error};
};