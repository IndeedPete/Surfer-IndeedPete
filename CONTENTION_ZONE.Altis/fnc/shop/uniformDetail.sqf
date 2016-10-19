private ["_control", "_i", "_text"];
_control = str(_this select 0);
_i = _this select 1;
if (_i == -1) exitWith {};

if (_control == "Control #1500") then {
	_uniforms = IP_UniformFilter call IP_fnc_uniformFilter;
	_uniform = _uniforms select _i;
	_category = [(missionConfigFile >> "ShopUniforms"), _uniform] call IP_fnc_getConfigCategory;
	_price = "Price: " + ([(["ShopUniforms", _uniform] call IP_fnc_getPrice)] call IP_fnc_numberText) + "<br/>";	
	_description = if (isText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "description")) then {("Description: " + (getText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "description")) + "<br/>")} else {""};
	_text = _description + _price;
} else {
	_uniforms = player getVariable ["IP_ShopUniforms", []];
	_uniform = _uniforms select _i;
	_category = [(missionConfigFile >> "ShopUniforms"), _uniform] call IP_fnc_getConfigCategory;	
	_description = if (isText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "description")) then {("Description: " + (getText(missionConfigFile >> "ShopUniforms" >> _category >> _uniform >> "description")) + "<br/>")} else {""};
	_text = _description;
};

((findDisplay 10001) displayCtrl 1100) ctrlSetStructuredText (parseText _text);