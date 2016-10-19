private ["_insertion", "_code", "_mission", "_params"];
_insertion = [_this, 0, (player getVariable ["IP_ShopInsertion", "foot"]), [""]] call BIS_fnc_param;
_code = [_this, 1, {}, [{}]] call BIS_fnc_param;
_mission = [_this, 2, (player getVariable ["IP_ShopMission", ""]), [""]] call BIS_fnc_param;
if (_mission == "") exitWith {hint "No mission selected!"};

_params = switch (_insertion) do {
	case "foot": {[("t" + _mission + "Foot"), "foot"]};
	
	case "cars": {
		_class = typeOf (vehicle player);
		[("t" + _mission + "Cars"), _class]
	};	
	
	case "air": {
		_class = typeOf (vehicle player);
		[("t" + _mission + "Air"), _class]
	};
	
	default {
		private "_category";
		_category = [(missionConfigFile >> "ShopCampVehicles"), _insertion] call IP_fnc_getConfigCategory;
		if (_category == "Armour") then {_category = "Cars"};
		[("t" + _mission + _category), _insertion]
	};
};

if ((_params select 0) call BIS_fnc_taskExists) then {
	[(_params select 0), "SUCCEEDED"] call BIS_fnc_taskSetState;
	player setVariable ["IP_ShopInsertion", (_params select 1)];
	[] call _code;
	[_mission, true, 5] call IP_fnc_endMission;
};