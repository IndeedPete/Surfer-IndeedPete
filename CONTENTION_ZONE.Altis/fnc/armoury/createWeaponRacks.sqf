private ["_createRack", "_pos", "_dir", "_countRacks", "_weapons", "_take", "_offset", "_rackClass", "_countWeapons", "_rack", "_racks", "_count", "_weaponHolders"];

// Create single rack sub-function.
_createRack = {
	private "_rack";
	_rack = (_this select 2) createVehicle (_this select 0);
	_rack setPos (_this select 0);
	_rack setDir (_this select 1);
	_rack
};

// Read in all the parameters!
_pos = [_this, 0, (getPosATL player), [[]]] call BIS_fnc_param; 		// Where to spawn the racks.
_dir = [_this, 1, 0, [0]] call BIS_fnc_param; 							// Dir... 
_countRacks = [_this, 2, 1, [0]] call BIS_fnc_param;					// Amount of stacked racks.
_weapons = [_this, 3, [], [[]]] call BIS_fnc_param;						// Weapon classnames.
_take = [_this, 4, true, [false]] call BIS_fnc_param;					// Allowed to take the guns?
_offset = [_this, 5, 0.3, [0]] call BIS_fnc_param;						// Offset between the racks, 0.3 makes them perfectly aligned.
_rackClass = [_this, 6, "Target_Rail_End_F", [""]] call BIS_fnc_param;	// Custom rack object class.
_countWeapons = count _weapons;

// Check for some misdefined params.
if ((_countRacks < 1) OR (_countRacks < _countWeapons)) exitWith {["Count racks < 0 OR count weapons > count racks!"] call BIS_fnc_error};

// Create first rack.
_rack = [_pos, _dir, _rackClass] call _createRack;
_racks = [_rack];

// Create all the other racks!
if (_countRacks > 1) then {
	for "_i" from 0 to (_countRacks - 2) do {
		_oldRack = _rack;
		_rack = [_pos, _dir, _rackClass] call _createRack;
		_rack attachTo [_oldRack, [0, 0, _offset]];
		_racks pushBack _rack;
	};
};

// Stock 'em racks up with pew pews.
_count = _countRacks min _countWeapons;
_weaponHolders = [];
for "_i" from 0 to (_count - 1) do {
	_weaponClass = _weapons select _i;
	_rack = _racks select _i;
	
	_weaponHolder = createVehicle ["groundWeaponHolder", _pos, [], 0, "can_collide"]; 
	_weaponHolder attachTo [_rack, [0.55, 0, 0]];
	_weaponHolder setVectorDirAndUp [[0, 0, 1], [5000, -40, 0]];
	if (_weaponClass != "") then {_weaponHolder addWeaponCargo [_weaponClass, 1]};
	if (!_take) then {_weaponHolder setDamage 1};
	
	_weaponHolders pushBack _weaponHolder;
};

// Return racks and weapon holders.
[_racks, _weaponHolders]