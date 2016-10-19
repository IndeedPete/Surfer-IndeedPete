private "_parent";

_parent = if (isClass(configFile >> "CfgWeapons" >> _this)) then {
	"CfgWeapons"
} else {
	_ret = if (isClass(configFile >> "CfgVehicles" >> _this)) then {"CfgVehicles"} else {"CfgGlasses"};
	_ret
};

_parent