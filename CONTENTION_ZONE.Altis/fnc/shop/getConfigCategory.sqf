private ["_res", "_cans"];
params [
	["_top", configFile, [configFile]],
	["_class", "", [""]]
];
if (_class isEqualTo "") exitWith {"No class given!" call BIS_fnc_error};

_res = "";
_cans = "true" configClasses _top;
{
	if (isClass(_x >> _class)) exitWith {_res = _x};
} forEach _cans;

if (typeName _res == "CONFIG") then {(configName _res)} else {""};