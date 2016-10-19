private ["_table", "_dir", "_attachValues", "_item", "_take", "_vectorDirAndUp", "_pitchBank", "_weaponHolder"];

// Read in all the parameters!
_table = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param; 		// Table or object to spawn the item on.
_dir = [_this, 1, 0, [0]] call BIS_fnc_param; 						// Dir... 
_attachValues = [_this, 2, [0,0,0], [[]], 3] call BIS_fnc_param;	// AttachTo values.
_item = [_this, 3, "", [""]] call BIS_fnc_param;					// Item classname.
_take = [_this, 4, true, [false]] call BIS_fnc_param;				// Allowed to take?
_vectorDirAndUp = [_this, 5, [], [[]]] call BIS_fnc_param;			// Optional vectorDirAndUp values.
_pitchBank = [_this, 6, [], [[]]] call BIS_fnc_param;				// Optional BIS_fnc_setPitchBank values.

// Create that item!
_weaponHolder = createVehicle ["groundWeaponHolder", (getPos _table), [], 0, "can_collide"];
_weaponHolder attachTo [_table, _attachValues];
_weaponHolder setDir _dir;
if (count _vectorDirAndUp > 0) then {_weaponHolder setVectorDirAndUp _vectorDirAndUp};
if (count _pitchBank > 0) then {([_weaponHolder] + _pitchBank) call BIS_fnc_setPitchBank}; 
if (isClass(configFile >> "CfgWeapons" >> _item)) then {
	if ((getNumber(configFile >> "CfgWeapons" >> _item >> "type")) == 131072) then {
		_weaponHolder addItemCargo [_item, 1];
	} else {
		_weaponHolder addWeaponCargo [_item, 1];
	};
} else {
	_weaponHolder addMagazineCargo [_item, 1];
};
if (!_take) then {_weaponHolder setDamage 1};

// Return the weapon holder.
_weaponHolder