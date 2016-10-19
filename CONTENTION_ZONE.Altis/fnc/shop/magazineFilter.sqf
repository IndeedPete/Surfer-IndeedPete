private "_res";

_res = if (_this == "All") then {
	IP_AvailableMagazines
} else {
	private ["_mags", "_raw"];
	_mags = [];
	_raw = getArray(configFile >> "CfgWeapons" >> _this >> "magazines");
	_muzzles = getArray(configFile >> "CfgWeapons" >> _this >> "muzzles");
	if (count _muzzles > 1) then {
		{
			_raw append (getArray(configFile >> "CfgWeapons" >> _this >> _x >> "magazines"));
		} forEach (_muzzles - ["this"]);
	};
	
	{
		if (_x in IP_AvailableMagazines) then {
			_mags pushBack _x;
		};
	} forEach _raw;
	
	_mags
};

_res