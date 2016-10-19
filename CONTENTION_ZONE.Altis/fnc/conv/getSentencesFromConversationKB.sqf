private ["_conv", "_configs", "_sentences"];
_conv = [_this, 0, "", [""]] call BIS_fnc_param;

_configs = ("getText(_x >> 'conversation') == " + str(_conv)) configClasses (missionConfigFile >> "Sentences");
_sentences = [];
{_sentences pushBack [_conv, (configName _x)]} forEach _configs;

_sentences