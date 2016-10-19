_this spawn {
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_cond = [_this, 1, {true}, [{}]] call BIS_fnc_param;

	while {(call _cond)} do {
		_weapon = primaryWeapon _unit;
		if (_weapon == "") exitWith {};
		_magazine = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
		
		waitUntil {sleep 1; (needReload _unit == 1)};
		waitUntil {(needReload _unit == 0)};
		if (primaryWeapon _unit == _weapon) then {_unit addMagazine _magazine};
	};
};