private "_arr";
_arr = [];

{
	if (typeName _x == "ARRAY") then {
		_arr append _x;
	} else {
		_arr pushBack _x;
	};
} forEach _this;

_arr