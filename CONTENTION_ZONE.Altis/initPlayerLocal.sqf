// Vars
_configs = "getNumber(_x >> 'ambient') == 1" configClasses (missionConfigFile >> "Sentences");
IP_AmbientChatterSentences = [];
{IP_AmbientChatterSentences pushBack (configName _x)} forEach _configs;
IP_EnableEnvironment = false;
IP_ShowIntro = true;

// COLORS
SURFERS_CHOSENCOLOR = [];
SURFERS_CLEARCOLOR = [1.0, 1.0, 0.0, [0,0,0,0], [0,0,0,1],  [0,0,0,0]];
SURFERS_BLOWOUT = [0.5, 1, 0.0, [0.99, 0.0, 0.0, 0.2], [0.9, 0.3, 0.0, 0.8],  [0.5, 0.5, 0.5, 0.5]];
SURFERS_GREEN = [0.95, 1.55, 0, [0.8, 1, 0.8, 0.02], [1.3, 1.1, 0.2, 0.5],  [0.8, 0.7, 0.1, 1]];
// SURFERS_GREEN = [1.0, 1.6, 0.0, [1.1, 0.9, 0.8, 0.05], [1.2, 1.0, 0.2, 0.4],  [0.199, 0.587, 0.114, 0.0]];
SURFERS_BLUE = [1.0, 1.0, 0.0, [0.0, 0.0, 0.0, 0.0], [0.0, 0.5, 0.7, 0.7],  [0.199, 0.587, 0.114, 0.0]];
SURFERS_BROWN = [1.0, 1.0, 0.0, [0.9, 0.2, 0.0, 0.2], [0.98, 0.3, 0.0, 0.6],  [0.8, 0.1, 0.1, 0.0]];
SURFERS_SAND = [1.0, 1.0, 0.0, [0.99, 0.3, 0.1, 0.15], [0.99, 0.3, 0.1, 0.9],  [0.8, 0.1, 0.1, 0.0]];
SURFERS_PINK = [0.9, 2, 0.0, [0.99, 0.3, 0.0, 0.2], [0.9, 0.3, 0.0, 0.8],  [0.5, 0.5, 0.5, 0.5]];
SURFERS_BRIGHT = [0.9, 2, 0.3, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 1],  [0.5, 0.5, 0.5, 0.5]];
SURFERS_DARK = [1, 1.35, -0.32, [0.8,0.8,0.8,0],[0.8,0.8,0.8,0.5],[0.8,0.8,0.8,0]];
SURFERS_test = [0.4, 1, 0.0, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 1],  [0.5, 0.5, 0.5, 0.5]];

SURFERS_CHOSENCOLOR = SURFERS_GREEN;

//player createDiarySubject ["MessageLog", "MessageLog"];
player createDiarySubject ["CONTENTION", "CONTENTION"];
player createDiarySubject ["GREENWAR", "GREENWAR"];
player createDiarySubject ["FREEZONERS", "FREEZONERS"];
player createDiarySubject ["THE ZONE", "THE ZONE"];
player createDiarySubject ["ANOMALIES", "ANOMALIES"];

player createDiaryRecord ["CONTENTION", ["", "<br/><img image='images\contention_flag512.paa' width='256' height='128'/><br/><br/>CONTENTION is a multinational company that is mainly originating of the former us-american biotech company ALEXION, the iranian HESA and the russian ATOMOGORSK.<br/><br/>The company has been founded in 2014 and has since then gained a reputation as one of the most groundbreaking biomilitary companies worldwide. Little is know about their main areas of operation but their numbers are increasing with turnovers in the billions. <br/><br/>The company's private armed forces have served during the first eurowars and are considered to be among the largest private armies these days."]];
player createDiaryRecord ["GREENWAR", ["", "<br/><img image='images\greenwar_flag512.paa' width='256' height='128'/><br/><br/>GREENWAR is an eco-terrorist organisation, fighting against environmental pollution by nations and companies worldwide. They have a reputation as modern Robin Hoods but it has become very quiet about them since the latest allegiations of killing members of the  supervisory council of Tepco International."]];
player createDiaryRecord ["FREEZONERS", ["", "<br/><img image='images\FREEZONERS.paa' width='256' height='128'/><br/><br/>FREEZONERS either live in the zone by choice or are forced by financial circumstances or the government. They salvage what the zone has to offer and try to stay out of the way of the other factions."]];
player createDiaryRecord ["THE ZONE", ["", "<br/>THE ZONE is what's left after Altis became a nuclear battlefield during the last days of the Eurowars. Since then the face of Altis has changed. The once blue skies are now covered with a thick toxic mist, the former fertile grounds suffer of radioactive contamination. And other even more deadly hazards have appeared. No one could tell if they have been accidents, intentionally created or if they resulted from the heavy punishment of the island. Those who got into contact and survived called them anomalies. Powerful electrical emissions break from the sky and never seen before physical anomalies rage the land.<br/>"]];
player createDiaryRecord ["ANOMALIES", ["", "<br/>BLOWOUT<br/><img image='images\Blowout_edit.paa' width='256' height='128'/><br/>Blowouts are the most powerful form of energy emissions: They build up with the sky turning red and result in heavy thunderstorms with EMPs that can destroy most electrical equipment.<br/><br/>FREEZER<br/><img image='images\freezer.paa' width='256' height='128'/><br/>One of the dangerous anomalies is the FREEZER: It manifests as a glowing sphere of light, hovering close to the ground. This frozen orb is cooling down its surrounding area to subzero degrees, often accompanied by snow or blizzards. It can freeze you in place so be careful!<br/><br/>BLASTER<br/><img image='images\blaster.paa' width='256' height='128'/><br/>The BLASTER is a zone of extreme thermodynamic instability. Scientists say it is dragging energy from all life close enough. Once an amount of energy is withdrawn it will combust in a deadly explosion.<br/><br/>TRIP<br/><img image='images\trip.paa' width='256' height='128'/><br/>If you ever happen to run into a TRIP anomaly you will most definitely know it. Experienced FREEZONERS compared the effect of the anomaly to a good acid trip multiplied by 1000. However some less experienced zoners died because they didn't find their way out of the TRIP anomaly."]];

