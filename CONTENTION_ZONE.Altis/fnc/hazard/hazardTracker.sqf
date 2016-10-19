if (!isNil "IP_HazardTrackerRunning") exitWith {};
IP_HazardTrackerRunning = true;

_this spawn {
	private ["_unit", "_protectingHeadgear", "_protectingGoggles"];
	_unit = [_this, 0, player, [ObjNull]] call BIS_fnc_param; // Validate incoming parameters.
	_protectingHeadgear = ["H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "H_Shemag_olive_hs"];
	_protectingGoggles = ["G_Bandanna_tan", "G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator", "G_Balaclava_blk", "G_Balaclava_oli", "G_Balaclava_lowprofile", "G_Balaclava_combat", "Mask_M40", "Mask_M40_OD", "Mask_M50"];

	// While unit is alive check if it is inside a danger zone.
	while {!(isNull _unit) && {alive _unit}} do {
		private ["_nearByLogics", "_damageFactor", "_inBIOHazard", "_inCHEMHazard", "_inRADHazard", "_inFREEZER", "_inBLASTER", "_inTRIP", "_affectingLogics"]; // Adding local variables to innermost scope. Means they can be filled/overwritten within loops / control structures.
		_nearByLogics = nearestObjects [(getPos _unit), ["logic"], 201]; // ToDo: Adjust radius (500) to maximum hazard zone diameter.
		_damageFactor = 0; // Initialise / reset damage factor;
		_inBIOHazard = false; // Initialise / reset
		_inCHEMHazard = false; // Initialise / reset
		_inRADHazard = false; // Initialise / reset
		_inFREEZER = nil;
		_inBLASTER = nil;
		_inTRIP = nil;
		_affectingLogics = [];

		{
			if (_unit distance _x <= (_x getVariable ["SURF_Radius", 99999])) then {
				_hazard = toUpper(_x getVariable ["SURF_Hazard", ""]);
				if ((_hazard != "") && {_hazard != "ZOMBIES"}) then {
					switch (_hazard) do {
						case "BIO": {
							if (!_inBIOHazard) then { // Already in hazard.
								_damageFactor = _damageFactor + 0.02;
								_inBIOHazard = true;
							};
						};

						case "CHEM": {
							if (!_inCHEMHazard) then { // Already in hazard.
								_damageFactor = _damageFactor + 0.02;
								_inCHEMHazard = true;
							};
						};

						case "RAD": {
							if (!_inRADHazard) then { // Already in hazard.
								_damageFactor = _damageFactor + 0.02;
								_inRADHazard = true;
							};
						};

						case "FREEZER": {
							if (isNil "_inFREEZER") then { // Already in hazard.
								_damageFactor = _damageFactor + 0.04;
								_inFREEZER = _x;
							};
						};

						case "BLASTER": {
							if (isNil "_inBLASTER") then { // Already in hazard.
								_damageFactor = _damageFactor + 0.04;
								_inBLASTER = _x;
							};
						};

						case "TRIP": {
							if (isNil "_inTRIP") then { // Already in hazard.
								_damageFactor = _damageFactor + 0.01;
								_inTRIP = _x;
							};
						};

						default {/* Do nothing. */};
					};

					_affectingLogics pushBack _x;
				};
			};
		} forEach _nearByLogics;

		_isPlayer = isPlayer _unit; // To enable ppEffects and sounds only for players with mine detectors.
		_withMineDetector = "MineDetector" in (items _unit); // To enable ppEffects and sounds only for players with mine detectors.

		// VISUAL AND ACOUSTICAL CLUES

		// Show / Remove BIO Icon
		if (_inBIOHazard) then {
			//  Check if unit has been within hazard area in the last iteration.
			if (!(_unit getVariable ["SURF_inBIOHazard", false]) && _isPlayer) then {
				if (_withMineDetector) then {
					//////////// PLAYING SOUND HERE /////////
					_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
					_soundToPlay = _soundPath + "sounds\bio.ogg";
					playSound3d [_soundToPlay, _UNIT];
					42 cutRsc ["SURF_RSC_BIO", "PLAIN"]; // Fade in icon - 42 = layer
				};


				/////////// ppEFFECT COLORCORRECTIONS HERE
				_myPPEffect = ppEffectCreate ["ColorCorrections", 2004];
				_myPPEffect ppEffectEnable true;
				_myPPEffect ppEffectAdjust [0.5, 1.4, 0,[0.9,0.6,0.3,0.2],[0.9,0.6,0.3,1],[0.9,0.6,0.3,1]];
				_myPPEffect ppEffectCommit 10;
				_unit setVariable ["PPEffectBIO", _myPPEffect]; // Speichern

				_myPPChrome = ppEffectCreate ["ChromAberration", 501];
				_myPPChrome ppEffectEnable true;
				_myPPChrome ppEffectAdjust [0.05, 0, 0.05];
				_myPPChrome ppEffectCommit 10;
				_unit setVariable ["PPEffectChrome", _myPPChrome]; // Speichern
			};
		} else {
			//  Check if unit has been within hazard area in the last iteration.
			if (_unit getVariable ["SURF_inBIOHazard", false] && _isPlayer) then {
				if (_withMineDetector) then {
					42 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 42 with empty text...
				};

				_myPPEffect = _unit getVariable "PPEffectBIO";
				_myPPEffect ppEffectAdjust [1, 1, 0,[0.0,0.0,0.0,0],[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]];
				_myPPEffect ppEffectCommit 10;

				_myPPChrome = _unit getVariable "PPEffectChrome";
				_myPPChrome ppEffectAdjust [0.0, 0, 0.0];
				_myPPChrome ppEffectCommit 10;
			};
		};

		// Show / Remove CHEM Icon
		if (_inCHEMHazard) then {
			//  Check if unit has been within hazard area in the last iteration.
			if (!(_unit getVariable ["SURF_inCHEMHazard", false]) && _isPlayer) then {
				if (_withMineDetector) then {
					43 cutRsc ["SURF_RSC_CHEM", "PLAIN"]; // Fade in icon - 43 = layer
				};

				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\chem.ogg";
				playSound3D [_soundToPlay, _UNIT];                   //TODO: EMMIT SOUND FROM CENTER OF THIS ZONE!


				/////////// ppEFFECT BLUR HERE
				_myPPEffect = ppEffectCreate ["DynamicBlur", 401];
				_myPPEffect ppEffectEnable true;
				_myPPEffect ppEffectAdjust [0.7];
				_myPPEffect ppEffectCommit 10;
				_unit setVariable ["PPEffectCHEM", _myPPEffect];

				addCamShake [15, 30, 0.4];
			};
		} else {

			//  Check if unit has been within hazard area in the last iteration.
			if (_unit getVariable ["SURF_inCHEMHazard", false] && _isPlayer) then {
				if (_withMineDetector) then {
					43 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 43 with empty text...
				};

				_myPPEffect = _unit getVariable "PPEffectCHEM";
				_myPPEffect ppEffectAdjust [0];
				_myPPEffect ppEffectCommit 10;
			};
		};

		// Show / Remove RAD Icon
		if (_inRADHazard) then {
			//  Check if unit has been within hazard area in the last iteration.
			if (!(_unit getVariable ["SURF_inRADHazard", false]) && _isPlayer) then {
				if (_withMineDetector) then {
					//////////// PLAYING SOUND HERE /////////
					_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
					_soundToPlay = _soundPath + "sounds\geiger.ogg";
					playSound3D [_soundToPlay, _UNIT];

					44 cutRsc ["SURF_RSC_RAD", "PLAIN"]; // Fade in icon - 44 = layer
				};

				/////////// ppEFFECT GRAIN HERE

				_myPPEffectGrain = ppEffectCreate ["filmGrain", 2001];
				_myPPEffectGrain ppEffectEnable true;
				_myPPEffectGrain ppEffectAdjust [0.05, 0, 1, 1, 1, true];
				_myPPEffectGrain ppEffectCommit 10;
				_unit setVariable ["PPEffectGrain", _myPPEffectGrain];

				_myPPEffect = ppEffectCreate ["ColorCorrections", 2006];
				_myPPEffect ppEffectEnable true;
				_myPPEffect ppEffectAdjust [0.9, 1.2, 0, [0.5,0.5,0.5,0],[0.5,0.5,0.5,0],[0.5,0.5,0.5,0]];
				_myPPEffect ppEffectCommit 16;
				_unit setVariable ["PPEffectColor", _myPPEffect];
			};
		} else {
			//  Check if unit has been within hazard area in the last iteration.
			if (_unit getVariable ["SURF_inRADHazard", false] && _isPlayer) then {
				if (_withMineDetector) then {
					44 cutText ["", "PLAIN"]; // Fade out icon / replace icon on layer 44 with empty text...
				};

				_myPPEffectGrain = _unit getVariable "PPEffectGrain";
				_myPPEffectGrain ppEffectAdjust [0.00, 0, 50, 1, 1, true];
				_myPPEffectGrain ppEffectCommit 10;

				_myPPEffect = _unit getVariable "PPEffectColor";
				_myPPEffect ppEffectAdjust [1, 1, 0,[0.0,0.0,0.0,0],[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]];
				_myPPEffect ppEffectCommit 10;
			};
		};

		// FREEZER ANOMALY
		if (!isNil "_inFREEZER") then {
			//  Check if unit has been within FREEZER in the last iteration.
			_temp = _unit getVariable ["SURF_inFREEZER", nil];
			if (isNil "_temp") then {
				//////////// PLAYING SOUND HERE /////////
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\S_freezing.ogg";
				playSound3D [_soundToPlay, _UNIT];
			};

			_flrObj = _inFREEZER getVariable ["SURF_FlareObject", ObjNull];
			_flrObj2 = _inFREEZER getVariable ["SURF_FlareObject2", ObjNull];


			if (isNull _flrObj) then {

				enableCamShake true;
				addCamShake [0.6, 120, 10];

				_flrObj2 = "#particleSource" createVehicle (_inFREEZER ModelToWorld [0,0,0]);
				_flrObj2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d",1,0,1,0],"", "Billboard", 6, 8, [0,0,6], [0,0,-3],1,3,0.1,1, [0.12,0.12], [[1,1,1,0.4],[1,1,1,0.4]], [1.5,0.5],  0.01, 0.28, "", "", _flrObj2, 0, false,  -1,[[1,1,1,1]]];
				_flrObj2 setParticleRandom [0, [30,30,4], [0, 0, 0], 1, 0, [0,0,0,0], 0, 0];
				_flrObj2 setDropInterval 0.004;

				_inFREEZER setVariable ["SURF_FlareObject2", _flrObj2];

				_flrObj = "F_20mm_White" createVehicle (_inFREEZER ModelToWorld [0,0,1.5]);
				_inFREEZER setVariable ["SURF_FlareObject", _flrObj];

				sleep 23;
				deleteVehicle _flrObj2;

			};

			// Check if unit is already past safe zone (radius - safezone).
			if ((_unit distance _inFREEZER < ((_inFREEZER getVariable "SURF_Radius") - (_inFREEZER getVariable ["SURF_SafeZone", 7]))) && !(_unit getVariable ["SURF_WakeActionSet", false])) then {

				_Surf_randomsound = ["cough1.ogg"] call BIS_fnc_selectRandom;
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\" + _Surf_randomsound;
				playSound3D [_soundToPlay, _UNIT];

				//[[_unit, ["SURF_WakeActionSet", true]], "IP_fnc_setVariable", nil] call BIS_fnc_MP;
				_unit setVariable ["SURF_WakeActionSet", true, true];
				sleep 0.2;
				_unit enableSimulationGlobal false;
				_unit addAction ["<t color='#00FF00'>Move up!</t>", {(_this select 0) removeAction (_this select 2); (_this select 0); (_this select 0) enableSimulationGlobal true; (_this select 0) setVariable ["SURF_WakeActionSet", nil, true]; /*[[(_this select 0), ["SURF_WakeActionSet", nil]], "IP_fnc_setVariable", nil] call BIS_fnc_MP;*/}, nil, 6, true, true, "", "(_target != _this) && (true)"]; // ToDo: Adjust max distance (10). Last parameter is condition to show the action. //(_target distance _this <= 10)

				sleep 19;
				_unit enableSimulationGlobal true;
				_unit setVariable ["SURF_WakeActionSet", nil, true];
				_Surf_randomsound = ["player_ahgh.ogg"] call BIS_fnc_selectRandom;
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\" + _Surf_randomsound;
				playSound3D [_soundToPlay, _UNIT];

			};
		} else {
			//  Check if unit has been within FREEZER in the last iteration.
			_temp = _unit getVariable ["SURF_inFREEZER", nil];
			if (!isNil "_temp") then {

				resetCamShake;
				_unit setVariable ["SURF_WakeActionSet", nil, true];

				/* deleteVehicle _flrObj; */  // ToDo: Does not work yet!

			};
		};

		// TRIP ANOMALY
		if (!isNil "_inTRIP") then {
			//  Check if unit has been within TRIP in the last iteration.
			_temp = _unit getVariable ["SURF_inTRIP", nil];
			_tripped = _unit getVariable ["SURF_TRIPPED", nil];
			if (isNil "_temp") then {
				//////////// PLAYING SOUND HERE /////////   // this is what happens in the safe zone
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\Dripping_Reverse.ogg";
				playSound3D [_soundToPlay, _UNIT];
			};

			_flrObj = _inTRIP getVariable ["SURF_FlareObject", ObjNull];

			if (isNull _flrObj) then {

				_flrObj = _inTRIP getVariable ["SURF_FlareObject", ObjNull];

				_flrObj = "#particleSource" createVehicle (_inTRIP ModelToWorld [0,0,0]);
				_flrObj setParticleParams   [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1],"",  "Billboard", 1, 16.2, /*Position*/[0,0,2], /*MoveVelocity*/[0,0,0.2],1,1.30,1,1, /*Scale*/[8,8],    [[0,0,0,4],[0,0,0,0]],   [1.5,0.5],  0.01, 0.08, "", "", _flrObj, 0, true,  0.5,[[0,0,0,0]]];
				_flrObj setParticleRandom [0.05, [0,0,0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
				_flrObj setDropInterval 8;

				_inTRIP setVariable ["SURF_FlareObject", _flrObj];

			};


			// Check if unit is already past safe zone (radius - safezone).
			if ((_unit distance _inTRIP < ((_inTRIP getVariable "SURF_Radius") - (_inTRIP getVariable ["SURF_SafeZone", 12]))) && !(_unit getVariable ["SURF_TRIPPED", false])) then {
				_unit setVariable ["SURF_TRIPPED", true];
				_unit setVariable ["SURF_inTrip", true];   //TODO: delete if error

				//this is what happens when you step into the anomaly
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\TRIP.ogg";
				playSound3D [_soundToPlay, _UNIT];   //TODO: EMMIT SOUND FROM CENTER OF THIS ZONE!

				enableCamShake true;
				addCamShake [400, 120, 0.2];
				_myPPEffect = ppEffectCreate ["ColorInversion", 2501];
				_myPPEffect ppEffectEnable true;
				_myPPEffect ppEffectAdjust [0.8,0.4,0.2];
				_myPPEffect ppEffectCommit 10;

				_myPPChrome = ppEffectCreate ["ChromAberration", 501];
				_myPPChrome ppEffectEnable true;
				_myPPChrome ppEffectAdjust [0.4, 0, 0.4];
				_myPPChrome ppEffectCommit 10;

				_unit setVariable ["PPEffectTRIP1", _myPPEffect];
				_unit setVariable ["PPEffectTRIP2", _myPPChrome];

				sleep 3;
			};
		} else {
			// Check if unit has been within TRIP in the last iteration.
			_temp = _unit getVariable ["SURF_inTRIP", nil];
			_tripped = _unit getVariable ["SURF_TRIPPED", nil];
			if (!isNil "_tripped") then {
				_myPPEffect = _unit getVariable "PPEffectTRIP1";
				_myPPEffect ppEffectAdjust [0,0,0];            //TODO: undefined variable if you don't go beyond safe zone
				_myPPEffect ppEffectCommit 30;

				_myPPChrome = _unit getVariable "PPEffectTRIP2";
				_myPPChrome ppEffectAdjust [0,0,0];
				_myPPChrome ppEffectCommit 30;

				_unit setVariable ["SURF_inTrip", nil];
				_unit setVariable ["SURF_TRIPPED", nil];

				sleep 30;
				resetCamShake;
			};
		};

		// BLASTER ANOMALY
		if (!isNil "_inBLASTER") then {
			//  Check if unit has been within BLASTER in the last iteration.
			_temp = _unit getVariable ["SURF_inBLASTER", nil];
			_randomexplosion = "";
			_randomtime = 0.0;
			if (isNil "_temp") then {
				//////////// PLAYING SOUND HERE /////////
				_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				_soundToPlay = _soundPath + "sounds\bristeling.ogg";
				playSound3D [_soundToPlay, _UNIT];
			};

			_flrObj = _inBLASTER getVariable ["SURF_FlareObject", ObjNull];
			_flrObj2 = _inBLASTER getVariable ["SURF_FlareObject", ObjNull];

			if (isNull _flrObj) then {
				_flrObj = "#particleSource" createVehicle (_inBLASTER ModelToWorld [0,0,0]);
				_flrObj setParticleParams   [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1],"",  "Billboard", 6, 12, [0,0,-1], [0,0,2],1,1.30,1,0, [2,2],    [[0,0,0,0.5],[0,0,0,0]],   [1.5,0.5],  0.01, 0.08, "", "", _flrObj, 0, true,  0.5,[[0,0,0,0]]];
				_flrObj setParticleRandom [0.05, [23,23,0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
				_flrObj setDropInterval 0.0005;

				_flrObj2 = "#particleSource" createVehicle (_inBLASTER ModelToWorld [0,0,0]);
				_flrObj2 setParticleParams   [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,31,31],"",  "Billboard", 6, 12, [0,0,0.5], [0,0,13],0,0,1,1, [2,2],    [[1,1,1,0.9],[1,1,1,0.9]],   [0.7,0.7],  0, 0, "", "", _flrObj2, 0, false,  -1,[[1,1,1,1]]];
				_flrObj2 setParticleRandom [0, [2,2,0], [0, 0, 0], 0, 0.2, [0,0,0,0], 0, 0];
				_flrObj2 setDropInterval 0.1;

				_inBLASTER setVariable ["SURF_FlareObject", _flrObj];

				sleep 4;
				deleteVehicle _flrObj;
				deleteVehicle _flrObj2;
			};

			// Check if unit is already past safe zone (radius - safezone).
			if ((_unit distance _inBLASTER < ((_inBLASTER getVariable "SURF_Radius") - (_inBLASTER getVariable ["SURF_SafeZone", 12.5])))) then {
				_randomtime = [0.5,1,2,4,7] call BIS_fnc_selectRandom;
				sleep _randomtime;
				_randomexplosion = ["M_Titan_AT", "HelicopterExploSmall", "grenade", "grenade", "grenade", "grenade"] call BIS_fnc_selectRandom;
				_randomexplosion createVehicle (_inBLASTER ModelToWorld [0,0,0.15]);
			};


		};

		// Set for next iteration.
		_unit setVariable ["SURF_AffectingLogics", _affectingLogics, true];
		_unit setVariable ["SURF_inBIOHazard", _inBIOHazard, true];
		_unit setVariable ["SURF_inCHEMHazard", _inCHEMHazard, true];
		_unit setVariable ["SURF_inRADHazard", _inRADHazard, true];

		if (isNil "_inFREEZER") then {_unit setVariable ["SURF_inFREEZER", nil, true]} else {_unit setVariable ["SURF_inFREEZER", _inFREEZER, true]};
		if (isNil "_inBLASTER") then {_unit setVariable ["SURF_inBLASTER", nil, true]} else {_unit setVariable ["SURF_inBLASTER", _inBLASTER, true]};
		if (isNil "_inTRIP") then {_unit setVariable ["SURF_inTRIP", nil, true]} else {_unit setVariable ["SURF_inTRIP", _inTRIP, true]};

		// Apply damage - Instant kill after 90% damage - ToDo: adjust!
		//if ((side _unit) != EAST) then {
		if (!IP_TESTMODE) then {
			_damage = damage _unit;
			if (_damage > 0.9) then {
				_unit setDamage 1;
			} else {
				_health = 1 - _damage;
				_add = _health * _damageFactor;
				_unit setDamage (_damage + _add);
			};
		};

		if (isPlayer _unit) then {
			if ((IP_AcidRain) && {rain > 0.8} && {(vehicle _unit) == _unit} && {count(lineIntersectsObjs [(getposASL _unit), [(getposASL _unit select 0),(getposASL _unit select 1),((getposASL _unit select 2) + 20)]]) == 0}) then {
				_damage = damage _unit;
				if (_damage > 0.9) then {
					_unit setDamage 1;
				} else {
					_Surf_randomsound = ["acid1.ogg","acid2.ogg","acid3.ogg","player_urgh.ogg","player_ahgh.ogg","acid2.ogg",""] call BIS_fnc_selectRandom;
					_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
					_soundToPlay = _soundPath + "sounds\" + _Surf_randomsound;
					playSound3D [_soundToPlay, _UNIT];
					_health = 1 - _damage;
					_add = _health * 0.01;
					if (!IP_TESTMODE) then {_unit setDamage (_damage + _add)};
				};
			};

			if ((IP_ToxicFog) && {fog > 0.8} && {(vehicle _unit) == _unit} && {!((headgear _unit) in _protectingHeadgear)} && {!((goggles _unit) in _protectingGoggles)}) then {
				_damage = damage _unit;
				if (_damage > 0.9) then {
					_unit setDamage 1;
				} else {
					_Surf_randomsound = ["cough1.ogg","cough2.ogg","cough3.ogg","cough4.ogg","cough5.ogg","","","","",""] call BIS_fnc_selectRandom;
					_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
					_soundToPlay = _soundPath + "sounds\" + _Surf_randomsound;
					playSound3D [_soundToPlay, _UNIT];
					_health = 1 - _damage;
					_add = _health * 0.01;
					if (!IP_TESTMODE) then {_unit setDamage (_damage + _add)};
				};
			};
		};

		// Run this loop every X seconds.
		sleep 1; // ToDo: Adjust!
	};

	IP_HazardTrackerRunning = nil;
};