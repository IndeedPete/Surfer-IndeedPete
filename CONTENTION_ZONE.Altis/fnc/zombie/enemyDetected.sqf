private ["_unit", "_detectionRadius", "_isAnimal"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_detectionRadius = [_this, 1, 1000, [0]] call BIS_fnc_param;
_isAnimal = [_this, 2, false, [true]] call BIS_fnc_param;
_enemySides = [_this, 3, (_unit call BIS_fnc_enemySides), [[]]] call BIS_fnc_param;

((count([_unit, _detectionRadius, _isAnimal, _enemySides] call IP_fnc_enemyTargets)) > 0)