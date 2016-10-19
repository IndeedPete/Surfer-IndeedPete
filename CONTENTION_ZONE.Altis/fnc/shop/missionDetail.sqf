private ["_i", "_tcr", "_task", "_currency", "_client", "_loc", "_totalRew", "_currentRew", "_desc", "_rec", "_text"];
_i = _this select 1;
if (_i < 0) exitWith {};
_tcr = call IP_fnc_calculateTotalCostRate;
_task = IP_AvailableMissions select _i;
_currency = getText(missionConfigFile >> "ShopMetaInformation" >> "currencyShort");

_client = if (isText(missionConfigFile >> "ShopMissions" >> _task >> "client")) then {
	_class = getText(missionConfigFile >> "ShopMissions" >> _task >> "client");
	("Client: " + getText(missionConfigFile >> "Factions" >> _class >> "displayName") + "<br/>")
} else {""};

_loc = if (isText(missionConfigFile >> "ShopMissions" >> _task >> "location")) then {
	("Location: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "location") + "<br/>")
} else {""};

_totalRew = "Total Reward: " + _currency + " " + ([(getNumber(missionConfigFile >> "ShopMissions" >> _task >> "reward"))] call IP_fnc_numberText) + "<br/>";
_currentRew = "Current Reward (TCR " + str(100 * _tcr) + "%): " + _currency + " " + ([(_task call IP_fnc_calculateCurrentMissionReward)] call IP_fnc_numberText) + "<br/>";
_desc = "Description: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "description") + "<br/>";

_rec = if (isText(missionConfigFile >> "ShopMissions" >> _task >> "recommended")) then {
	("Recommended: " + getText(missionConfigFile >> "ShopMissions" >> _task >> "recommended"))
} else {""};

_text = _client + _loc + _totalRew + _currentRew + _desc + _rec;
((findDisplay 10000) displayCtrl 1100) ctrlSetStructuredText (parseText _text);