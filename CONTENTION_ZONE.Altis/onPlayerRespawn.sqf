// TESTMODE
if (IP_TESTMODE) then {player allowDamage false};

if (isNil "IP_PlayerRespawnFirstRun") exitWith {IP_PlayerRespawnFirstRun = true};

//INITIAL COLORS
_myPPEffect = ppEffectCreate ["ColorCorrections", 2000];
_myPPEffect ppEffectEnable true;
_myPPEffect ppEffectAdjust SURFERS_CHOSENCOLOR;
_myPPEffect ppEffectCommit 0;

enableEnvironment false;

[player, "ambient", IP_AmbientChatterSentences, "missionConversations\sentences.bikb"] call IP_fnc_ambientChatterKB; // Parameter: _receiver - player, _topic - "ambient", _sentences - [], _bikb - "missionConversations\sentences.bikb", _radius - 5, _cycle - 1, _sides - [civilian, west];
[(_this select 0)] call IP_fnc_createFreezoner;

[] spawn {
	waitUntil {isNil "IP_HazardTrackerRunning"};
	[] call IP_fnc_hazardTracker;
};