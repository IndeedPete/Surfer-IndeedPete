private "_res";

_res = if (_this == "All") then {
	(IP_AvailableCampVehicles call IP_fnc_arrayMerge)
} else {
	_categoryIndex = IP_CampVehicleCategories find _this;
	(IP_AvailableCampVehicles select _categoryIndex)
};

_res