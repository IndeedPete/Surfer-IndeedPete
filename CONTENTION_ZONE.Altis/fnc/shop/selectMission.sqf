private ["_i", "_currentTask", "_task", "_cfg", "_title", "_desc", "_insertionTypes"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a mission first!"};

_currentTask = player getVariable ["IP_ShopMission", ""];
_task = IP_AvailableMissions select _i;
_cfg = (missionConfigFile >> "ShopMissions" >> _task);

if (_currentTask == _task) exitWith {("t" + _currentTask) call IP_fnc_taskHint};
if (_currentTask != "") then {[("t" + _currentTask)] call BIS_fnc_deleteTask};

_title = getText(_cfg >> "title");
_desc = getText(_cfg >> "description");
_insertionTypes = getArray(_cfg >> "insertionTypes");
player setVariable ["IP_ShopMission", _task];
player setVariable ["IP_ShopInsertion", ""];

[["ICE", "Insertion"]] call BIS_fnc_advHint;
[player, ("t" + _task), [_desc, _title, ""], nil, true, 1] call BIS_fnc_taskCreate;
if ("foot" in _insertionTypes) then {[player, [("t" + _task + "Foot"), ("t" + _task)], ["Go to the marked area to insert on foot!", "Insert on Foot", "Foot"], (getMarkerPos "mFoot"), true, 1] call BIS_fnc_taskCreate};
if ("cars" in _insertionTypes) then {[player, [("t" + _task + "Cars"), ("t" + _task)], ["Go to the marked area and board a vehicle to insert by ground vehicle!", "Insert by Ground Vehicle", "Garage"], (getMarkerPos "mGarage"), true, 1] call BIS_fnc_taskCreate};
if ("air" in _insertionTypes) then {[player, [("t" + _task + "Air"), ("t" + _task)], ["Go to the marked area and board the vehicle to insert by Air!", "Insert by Air", "Air"], (getMarkerPos "mHangar"), true, 1] call BIS_fnc_taskCreate};