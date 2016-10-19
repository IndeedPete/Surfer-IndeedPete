private ["_array", "_list", "_clusteredArray"];
_array = _this;
_list = [];
_clusteredArray = [];

{
	_entry = _x;
	if (!(_entry in _list)) then {
		_list = _list + [_entry];
		_count = {_x == _entry} count _array;
		_clusteredArray = _clusteredArray + [[_entry, _count]];
	};
} forEach _array;

_clusteredArray