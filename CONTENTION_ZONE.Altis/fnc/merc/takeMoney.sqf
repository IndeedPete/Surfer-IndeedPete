_addAction = {
	(_this select 0) addAction ["Take Money", {
		_object = _this select 0;
		_id = _this select 2;
		_amountMin = _object getVariable ["IP_AmountMin", 0];
		_amountMax = _object getVariable ["IP_AmountMax", 50];
		_delete = _object getVariable ["IP_DeleteObject", false];
		
		_total = _amountMin + round(random(_amountMax - _amountMin));
		_total call IP_fnc_addMoney;	
		_object removeAction _id;
		if (_delete) then {deleteVehicle _object};
	}, [], 1.5, false, true, "", "(_this distance _target < 3)"];
};

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_amountMin = [_this, 1, 1, [0]] call BIS_fnc_param;
_amountMax = [_this, 2, 50, [0]] call BIS_fnc_param;

if ((_amountMin < 1) OR (_amountMax < 1)) exitWith {};

_object setVariable ["IP_AmountMin", _amountMin];
_object setVariable ["IP_AmountMax", _amountMax];

if (_object isKindOf "Man") then {
	_object setVariable ["IP_DeleteObject", false];	
	_object addEventhandler ["Killed", _addAction];
} else {
	_object setVariable ["IP_DeleteObject", true];	
	[_object] call _addAction;
};