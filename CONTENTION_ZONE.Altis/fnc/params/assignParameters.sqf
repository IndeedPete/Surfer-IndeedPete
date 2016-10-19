params [
	["_assignOrSave", true, [false]],
	"_params"
];
_params = [] call IP_fnc_getParameters;

{
	_cfg = _x;
	_type = getText(_cfg >> "type");
	_variable = getText(_cfg >> "variable");
	
	_value = if (isMultiplayer) then {
		(paramsArray select _forEachIndex)
	} else {
		_idc = getNumber(_cfg >> "idc");
		_index = lbCurSel _idc;
		(lbValue [_idc, _index])
	};
	
	if (_assignOrSave) then {
		_processedValue = switch (_type) do {
			case "BOOLEAN": {
				([false, true] select _value)
			};
			
			case "NUMBER": {
				_value
			};
			
			case "MINUTE": {
				(60 * _value)
			};
			
			case "INTERVAL": {
				[_value, (2 * _value)]
			};
			
			case "MINUTEINTERVAL": {
				[(60 * _value), (2 * 60 * _value)]
			};
			
			case "CUSTOM": {
				private "_val";
				_val = _value;
				
				// Space to add Custom Cases
				
				_val
			};
			
			default {_value};
		};	
	
		missionNamespace setVariable [_variable, _processedValue];
	} else {
		profileNamespace setVariable [("CZ_" + _variable), _value];
	};
} forEach _params;

if (_assignOrSave) then {
	clearRadio;
	IP_ParametersAssigned = true;
} else {
	saveProfileNamespace;
	systemChat "Parameter configuration was saved to Profile Namespace.";
};