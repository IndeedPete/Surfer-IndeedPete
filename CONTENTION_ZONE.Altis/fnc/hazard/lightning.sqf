private ["_pos", "_dir", "_bolt", "_light", "_class", "_lightning", "_duration"];
_pos = [_this, 0, [0, 0, 0], [[]], 3] call BIS_fnc_param;
_dir = random 360;

_bolt = "LightningBolt" createVehicleLocal _pos;
_bolt setPosATL _pos;
_bolt setDamage 1;

_light = "#lightPoint" createVehicleLocal _pos;
_light setPosATL [_pos select 0,_pos select 1,(_pos select 2) + 10];
_light setLightDayLight true;
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setLightColor [1, 1, 2];

sleep 0.1;
_light setLightBrightness 0;
sleep (random 0.1);

_class = ["lightning1_F", "lightning2_F"] call bis_Fnc_selectrandom;
_lightning = _class createVehicleLocal [100, 100, 100];
_lightning setDir _dir;
_lightning setPos _pos;

_duration = 3 + (random 1);
for "_i" from 0 to _duration do {
	_time = time + 0.1;
	_light setLightBrightness (100 + (random 100));
	waitUntil {time > _time};
};

deleteVehicle _lightning;
deleteVehicle _light;

//--- Disable engine lightnings
0 setLightnings 0;