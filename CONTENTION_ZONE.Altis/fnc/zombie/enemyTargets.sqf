private ["_targets", "_enemies", "_enemySides", "_side", "_unit", "_detectionRadius", "_isAnimal"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_detectionRadius = [_this, 1, 1000, [0]] call BIS_fnc_param;
_isAnimal = [_this, 2, false, [true]] call BIS_fnc_param;
_enemySides = [_this, 3, (_unit call BIS_fnc_enemySides), [[]]] call BIS_fnc_param;

_targets = if (_isAnimal) then {(_unit nearEntities ["man", _detectionRadius])} else {(_unit nearTargets _detectionRadius)};
_enemies = [];

_enemies = if (_isAnimal) then {
	{
		if (((side _x) in _enemySides) && (alive _x)) then {
			_arr = [(getPos _x), nil, nil, nil, _x];
			_enemies pushBack _arr;
		};
	} forEach _targets;
	_enemies
} else {
	{
		_unit = (_x select 4);
		_side = (_x select 2);

		if ((_side in _enemySides) && (count(crew _unit) > 0)) then
		{
			if ((side(driver _unit)) in _enemySides) then
			{
				_enemies pushBack _x;
			};
		};
	} forEach _targets;
	_enemies
};

_enemies