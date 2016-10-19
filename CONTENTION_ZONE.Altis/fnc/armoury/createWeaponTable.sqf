private ["_pos", "_dir", "_bigTable", "_weapons", "_weaponsDir", "_take", "_offset", "_tableClass", "_countWeapons", "_tableData", "_table", "_attachValuesOld", "_weaponHolders"];

// Read in all the parameters!
_pos = [_this, 0, (getPosATL player), [[]]] call BIS_fnc_param; 		// Where to spawn the table.
_dir = [_this, 1, 0, [0]] call BIS_fnc_param; 							// Dir... 
_bigTable = [_this, 2, true, [false, ""]] call BIS_fnc_param;			// Big, small or custom table? NOTE: Custom table in form of array of table class and basic attachTo values ["MyTableClass", [x,y,z]].
_weapons = [_this, 3, [], [[]]] call BIS_fnc_param;						// Weapon or magazine classnames.
_weaponsDir = [_this, 4, 0, [0]] call BIS_fnc_param;					// Relative dir of stuff on the table. NOTE: The script will align stuff based on given dir. Dir between 315 and 45 or between 135 and 225 will be aligned parallel to the table's X axis, other dirs parallel to the Y axis.
_take = [_this, 5, true, [false]] call BIS_fnc_param;					// Allowed to take the stuff?
_offset = [_this, 6, 0.3, [0]] call BIS_fnc_param;						// Offset between the guns, 0.3 works for most rifles.

// Calculate all the things!
_countWeapons = count _weapons;
_weaponsDir = _weaponsDir mod 360;
_tableData = if ((typeName _bigTable) == "BOOL") then {
	if (_bigTable) then {
		["Land_CampingTable_F", [-0.75, 0.25, 1.05]]
	} else {
		["Land_CampingTable_small_F", [-0.25, 0.2, 1.05]]
	}
} else {
	_bigTable
};

// Create table.
_tableClass = _tableData select 0;
_table = _tableClass createVehicle _pos;
_table setPos _pos;
_table setDir _dir;

// Add stuff to the table.
_attachValuesOld = _tableData select 1;
_weaponHolders = [];
for "_i" from 0 to (_countWeapons - 1) do {
	_weaponClass = _weapons select _i;
	_weaponHolder = createVehicle ["groundWeaponHolder", _pos, [], 0, "can_collide"];
	
	_attachValues = if (((_weaponsDir <= 45) OR (_weaponsDir > 315)) OR ((_weaponsDir <= 225) && (_weaponsDir > 135))) then {
		_res = [0, (_attachValuesOld select 1), (_attachValuesOld select 2)];
		_attachValuesOld set [1, ((_attachValuesOld select 1) - _offset)];
		_res
	} else {
		_res = [(_attachValuesOld select 0), 0, (_attachValuesOld select 2)];
		_attachValuesOld set [0, ((_attachValuesOld select 0) + _offset)];
		_res
	};
	
	_weaponHolder attachTo [_table, _attachValues];
	if (_weaponClass != "") then {
		if (isClass(configFile >> "CfgWeapons" >> _weaponClass)) then {
			_weaponHolder addWeaponCargo [_weaponClass, 1];
		} else {
			_weaponHolder addMagazineCargo [_weaponClass, 1];
		};
	};
	_weaponHolder setDir _weaponsDir;
	if (!_take) then {_weaponHolder setDamage 1};
	
	_weaponHolders pushBack _weaponHolder;
};

// Return table and weapon holders.
[_table, _weaponHolders]