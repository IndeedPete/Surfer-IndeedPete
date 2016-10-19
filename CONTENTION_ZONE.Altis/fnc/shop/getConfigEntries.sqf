private "_res";

_config = _this;
_res = [];

_count = count _config;
for "_i" from 0 to (_count - 1) do {
	_res set [count _res, (configName(_config select _i))];
};

_res