// Parameters
["IP_BlackScreen", false] call IP_fnc_blackOut;
if !(isMultiplayer) then {{deleteVehicle _x} forEach ((units(group player)) - [player])};
player enableSimulation false;
if (isMultiplayer) then {
	[] call IP_fnc_assignParameters;
} else {
	waitUntil {time > 0};
	enableEnvironment false;
	IP_LoadedEH = addMissionEventHandler ["Loaded", {
		enableEnvironment false;
	}];

	if (IP_ShowIntro) then {
		[] spawn {
			while {isNil "IP_ParametersAssigned"} do {
				[] call IP_fnc_openParamDialog;
				waitUntil {!dialog};
			};
		};

		// Fancy Cutscenes
		#include "paramCutscenes.hpp"
		sleep 0.5;
	} else { // Development Mode
		[0] call IP_fnc_openParamDialog;
		[2] call IP_fnc_openParamDialog;
		[] call IP_fnc_assignParameters;
		closeDialog 0;
	};

	IP_IntroReturned = true;
};

//////////////////////////////////////////////////////////////////////////////////////
///////////////// POST INIT //////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

{
	player setVariable _x;
} forEach [
	["IP_ShopMoney", IP_StartMoney], // Start Money
	["IP_ShopUniforms", []], // Uniform Classnames
	["IP_Avatar", "images\defaultAvatar.jpg", true], // Conv System Avatar Picture
	["IP_LiveFeed", true, true], // Conv Live Cam when possible
	["IP_Faction", "Freezoners", true], // Faction Identifier
	["IP_MissionsDone", [], true]
];

// Shop Setup - Client Side Call
[IP_AutoIndexing, IP_ModContentEnabled, ["Weapons", "Magazines", "Items", "Uniforms"], [[],[],[]], false, ["Box_NATO_Wps_F", [15331.6, 16105.5, 3.95283], -15.4642]] call IP_fnc_shopInit;
IP_LaptopShop addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/> Open Shop", {nul = [] spawn IP_fnc_openShop}];
//IP_StratMap addAction ["Open Strategic Map", {call IP_fnc_stratMap}];

// Player Setup
switch (IP_StartEquipment) do {
	case 0: {
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeAllContainers player;
		removeHeadgear player;
		removeGoggles player;
		player setVariable ["IP_Faction", "Freezoners", true];
	};

	case 1: {
		[player] call IP_fnc_createFreezoner;
		if (goggles player != "") then {removeGoggles player};
	};

	case 2: {
		_class = ["Rifleman", "Grenadier", "Autorifleman", "Marksman", "Teamleader"] call BIS_fnc_selectRandom;
		[player, _class] call IP_fnc_createMerc;
		player setVariable ["IP_Faction", "Freezoners", true];
	};
};

if (IP_TESTMODE) then {
	player addItem "acc_flashlight";
	player linkItem "ItemMap";
};

[] call IP_fnc_hazardTracker; // Call for player.
[] call IP_fnc_lightPointInit;
if !(isMultiplayer) then {
	[player, "ambient", IP_AmbientChatterSentences, "missionConversations\sentences.bikb", false] call IP_fnc_ambientChatterKB; // Parameter: _receiver - player, _topic - "ambient", _sentences - [], _bikb - "missionConversations\sentences.bikb", _subs - false _radius - 5, _cycle - 1, _sides - [civilian, west];
};

