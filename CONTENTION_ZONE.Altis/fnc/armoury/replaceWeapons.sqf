private ["_getIdentifier", "_getReplacement", "_classes", "_identifiers", "_config", "_result"];

_getIdentifier = {
	private ["_identifiers", "_i", "_identifier"];
	_identifiers = _this select 0;
	_i = _this select 1;
	
	_identifier = if (typeName _identifiers == "STRING") then {
		_identifiers
	} else {
		_count = count _identifiers;
		
		_identifier = if (_i < _count) then {
			(_identifiers select _i)
		} else {
			(_identifiers select (_count - 1))
		};
		
		_identifier
	};
	
	_identifier
};

_getReplacement = {
	private ["_class", "_identifier", "_config", "_replacement", "_getBaseWeapon"];
	_class = _this select 0;
	_identifier = _this select 1;
	_config = _this select 2;
	_getBaseWeapon = _this select 3;
	
	if (_getBaseWeapon) then {
		_class = [_class] call BIS_fnc_baseWeapon;
	};
	
	_replacement = if (isText(_config >> _class >> _identifier)) then {
		_wep = getText(_config >> _class >> _identifier);
		
		_replacement = if ((isClass(configFile >> "CfgWeapons" >> _wep)) OR {isClass(configFile >> "CfgVehicles" >> _wep)}) then {
			_wep
		} else {
			_class
		};
		
		_replacement
	} else {
		_class
	};
	
	_replacement
};
 
_classes = [_this, 0, "", ["", []]] call BIS_fnc_param;
if (((typeName _classes == "STRING") && {_classes == ""}) OR {count _classes == 0}) exitWith {"_classes parameter empty!" call BIS_fnc_error};
_identifiers = [_this, 1, "", ["", []]] call BIS_fnc_param;
if (((typeName _identifiers == "STRING") && {_identifiers == ""}) OR {count _identifiers == 0}) exitWith {"_identifiers parameter empty!" call BIS_fnc_error};
_config = [_this, 2, (missionConfigFile >> "CfgWeaponReplacements"), [(configFile >> "CfgWeapons")]] call BIS_fnc_param;
if (!isClass _config) exitWith {["Config %1 not found!", _config] call BIS_fnc_error};
_getBaseWeapon = [_this, 3, true, [false]] call BIS_fnc_param;

_result = if (typeName _classes == "STRING") then {
	_identifier = [_identifiers, 0] call _getIdentifier;
	_replacement = [_classes, _identifier, _config, _getBaseWeapon] call _getReplacement;
	_replacement
} else {
	private "_replacements";
	_replacements = [];
	
	{
		_identifier = [_identifiers, _forEachIndex] call _getIdentifier;
		_replacement = [_x, _identifier, _config, _getBaseWeapon] call _getReplacement;
		_replacements pushBack _replacement;
	} forEach _classes;
	
	_replacements
};

_result