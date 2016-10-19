private ["_transitionTime", "_intensity"];
_transitionTime = [_this, 0, 0, [0]] call BIS_fnc_param;
_intensity = [_this, 1, 0, [0]] call BIS_fnc_param;

_transitionTime setRain _intensity;