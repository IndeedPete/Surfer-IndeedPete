private ["_mode", "_params"];
_mode = param [0, 0, [0]]; // 0 - Normal (Open), 1 - Random, 2 - Load from Profile Namespace
_params = [] call IP_fnc_getParameters;

if (_mode == 0) then {
	createDialog "IP_DLG_PARAMS";
};
	
{
	_cfg = _x;
	_idc = getNumber(_cfg >> "idc");
	_texts = getArray(_cfg >> "texts");
	_values = getArray(_cfg >> "values");
	_default = getNumber(_cfg >> "default");
	_variable = getText(_cfg >> "variable");
	_title = getText(_cfg >> "title");
	_index = switch (_mode) do {
		case 0: {(_values find _default)};
		case 1: {(floor(random(count _values)))};
		case 2: {
			_val = profileNamespace getVariable ("CZ_" + _variable);
			if (isNil "_val") exitWith {
				systemChat ("Unable to find saved value for " + _title + " in Profile Namespace. Using default instead.");
				(_values find _default)
			};
			
			_i = _values find _val;
			if (_i < 0) exitWith {
				systemChat ("Unable to find saved value for " + _title + " in accepted parameter values. Using default instead.");
				(_values find _default)
			};
			
			_i
		};
	};
	
	lbClear _idc;
	{
		_val = _values select _forEachIndex;
		_i = lbAdd [_idc, _x];
		lbSetValue [_idc, _i, _val];
	} forEach _texts;
	
	lbSetCurSel [_idc, _index];
} forEach _params;