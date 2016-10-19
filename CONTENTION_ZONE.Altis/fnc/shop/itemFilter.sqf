private "_res";

_res = if (_this == "All") then {
	(IP_AvailableItems call IP_fnc_arrayMerge)
} else {
	_categoryIndex = IP_ItemCategories find _this;
	(IP_AvailableItems select _categoryIndex)
};

_res