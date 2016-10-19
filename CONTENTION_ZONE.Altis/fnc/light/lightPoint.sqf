private ["_unit", "_lightPoint"];
_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param;

_lightPoint = if (isNull(_unit getVariable ["IP_LightPoint", ObjNull])) then {
	private "_light";
	_light = ObjNull;
	if ((vehicle _unit == _unit) && ("acc_flashlight" in (items _unit))) then {
		_pos = getPos _unit;
		_light = "#lightPoint" createVehicle _pos;
		_light setLightBrightness 0.2;
		_light setLightAmbient[1, 1, 1];
		_light setLightColor[0, 0, 0];
		_light lightAttachObject [_unit, [0, 2.5, -0.5]];
	};
	_light
} else {
	_light = _unit getVariable "IP_LightPoint";
	deleteVehicle _light;
	ObjNull
};

_unit setVariable ["IP_LightPoint", _lightPoint];