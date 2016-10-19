private ["_unit", "_condition", "_handle"];
_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param;
_condition = [_this, 1, {true}, [{}]] call BIS_fnc_param;

_handle = [_unit, _condition] spawn {
	_unit = _this select 0;
	_condition = _this select 1;
	
	if (!(isNil "IP_FalloutRunning") && {IP_FalloutRunning}) exitWith {["Already running!"] call BIS_fnc_error};
	IP_FalloutRunning = true;
	
	while {(alive _unit) && (call _condition)} do {
		_obj = vehicle _unit;
		_pos = if (_obj == _unit) then {
			(getposASL _obj)
		} else {
			_res = getposASL _obj;
			_res set [2, ((_res select 2) + 2)];
			_res
		};

		if (count(lineIntersectsObjs [_pos, [(_pos select 0),(_pos select 1),((_pos select 2) + 20)]]) == 0) then {
			if (isNull(_unit getVariable ["IP_Fallout", ObjNull])) then {
				_fallout = "#particleSource" createVehicleLocal (getPos _obj);
				_fallout setParticleParams [["\A3\data_f\ParticleEffects\Universal\universal.p3d",16,13,1,0],"","Billboard",1,10,[0,0,0],[0,0,-10],10,1,0,1,[0.12,0.12],[[0,0,0,0.5],[0,0,0,0.5]],[0,1],0.25,1,"","", _obj];
				_fallout setParticleRandom [0, [25, 25, 18], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
				_fallout setParticleCircle [0.0, [0, 0, 0]];
				_fallout setDropInterval 0.003;
				_unit setVariable ["IP_Fallout", _fallout];
			};
		} else {
			if (!isNull(_unit getVariable ["IP_Fallout", ObjNull])) then {
				deleteVehicle (_unit getVariable "IP_Fallout");
				_unit setVariable ["IP_Fallout", ObjNull];
			};
		};

		sleep 0.03;
	};
	
	IP_FalloutRunning = false;
	if (!isNull(_unit getVariable ["IP_Fallout", ObjNull])) then {
		deleteVehicle (_unit getVariable "IP_Fallout");
		_unit setVariable ["IP_Fallout", ObjNull];
	};
};

_handle