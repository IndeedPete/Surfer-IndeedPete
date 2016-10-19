private "_res";

_res = if (_this == "All") then {
	(IP_AvailableUniforms call IP_fnc_arrayMerge)
} else {
	_categoryIndex = IP_UniformCategories find _this;
	(IP_AvailableUniforms select _categoryIndex)
};

_res