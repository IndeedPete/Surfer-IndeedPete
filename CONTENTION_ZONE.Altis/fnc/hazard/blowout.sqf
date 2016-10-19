#define LIGHTNING [_blowoutPos] call IP_fnc_lightning;

private ["_blowoutPos", "_oldFog", "_ppBlowoutColor", "_ppColorChrome"];
_blowoutPos = [_this, 0, [0, 0, 0], [[]]] call BIS_fnc_param;
if (count _blowoutPos == 2) then {_blowoutPos pushBack 0};
//_oldFog = fog;

sleep 20;

//START BLOWOUT
if (IP_TESTMODE) then {systemChat (format ["Blowout started at %1, %2 metres from player, dir %3.", _blowoutPos, (player distance _blowoutPos), ([player, _blowoutPos] call BIS_fnc_dirTo)])};


LIGHTNING

_ppBlowoutColor = ppEffectCreate ["ColorCorrections", 2003];
_ppBlowoutColor ppEffectEnable true;
_ppBlowoutColor ppEffectAdjust SURFERS_BLOWOUT;
_ppBlowoutColor ppEffectCommit 20;

sleep 8;
LIGHTNING

sleep 4;
LIGHTNING

playSound "blowout";

//STARTING THE PPEFFECT IN THE SKY

_S_blowoutfire3_handle = "#particleSource" createVehicle (_blowoutPos);
_S_blowoutfire3_handle setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,32],"", "Billboard", 1, 30, [0,0,300], [0,0,0],0,0,1,1, [50,50],[[1,1,1,0.15],[1,1,1,1]], [0.8,0.8], 0, 0, "", "", _blowoutPos, 3.3, true,  -1,[[1,1,1,1]]];
_S_blowoutfire3_handle setParticleRandom [2, [300,300,0], [0, 0, 0], 0, 1.2, [0,0,0,0], 0, 0];
_S_blowoutfire3_handle setDropInterval 0.05;


sleep 2;
LIGHTNING


sleep 5;
LIGHTNING

sleep 4;

LIGHTNING
addCamShake [3, 3, 20];
if (isServer) then {setWind [6, 6, true]};

//CHROMATIC ABBERATION
_ppColorChrome = ppEffectCreate ["ChromAberration", 501];
_ppColorChrome ppEffectEnable true;
_ppColorChrome ppEffectAdjust [0.1, 0.05, 0.05];
_ppColorChrome ppEffectCommit 15;

sleep 9;
LIGHTNING

sleep 2;
LIGHTNING

sleep 8;

LIGHTNING
addCamShake [20, 180, 0.5];
if (isServer) then {setWind [10, 10, true]};

sleep 5;
LIGHTNING

titleCut ["", "BLACK OUT", 8];
//25 setFog 1;
sleep 2;
LIGHTNING
sleep 3;
LIGHTNING
sleep 3;
LIGHTNING
deleteVehicle _S_blowoutfire3_handle;

sleep 6;

LIGHTNING

sleep 0.4;

/// MIDDLE OF BLOWOUT!!!
/// DAMAGES BY BLOWOUT
if (!(IP_TESTMODE) && {count(lineIntersectsObjs [(getposASL player), [(getposASL player select 0), (getposASL player select 1),((getposASL player select 2) + 20)]]) == 0}) then {
	player unlinkItem "NVgoggles";
	player unlinkItem "itemGPS";
};



LIGHTNING

sleep 1;

LIGHTNING

sleep 0.5;

LIGHTNING

sleep 1;

LIGHTNING

sleep 2;

LIGHTNING

sleep 10;


//END OF BLOWOUT
if (isServer) then {setWind [0, 0, true]};
titleCut ["", "BLACK IN", 20];
//30 setFog _oldFog;

sleep 15;

_ppColorChrome ppEffectAdjust [0, 0, 0];
_ppColorChrome ppEffectCommit 20;

sleep 10;

_ppBlowoutColor ppEffectAdjust [1.0, 1.0, 0.0, [0,0,0,0], [0,0,0,1],  [0,0,0,0]];
_ppBlowoutColor ppEffectCommit 30;