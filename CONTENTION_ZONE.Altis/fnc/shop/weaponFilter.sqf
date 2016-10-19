private "_res";

_res = if (_this == "All") then {
	(IP_AvailableWeapons call IP_fnc_arrayMerge)
} else {
	_categoryIndex = IP_WeaponCategories find _this;
	(IP_AvailableWeapons select _categoryIndex)
};

_res