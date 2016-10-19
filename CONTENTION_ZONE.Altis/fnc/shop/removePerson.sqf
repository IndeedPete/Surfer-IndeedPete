private ["_i", "_team", "_person"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a person first!"};

_team = player getVariable ["IP_ShopTeam", []];
if (count _team < 1) exitWith {};

_team deleteAt _i;
player setVariable ["IP_ShopTeam", _team];
call IP_fnc_closeShop;
["Personnel", _i] spawn IP_fnc_openShop;