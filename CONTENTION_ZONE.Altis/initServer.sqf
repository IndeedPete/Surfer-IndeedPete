// Variables
IP_TESTMODE = false; // unsterblichkeit etc
SURF_TestMode = false; // Testmode - ATM just for hazard area markers.
SurfersOldFog = [0.35,0.02,0];
initDate = date;
SurfersTransitionTime = 5 * 60;
SURF_strobeOninterval1 = 0.03;  // FREQUENCY OF STROBE ON
SURF_strobeOffinterval1 = 0.1; // FREQUENCY OF STROBE OFF
SURF_strobeBrightness1 = 0.12;    // GUESS WHAT

if (isMultiplayer) then {
	[] call IP_fnc_assignParameters;
};

// Communicate dem vars
{publicVariable _x} forEach ["IP_TESTMODE", "SURF_TestMode", "SurfersOldFog", "initDate", "SurfersTransitionTime", "SURF_strobeBrightness1"];

// Characters
_Surfers_Blue_Uniforms = ["U_BG_Guerilla3_2","U_BG_Guerilla3_1","U_BG_Guerilla2_3","U_BG_Guerilla2_2","U_BG_Guerilla2_1"];
_Surfers_Blue_Headgears = ["H_Watchcap_camo","H_Shemag_olive_hs","H_Booniehat_dirty","H_Cap_oli","H_ShemagOpen_khk","","","",""];
_Surfers_Goggles = ["G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades","G_Combat", "G_Balaclava_combat","G_Balaclava_blk"];
_Surfers_Civilian_Uniforms = ["U_C_Scientist","U_C_WorkerCoveralls","U_C_HunterBody_grn","U_C_WorkerCoveralls"];

{
	if (!(_x isKindOf "ANIMAL") && !(isPlayer _x)) then {
		_x setVariable ["IP_AmbientChatter", true, true];
		_x setVariable ["IP_LiveFeed", true, true];

		if ((side _x) == WEST) then {
			[_x] call IP_fnc_createFreezoner;
		};

		if ((side _x) == EAST) then {
			[_x] call IP_fnc_createContentionMerc;
		};

		if ((side _x) == RESISTANCE) then {
			_x setObjectTextureGlobal [0,"images\GreenWar_clothing.paa"];
		};

		if ((side _x) == CIVILIAN) then {
			_x unlinkItem "itemGPS";
			_x unlinkItem "itemMap";

			_Surfers_Random = _Surfers_Civilian_Uniforms call BIS_fnc_selectRandom; // Pick random uniform
			removeUniform _x;
			_x addUniform _Surfers_Random;

			[_x, _Surfers_Blue_Headgears] spawn {
				waitUntil {time > 0};
				_Surfers_Random = (_this select 1) call BIS_fnc_selectRandom; // Pick random uniform
				removeHeadgear (_this select 0);
				(_this select 0) addHeadgear _Surfers_Random;
			};
		};
	};
} forEach (allUnits - [IP_Dealer, IP_Doctor, IP_Gravedigger, IP_Mechanic, IP_Rival, IP_ProfName, IP_Priest]);

#include "characterSetup.sqf"

// Mission
call(compileFinal(preProcessFileLineNumbers "missions\missions.sqf")); // Compile Main Mission Flows
if !(isMultiplayer) then {waitUntil {!(isNil "IP_ParametersAssigned") && {!(isNil "IP_IntroReturned")}}};
IP_RandomAnomalies call IP_fnc_hazardInit;

// Shop Setup - Server Side Call
if (isDedicated) then {
	[IP_AutoIndexing, IP_ModContentEnabled, [], [[],[],[]], true] call IP_fnc_shopInit;
};

// Cleanup if intro is skipped.
if !(IP_ShowIntro) then {
	{deleteVehicle _x} forEach ((crew S_waitingheli) + [IP_ProfName, S_mobile1, S_waitingheli, S_bunkerdoor1, S_bunkerdoor2]);
	IP_BreakOut = true;
};

//////////////////////////////////////////////////////////////////////////////////////
///////////////// POST INIT //////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

[] spawn IP_fnc_zombieTracker; // Parameter: _spawnDistance - 1500, _side - east, _animalRatio - 0.2, _skillRange - 0, _cycle - 3
[IP_BlowoutIntervall] spawn IP_fnc_blowoutController; // Parameter: _cycle - [300, 600], _radius - [250, 500]

if (IP_LootChance > 0) then {
	[] spawn {
		waitUntil {(time > 0) && {!(isNil "IP_ShopInitDone")} && {!IP_ShowIntro OR (IP_ShowIntro && {!(isNil "IP_BreakOut")})}};
		// [IP_LootChance, 1500, 1250, IP_TESTMODE] call IP_fnc_icemanLootGenerator; // Parameter: _chance - 5, _locSpread - 1500, _searchRad - 1250, _debug - false;
		[300, IP_LootChance, 30, {true}, [ss_house1, carservice1]] spawn IP_fnc_lootGenerator; // Parameter: _radius, _chance, _cycle, _condition, _blacklistedObjects, _blacklistedClasses, _boxClasses, _maxMagCount, _poolProbabilities, _weapons, _magazines, _items
	};
};

////////////////// RAIN
[] spawn {
	if (IP_ShowIntro) then {waitUntil {!(isNil "IP_BreakOut")}};

	while {true} do {
		_Surf_randomwait = 180 + (random 300);
		sleep _Surf_randomwait;
		playSound "S_rain";
		[[10, 1], "IP_fnc_setRain"] call BIS_fnc_MP;

		_Surf_randomwait = 30 + (random 25);
		sleep _Surf_randomwait;
		[[10, 0], "IP_fnc_setRain"] call BIS_fnc_MP;
	};
};


////////////////// FOG
[] spawn {
	if (IP_ShowIntro) then {waitUntil {!(isNil "IP_BreakOut")}};

	while {true} do {
		_Surf_randomwait = 5 * 60 + (random 300);
		sleep _Surf_randomwait;
		[[10, 1], "IP_fnc_setFog"] call BIS_fnc_MP;

		_Surf_randomwait = 20 + (random 10);
		sleep _Surf_randomwait;
		[[10, 0.54], "IP_fnc_setFog"] call BIS_fnc_MP;
	};
};

// STROBE LIGHT
[] spawn {
	while {isNil "IP_BreakOut"} do {
		[[MyStrobe, SURF_strobeBrightness1], "setLightBrightness"] call BIS_fnc_MP;
		sleep SURF_strobeOninterval1;

		[[MyStrobe, 0], "setLightBrightness"] call BIS_fnc_MP;
		sleep SURF_strobeOffinterval1;
		randomIntervalStrobe1 = [0.03, 0.19, 1.1] call BIS_fnc_selectRandom;

		sleep randomIntervalStrobe1;
	};
};

// Music
[] spawn {
	_music = ["S_helpme", "S_Xenomorph", "S_GetOut","LSD","choirs","phase1","Noisy","scorcher_theme", "traumphase1"];
	if (IP_ShowIntro) then {waitUntil {!(isNil "IP_BreakOut")}};

	while {true} do {
	   _randomTrack = _music call BIS_fnc_selectRandom; // Pick random track
	   [_randomTrack, "playMusic"] call BIS_fnc_MP;
	   sleep 520;
	};
};