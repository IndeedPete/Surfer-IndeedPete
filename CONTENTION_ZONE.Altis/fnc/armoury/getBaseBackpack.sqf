private ["_backpack", "_baseCfg", "_cfg", "_result"];
_backpack = [_this, 0, "", [""]] call BIS_fnc_param;
if (_backpack == "") exitWith {""};
_baseCfg = (configFile >> "CfgVehicles");
_cfg = _baseCfg >> _backpack;

if (isText(_cfg >> "baseBackpack")) then {
	_result = getText(_cfg >> "baseBackpack");
} else {
	/*while {{count("true" configClasses _x) > 0} count [(_cfg >> "TransportItems"), (_cfg >> "TransportMagazines"), (_cfg >> "TransportWeapons")] > 0} do {
		_parent = configName(inheritsFrom(_cfg));
		_cfg = _baseCfg >> _parent;
		_result = configName _cfg;
	};*/
	_result = _backpack call BIS_fnc_basicBackpack;
};

_result