private "_res";

_res = if (_this == "All") then {
	(IP_AvailablePersonnel call IP_fnc_arrayMerge)
} else {
	_categoryIndex = IP_PersonnelCategories find _this;
	(IP_AvailablePersonnel select _categoryIndex)
};

_res