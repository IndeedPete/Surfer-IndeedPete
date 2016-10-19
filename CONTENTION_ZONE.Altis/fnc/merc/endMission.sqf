if (!(isClass(campaignConfigFile >> "campaign"))) exitWith {_this call BIS_fnc_endMission};

_isWin = [_this, 1, true, [false]] call BIS_fnc_param;
_mainLoadout = [IP_Main] call IP_fnc_getLoadout;
_buddyLoadout = if ((isNil "IP_Buddy") OR {isNull IP_Buddy} OR {!alive IP_Buddy}) then {[]} else {[IP_Buddy] call IP_fnc_getLoadout};
_isHub = if (getNumber(missionConfigFile >> "isHub") == 1) then {true} else {false};

_money = IP_Main getVariable "IP_Money";
_debts = IP_Main getVariable "IP_Debts";
_team = IP_Main getVariable "IP_Team";
_clothes = IP_Main getVariable "IP_Clothes";
_campEnhancements = IP_Main getVariable ["IP_CampEnhancements", []];
_campVehicles = IP_Main getVariable ["IP_CampVehicles", []];
_killedTeammates = IP_Main getVariable ["IP_KilledTeammates", []];
_mission = IP_Main getVariable ["IP_Mission", (getText(missionConfigFile >> "name"))];
_insertion = IP_Main getVariable ["IP_Insertion", "foot"];

if ((getNumber(missionConfigFile >> "keepLoadout")) == 1) then {
	IP_MERCS_MainLoadout = _mainLoadout;
	IP_MERCS_BuddyLoadout = _buddyLoadout;
	if (count IP_MERCS_BuddyLoadout > 0) then {saveVar "IP_MERCS_BuddyLoadout"};
};

IP_MERCS_Money = _money;
IP_MERCS_Debts = _debts;
IP_MERCS_Team = _team;
IP_MERCS_Clothes = _clothes;
IP_MERCS_Mission = _mission;
IP_MERCS_Insertion = _insertion;
IP_MERCS_CampEnhancements = _campEnhancements;
IP_MERCS_CampVehicles = _campVehicles;
IP_MERCS_KilledTeammates = _killedTeammates;

IP_MERCS_Date = date;
IP_MERCS_Weather = IP_Weather;

{saveVar _x} forEach ["IP_MERCS_MainLoadout", "IP_MERCS_Money", "IP_MERCS_Debts", "IP_MERCS_Team", "IP_MERCS_Clothes", "IP_MERCS_Mission", "IP_MERCS_Insertion", "IP_MERCS_CampEnhancements", "IP_MERCS_CampVehicles", "IP_MERCS_KilledTeammates", "IP_MERCS_Date", "IP_MERCS_Weather"];

if (_isHub) then {
	_boxWeapons = weaponCargo IP_PlayerBox;
	_boxMagazines = magazineCargo IP_PlayerBox;
	_boxItems = itemCargo IP_PlayerBox;
	_boxBackpacks = backpackCargo IP_PlayerBox;
	
	IP_MERCS_PlayerBox = [_boxWeapons, _boxMagazines, _boxItems, _boxBackpacks];	
	saveVar "IP_MERCS_PlayerBox";
};

if (getText(missionConfigFile >> "name") == "Hub01") then {
	IP_MERCS_PlacesCaptured = IP_PlacesCaptured;
	saveVar "IP_MERCS_PlacesCaptured";
};

if (_isWin && !_isHub) then {
	_mission = getText(missionConfigFile >> "name");
	_missionsDone = IP_MERCS_MissionsDone;
	if (!(_mission in _missionsDone)) then {
		_missionsDone = _missionsDone + [_mission];
		IP_MERCS_MissionsDone = _missionsDone;
		saveVar "IP_MERCS_MissionsDone";
	};
};

// Turn off Glass NV
if ((player getVariable ['IP_Glass_Vision', 0]) == 1) then {setAperture -1};
_this call BIS_fnc_endMission;