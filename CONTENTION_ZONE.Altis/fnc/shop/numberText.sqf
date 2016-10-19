// Based on BIS_fnc_numberText
private ["_number", "_mod", "_digits", "_digitsCount", "_modBase", "_numberText"];
_number = [_this, 0, 0, [0]] call bis_fnc_param;
_mod = [_this, 1, 3, [0]] call bis_fnc_param;

_number = round _number;
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % _mod;
_numberText = "";

{
	_numberText = _numberText + str(_x);
	if ((_forEachIndex - _modBase) % _mod == 0 && _forEachIndex != _digitsCount) then {_numberText = _numberText + "."};
} forEach _digits;

_numberText