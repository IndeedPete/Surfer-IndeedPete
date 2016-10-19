private ["_i", "_team", "_teamLimit", "_personnel", "_person", "_category", "_costRate"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a person first!"};

_team = player getVariable ["IP_ShopTeam", []];
_teamLimit = getNumber(missionConfigFile >> "ShopMetaInformation" >> "teamLimit");
if (((count _team) + 1) > _teamLimit) exitWith {hint (format ["Your team is full! You are allowed to take a maximum of %1 teammates with you!", _teamLimit])};

_personnel = IP_PersonnelFilter call IP_fnc_personnelFilter;
_person = _personnel select _i;
_category = [(missionConfigFile >> "ShopPersonnel"), _person] call IP_fnc_getConfigCategory;
_costRate = getNumber(missionConfigFile >> "ShopPersonnel" >> _category >> _person >> "costRate");
if (((call IP_fnc_calculateTotalCostRate) + _costRate) > 1) exitWith {hint "Your total cost rate would be higher than 100%!"};

_team pushBack _person;
player setVariable ["IP_ShopTeam", _team];
call IP_fnc_closeShop;
["Personnel", _i] spawn IP_fnc_openShop;