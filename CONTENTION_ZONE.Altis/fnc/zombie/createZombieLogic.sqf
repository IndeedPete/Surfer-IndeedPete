private ["_pos", "_logicCentre", "_logicGroup", "_logic"];
_pos = [_this, 0, [0,0,0], [[]], [2,3]] call BIS_fnc_param;

_logicCentre = createCenter sideLogic;
_logicGroup = createGroup _logicCentre;
_logic = _logicGroup createUnit ["logic", _pos, [], 0, "NONE"];
_logic setPos _pos;
_logic setVariable ["SURF_Hazard", "ZOMBIES"];

_logic