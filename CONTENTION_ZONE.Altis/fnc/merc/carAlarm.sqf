_this spawn {
	_car = [_this, 0, objNull, [objNull]]call BIS_fnc_param;
	_cond = [_this, 1, {true}, [{}]]call BIS_fnc_param;
	
	sleep (random 2);

	while {(call _cond) && (alive _car)} do {
		_car say3D "AlarmCar";
		_flash = _car spawn {
			player action ["LightOn", _this];
			sleep 0.5;
			player action ["LightOff", _this];
			sleep 0.5;
			player action ["LightOn", _this];
			sleep 0.5;
			player action ["LightOff", _this];
			sleep 0.5;
		};
		sleep 2;
	};
};