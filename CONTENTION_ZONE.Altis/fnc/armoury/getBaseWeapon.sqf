private ["_weapon", "_baseCfg", "_cfg"];
_weapon = [_this, 0, "", [""]] call BIS_fnc_param;
_baseCfg = (configFile >> "CfgWeapons");
_cfg = _baseCfg >> _weapon;
/*
while {isClass(_cfg >> "LinkedItems")} do {
	_parent = configName(inheritsFrom(_cfg));
	_cfg = _baseCfg >> _parent;
};*/

(getText( _cfg >> "baseWeapon"))
//(configName _cfg)