// Weather & Date
1 setFog SurfersOldFog;
setWind [0, 0, true];

[] spawn {
	setDate initDate;
	while {true} do {
		skipTime -(1/60);
		sleep 60;
	};
};

// DAY-NIGHT-CYCLE
[] spawn {
    _myTimeOfDay = ppEffectCreate ["ColorCorrections", 2009];
    _myTimeOfDay ppEffectEnable true;

	if (SURF_StartTime) then {
		_myTimeOfDay ppEffectAdjust [1.0, 1.0, 0.0, [0,0,0,0], [0,0,0,1], [0,0,0,0]];
		_myTimeOfDay ppEffectCommit 0;
	} else {
		_myTimeOfDay ppEffectAdjust [0.4, 0.8, 0.05, [-0.3,-0.3,0,0.1], [0,0,0,1], [0,0,-1,-1]];
		//[0.9, 1.35, -0.32, [0.8,0.8,0.8,0],[0.8,0.8,0.8,0.5],[0.8,0.8,0.8,0]];
		_myTimeOfDay ppEffectCommit 0;
		sleep SurfersNighttime;
	};

	while {true} do {
		/////// GETTING BRIGHTER
		_myTimeOfDay ppEffectAdjust [1.0, 1.0, 0.0, [0,0,0,0], [0,0,0,1], [0,0,0,0]];
		_myTimeOfDay ppEffectCommit SurfersTransitionTime;

		sleep SurfersDaytime;  /// LENGTH OF DAY

		/////// GETTING DARKER
		_myTimeOfDay ppEffectAdjust [0.4, 0.8, 0.05, [-0.3,-0.3,0,0.1], [0,0,0,1], [0,0,-1,-1]];
		//[0.9, 1.35, -0.32, [0.8,0.8,0.8,0],[0.8,0.8,0.8,0.5],[0.8,0.8,0.8,0]];
		_myTimeOfDay ppEffectCommit SurfersTransitionTime;

		sleep SurfersNighttime;   /// LENGHT OF NIGHT
	};
};

// First Scene
[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
	player enableSimulation true;

	//INITIAL COLORS
	_myPPEffect = ppEffectCreate ["ColorCorrections", 2000];
	_myPPEffect ppEffectEnable true;
	_myPPEffect ppEffectAdjust SURFERS_CHOSENCOLOR;
	_myPPEffect ppEffectCommit 0;

	if (IP_ShowIntro) then {
		//["IP_BlackScreen", false] call BIS_fnc_blackOut;
		player unlinkItem "ItemRadio";
		[IP_GL_Ghost, "ghostStartOpener", player] call IP_fnc_addConversation;
		playMusic "lsd";

		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;

		40 cutText ["YOU WAKE UP.", "PLAIN"];
		sleep 5;
		40 cutText ["YOUR EYES NEED TO ADJUST TO THE DARKNESS.", "PLAIN"];
		sleep 5;
		40 cutText ["HOW DID YOU GET HERE?", "PLAIN"];
		["IP_BlackScreen", true, 20] call IP_fnc_blackIn;
		sleep 5;
		40 cutText ["", "PLAIN"];
		sleep 5;

		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 40;

		sleep 25;

		if !(isMultiplayer) then {
			[] spawn {
				private "_sentences";
				_rawSentences = ["intro"] call IP_fnc_getSentencesFromConversationKB; // ["over_here", "quick_we_dont_have_much_time", "shhh_over_here"]
				_sentences = [];

				{
					_sentences pushBack (_x select 1);
				} forEach _rawSentences;

				_lastSentence = "";

				while {!([player, "profStartOpener"] call IP_fnc_checkConvKey) && (isNil "IP_BreakOut")} do {
					_sentence = (_sentences - [_lastSentence]) call BIS_fnc_selectRandom;
					_lastSentence = _sentence;

					sleep 10;

					[IP_ProfName, player, "intro", _sentence, "DIRECT", "missionConversations\sentences.bikb", false] call IP_fnc_simpleSentenceKB;
				};
			};
		};

		[] spawn {
			waitUntil {(player distance IP_ProfName <= 3) OR !(isNil "IP_BreakOut")};
			if (player distance IP_ProfName <= 3) then {[["CZ", "Conversations"]] call BIS_fnc_advHint};
		};
	} else {
		player setPosATL [15411.6,16113.7,0.00145197]; // In front of Scrapyard.
		player setDir 250;
		[player, "Intro"] call IP_fnc_setMissionDone;
		sleep 3;
		["IP_BlackScreen", true, 0.5] call IP_fnc_blackIn;
	};

	//["IP_BlackScreen"] call BIS_fnc_blackIn;
	//sleep 3;
};