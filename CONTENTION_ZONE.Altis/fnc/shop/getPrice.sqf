params [
	["_shopConfig", "ShopWeapons", [""]],
	["_class", "", [""]],
	"_key",
	"_price"
];

_key = "IP_" + _class;
_price = if (!(isNil "IP_Shop_HashMap") && {(IP_Shop_HashMap getVariable [_key, -1]) > -1}) then {
	(IP_Shop_HashMap getVariable _key)
} else {
	([_shopConfig, _class] call IP_fnc_determinePrice)
};

_price