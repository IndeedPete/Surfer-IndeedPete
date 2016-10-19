// Weather & Date
1 setFog SurfersOldFog;
setWind [0, 0, true];

//INITIAL COLORS
_myPPEffect = ppEffectCreate ["ColorCorrections", 2000];
_myPPEffect ppEffectEnable true;
_myPPEffect ppEffectAdjust SURFERS_CHOSENCOLOR;
_myPPEffect ppEffectCommit 0;

// Music
IP_Music = [];
{
	IP_Music pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "CfgMusic"));
playMusic (IP_Music call BIS_fnc_selectRandom);

IP_MusicEH = addMusicEventHandler ["MusicStop", {
	_last = _this select 0;
	_tracks = IP_Music - [_last];
	_track = _tracks call BIS_fnc_selectRandom;
	playMusic _track;
}];

// Day or Night Start (Irrelevant, since overwritten on actual mission start.)
_myTimeOfDay = ppEffectCreate ["ColorCorrections", 2009];
_myTimeOfDay ppEffectEnable true;

if (random 1 > 0.5) then { 
	_myTimeOfDay ppEffectAdjust [1.0, 1.0, 0.0, [0,0,0,0], [0,0,0,1], [0,0,0,0]];
	_myTimeOfDay ppEffectCommit 0;
} else {
	_myTimeOfDay ppEffectAdjust [0.9, 1.35, -0.32, [0.8,0.8,0.8,0],[0.8,0.8,0.8,0.5],[0.8,0.8,0.8,0]];
	_myTimeOfDay ppEffectCommit 0;
};

// Cutscene Start
#define CUTIN ["IP_BlackScreen", true, 0.5] call IP_fnc_blackIn;
#define CUTOUT ["IP_BlackScreen", true, 0.5] call IP_fnc_blackOut;
#define CHECK if !(isNil "IP_ParametersAssigned") then {breakOut "cutscene"};

_camera = "camera" camCreate (getPos player);
_camera cameraEffect ["internal", "back"];

while {isNil "IP_ParametersAssigned"} do {
	if (true) then {
		scopeName "cutscene";	
		
		// Scrapyard
		waitUntil {preloadCamera [15435.29,15779.71,8.23]};
		
		_camera camPrepareTarget [-70.96,114548.20,-2075.23];
		_camera camPreparePos [15435.29,15779.71,8.23];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [69223.51,100059.32,-242.90];
		_camera camPreparePos [15390.56,15786.22,8.23];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [16033.74,115854.50,-243.06];
		_camera camPreparePos [15421.05,15856.69,3.88];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [-196.21,114702.91,-243.24];
		_camera camPreparePos [15419.34,15937.78,3.63];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 20;

		waitUntil {camCommitted _camera};
		CHECK
		CUTOUT
		
		// NPP
		waitUntil {preloadCamera [16425.84,15657.41,108.96]};
		
		_camera camPrepareTarget [-4499.64,109196.95,-28394.06];
		_camera camPreparePos [16425.84,15657.41,108.96];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [-5193.69,112299.39,-13078.16];
		_camera camPreparePos [16448.67,15555.21,52.89];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [60397.64,105353.33,3554.58];
		_camera camPreparePos [16301.40,15671.01,4.38];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;

		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [70385.41,99986.59,3562.57];
		_camera camPreparePos [16408.98,15883.84,1.78];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;
		
		waitUntil {camCommitted _camera};
		CHECK		
		CUTOUT
		
		// Dam
		waitUntil {preloadCamera [12731.67,16685.57,20.76]};
		
		_camera camPrepareTarget [-68979.53,-39024.52,-14722.19];
		_camera camPreparePos [12731.67,16685.57,20.76];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [-68979.53,-39024.52,-14722.19];
		_camera camPreparePos [11646.99,16720.48,47.46];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 30;
		
		waitUntil {camCommitted _camera};
		CHECK		
		CUTOUT
		
		// Monolith
		waitUntil {preloadCamera [10726.33,17437.53,108.33]};
		
		_camera camPrepareTarget [65644.93,96911.59,-25622.45];
		_camera camPreparePos [10726.33,17437.53,108.33];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [-46982.62,94813.95,-25622.46];
		_camera camPreparePos [10888.16,17463.10,105.57];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 15;

		waitUntil {camCommitted _camera};
		CHECK		
		CUTOUT
		
		// Needle
		waitUntil {preloadCamera [17975.73,19156.62,2.49]};
		
		_camera camPrepareTarget [116809.42,29625.24,11073.89];
		_camera camPreparePos [17975.73,19156.62,2.49];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [-9894.89,93648.56,-60270.25];
		_camera camPreparePos [18140.07,19083.73,178.70];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 20;
		
		waitUntil {camCommitted _camera};
		CHECK		
		CUTOUT
		
		// Agrocon
		waitUntil {preloadCamera [17557.59,18152.63,4.63]};
		
		_camera camPrepareTarget [-64141.91,-38547.84,10511.66];
		_camera camPreparePos [17557.59,18152.63,4.63];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [-63767.58,-39724.12,-9759.00];
		_camera camPreparePos [17307.24,17974.74,95.87];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 20;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [11537.44,16358.69,-99758.63];
		_camera camPreparePos [17279.53,17958.55,96.00];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 5;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [-79051.20,-8881.11,-147.09];
		_camera camPreparePos [17279.53,17958.55,2.40];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 10;
		
		waitUntil {camCommitted _camera};
		CHECK
		CUTOUT
		
		// Ground Zero
		waitUntil {preloadCamera [23350.98,18347.49,32.72]};
		
		_camera camPrepareTarget [67062.09,-70702.95,-12587.85];
		_camera camPreparePos [23350.98,18347.49,32.72];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 0;
		
		CUTIN
		CHECK
		
		_camera camPrepareTarget [67433.84,-71460.31,615.99];
		_camera camPreparePos [23371.43,18305.85,3.10];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 10;
		
		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [65609.68,-67744.06,29417.33];
		_camera camPreparePos [23494.68,18054.08,3.10];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 30;

		waitUntil {camCommitted _camera};
		CHECK
		
		_camera camPrepareTarget [22989.11,17191.33,100275.85];
		_camera camPreparePos [23494.70,18054.07,280.80];
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared 20;
		
		waitUntil {camCommitted _camera};
		CHECK
		CUTOUT
	};
	
	CUTOUT
	sleep 0.5;
};

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

removeMusicEventHandler ["MusicStop", IP_MusicEH];
playMusic "";