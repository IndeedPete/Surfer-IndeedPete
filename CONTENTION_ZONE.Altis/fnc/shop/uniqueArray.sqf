params [["_arr", [], [[]]], "_res"];
_res = [];

{
	if !(_x in _res) then {
		_res pushBack _x;
	};
} forEach _arr;

_res