params [
	["_class", "", [""]],
	["_marker", "", [""]],
	["_category", "", [""]],
	"_created"
];

_pos = getMarkerPos _marker;
_dir = markerDir _marker;

_created = _class createVehicle _pos;
_created setPos _pos;
_created setDir _dir;
clearWeaponCargo _created;
clearMagazineCargo _created;
clearItemCargo _created;
clearBackpackCargo _created;
if !(_category in ["Cars", "Armour"]) then {
	_created lockDriver true;
	_created lockTurret [[0], true];
};

_created addEventHandler ["Killed", {
	private "_inPosession";
	_vehicle = typeOf (_this select 0);
	_inPosession = player getVariable ["IP_ShopCampVehicles",[]];	
	_count = {_x == _vehicle} count _inPosession;
	_inPosession = _inPosession - [_vehicle];
	if (_count > 1) then {		
		for "_i" from 1 to (_count - 1) do {
			_inPosession pushBack _vehicle;
		};		
	};
	player setVariable ["IP_ShopCampVehicles", _inPosession];
}];

_created