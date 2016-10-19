private ["_cfg", "_res", "_category"];
_cfg = configFile >> "CfgVehicles" >> _this;
_res = getNumber(_cfg >> "transportSoldier");
_category = [(missionConfigFile >> "ShopCampVehicles"), _this] call IP_fnc_getConfigCategory;

if (count(_cfg >> "turrets") > 0) then {
	if (_category == "Cars") then {	
		_res = _res + count(_cfg >> "turrets");
	} else {
		_cargoTurrets = "['cargo', (configName _x)] call BIS_fnc_inString" configClasses (_cfg >> "turrets");
		_res = _res + count _cargoTurrets;
	};
};

if (_category == "Cars") then {_res = _res + 1};
_res