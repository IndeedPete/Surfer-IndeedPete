private ["_logic", "_pos", "_hazard", "_radius", "_colour", "_marker"];
_logic = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if (isNull _logic) exitWith {["Passed logic is null!"] call BIS_fnc_error};

_pos = getPos _logic;
_hazard = toUpper(_logic getVariable ["SURF_Hazard", ""]);
_radius = _logic getVariable ["SURF_Radius", 99999];
_radius = if (_logic getVariable ["SURF_IdleRadius", -1] > 0) then {(_logic getVariable "SURF_IdleRadius")} else {_radius};

_colour = switch (_hazard) do {
	case "BIO": {"ColorGreen"};
	case "CHEM": {"ColorYellow"};
	case "RAD": {"ColorRed"};
	case "FREEZER": {"ColorBlue"};
	case "BLASTER": {"ColorOrange"};
	case "TRIP": {"ColorPink"};
	case "ZOMBIES": {"ColorBrown"};
	default {"ColorWhite"};
};

_marker = createMarkerLocal[(_hazard + str(_logic)), _pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_radius, _radius];
_marker setMarkerColor _colour;