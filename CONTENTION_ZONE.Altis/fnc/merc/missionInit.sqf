_fixedDate = getNumber(missionConfigFile >> "fixedDate");
_fixedWeather = getNumber(missionConfigFile >> "fixedWeather");

if ((_fixedDate != 1) && (!isNil "IP_MERCS_Date")) then {
	_date = IP_MERCS_Date;
	setDate _date;
};

if ((_fixedWeather != 1) && (!isNil "IP_MERCS_Weather")) then {
	[] spawn {
		_weather = IP_MERCS_Weather;
		waitUntil {time > 0};		
		IP_Weather = [(_weather select 0)] call IP_fnc_setWeather;
	};
};