private ["_dir", "_orientation"];
_dir = [_this, 0, 0, [0]] call BIS_fnc_param;
if (_dir < 0) then {_dir = _dir + 360};
_dir = _dir % 360;

_orientation = switch (true) do  
{ 
	case (_dir <= 22.5 || _dir > 337.5): {"north"};  
	case (_dir > 22.5 && _dir <= 67.5): {"north-east"};  
	case (_dir > 67.5 && _dir <= 112.5 ): {"east"};  
	case (_dir > 112.5 && _dir <= 157.5): {"south-east"};  
	case (_dir > 157.5 && _dir <= 202.5): {"south"};  
	case (_dir > 202.5 && _dir <= 247.5): {"south-west"};  
	case (_dir > 247.5 && _dir <= 292.5): {"west"};  
	case (_dir > 292.5 && _dir <= 337.5): {"north-west"};     
	default {"N/A"};
};

_orientation