// Dealer
[[IP_Dealer, "dealer"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
[[IP_Dealer, "BRIEFING", "ASIS"], "BIS_fnc_ambientAnim", nil, true] call BIS_fnc_MP;
[[IP_Dealer, "dealerOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
[[IP_Dealer, "dealerIntro"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;

// Döktör
[[IP_Doctor, "doctor"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
//[IP_Doctor, "LEAN_ON_TABLE", "ASIS"] call BIS_fnc_ambientAnim; // Moved to init line.
[[IP_Doctor, "doctorOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;

// Ghost GL
//_logicCentre = createCenter sideLogic;
//_logicGroup = createGroup _logicCentre;
//"logic" createUnit [[0,0,0], _logicGroup, "IP_GL_Ghost = this;", 0, "LIEUTENANT"];
//IP_GL_Ghost = _logicGroup createUnit ["logic", [0,0,0], [], 0, "NONE"];
[[IP_GL_Ghost, "ghost"], "IP_fnc_setIdentity", nil, true] call BIS_fnc_MP;
//[[IP_GL_Ghost, "ghostStartOpener", S_mobile1], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
//{IP_GL_Ghost setVariable _x} forEach [["IP_Faction", "Unknown", true], ["IP_Avatar", "images\ghostAvatar.jgp", true]];

// Gravedigger
[[IP_Gravedigger, "gravedigger"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
[[IP_Gravedigger, "STAND_U3", "ASIS"], "BIS_fnc_ambientAnim", nil, true] call BIS_fnc_MP;
[[IP_Gravedigger, "gravediggerOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;

// Mechanic
[[IP_Mechanic, "mechanic"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
[[IP_Mechanic, "mechanicOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
if !(isMultiplayer) then {
	[IP_Mechanic, "REPAIR_VEH_KNEEL", "ASIS"] call BIS_fnc_ambientAnim;
} else {
	//removeAllWeapons IP_Mechanic;
	IP_Mechanic disableAI "MOVE";
};

// Rival
[[IP_Rival, "rival"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
[[IP_Rival, "STAND", "ASIS"], "BIS_fnc_ambientAnim", nil, true] call BIS_fnc_MP;
[[IP_Rival, "rivalOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;

// Professor Start
[[IP_ProfName, "profStart"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
// [IP_ProfName, "STAND_U1", "ASIS"] call BIS_fnc_ambientAnim;
[[IP_ProfName, "profStartOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;
IP_ProfName linkItem "ItemRadio";

// Scruff
[[IP_Scruff, "Scruff"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;
[[IP_Scruff, "ScruffOpener"], "IP_fnc_addConversation", nil, true] call BIS_fnc_MP;

// Toilet Guy
[IP_ToiletGuy, "SIT", "ASIS"] call BIS_fnc_ambientAnim;
[] spawn{
	waitUntil {time > 0};
	sleep 3;
	IP_ToiletGuy attachTo [IP_Toilet, [0, 0.7, -1.1]];
	IP_ToiletGuy setDir 180;
};

// Priest
[[IP_Priest, "priest"], "IP_fnc_applyTemplate", nil, true] call BIS_fnc_MP;