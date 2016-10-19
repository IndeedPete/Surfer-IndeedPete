#define LIGHTNING [_blowoutPos] call IP_fnc_lightning;
 
private ["_blowoutPos", "_oldFog", "_ppBlowoutColor", "_ppColorChrome"];
_blowoutPos = [_this, 0, [0, 0, 0], [[]]] call BIS_fnc_param;
if (count _blowoutPos == 2) then {_blowoutPos pushBack 0};
//_oldFog = fog;

//START BLOWOUT
if (IP_TESTMODE) then {systemChat (format ["Blowout started at %1, %2 metres from player, dir %3.", _blowoutPos, (player distance _blowoutPos), ([player, _blowoutPos] call BIS_fnc_dirTo)])};

sleep 5;

_ppBlowoutColor = ppEffectCreate ["ColorCorrections", 2000];
_ppBlowoutColor ppEffectEnable true;
_ppBlowoutColor ppEffectAdjust SURFERS_GREEN;
_ppBlowoutColor ppEffectCommit 15;

sleep 30;

LIGHTNING
addCamShake [3, 3, 20];
if (isServer) then {setWind [6, 6, true]};

sleep 7;

LIGHTNING
addCamShake [20, 180, 0.5];
if (isServer) then {setWind [10, 10, true]};

sleep 5;

//CHROMATIC ABBERATION
_ppColorChrome = ppEffectCreate ["ChromAberration", 501];
_ppColorChrome ppEffectEnable true;
_ppColorChrome ppEffectAdjust [0.05, 0, 0.05];
_ppColorChrome ppEffectCommit 10;
titleCut ["", "BLACK OUT", 40];
//25 setFog 1;

sleep 6;

playSound "blowout";

sleep 14;

LIGHTNING

sleep 10;

LIGHTNING

sleep 5;

LIGHTNING

sleep 3;

LIGHTNING

sleep 1;

LIGHTNING

sleep 0.5;

LIGHTNING

sleep 1;

LIGHTNING

sleep 0.5;

/// MIDDLE OF BLOWOUT!!!
/// DAMAGES BY BLOWOUT
if (!(IP_TESTMODE) && {count(lineIntersectsObjs [(getposASL player), [(getposASL player select 0), (getposASL player select 1),((getposASL player select 2) + 20)]]) == 0}) then {
	player unlinkItem "NVgoggles";
	player unlinkItem "itemGPS";
};

LIGHTNING

sleep 1;

LIGHTNING

sleep 2;

LIGHTNING

sleep 5;

LIGHTNING

sleep 3;

LIGHTNING

sleep 8;

//END OF BLOWOUT
if (isServer) then {setWind [0, 0, true]};
titleCut ["", "BLACK IN", 30];
//30 setFog _oldFog;

sleep 5;

_ppColorChrome ppEffectAdjust [0, 0, 0];
_ppColorChrome ppEffectCommit 20;

sleep 20;

_ppBlowoutColor ppEffectAdjust SURFERS_CHOSENCOLOR;
_ppBlowoutColor ppEffectCommit 30;