private ["_insertion", "_mission", "_title", "_displayName", "_count", "_capacity"];
_insertion = player getVariable ["IP_ShopInsertion", ""];
if (_insertion == "") exitWith {hint "You must select an insertion first!"};
_mission = player getVariable ["IP_ShopMission", ""];
if (_mission == "") exitWith {hint "You must select a mission first!"};

_title = getText(missionConfigFile >> "ShopMissions" >> _mission >> "title");
_displayName = if (_insertion == "foot") then {(getText(missionConfigFile >> "ShopInsertionTypes" >> _insertion >> "displayName"))} else {(getText(configFile >> "CfgVehicles" >> _insertion >> "displayName"))};
_count = count(player getVariable ["IP_ShopTeam", []]) + 1;
_capacity = if (_insertion == "foot") then {(getNumber(missionConfigFile >> "ShopMetaInformation" >> "teamLimit") + 1)} else {(_insertion call IP_fnc_getCargoSeats)};

createDialog "IP_DLG_INSERT";
ctrlSetText [1002, _title];
ctrlSetText [1003, _displayName];
ctrlSetText [1005, str(_count)];
ctrlSetText [1007, str(_capacity)];