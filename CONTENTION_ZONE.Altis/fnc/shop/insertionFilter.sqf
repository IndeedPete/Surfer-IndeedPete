private ["_selectedMission", "_filterNames"];
_selectedMission = player getVariable ["IP_ShopMission", ""];
_filterNames = [[], []];

if (_selectedMission != "") then {
	_insertionTypes = getArray(missionConfigFile >> "ShopMissions" >> _selectedMission >> "insertionTypes");
	
	{
		switch (_x) do {
			case "foot": {
				_displayName = getText(missionConfigFile >> "ShopInsertionTypes" >> "foot" >> "displayName");
				(_filterNames select 0) pushBack _displayName;
				(_filterNames select 1) pushBack "foot";
			};
			
			case "cars": {
				_garage = player getVariable ["IP_ShopGarageVehicles", []];
				
				if (count _garage > 0) then {
					{
						_type = typeOf _x;
						_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayName");
						if ((_type call IP_fnc_getCargoSeats) > 0) then {
							(_filterNames select 0) pushBack _displayName;
							(_filterNames select 1) pushBack _type;
						};
					} forEach _garage;
				};
			};
			
			case "air": {
				_heliPad = player getVariable ["IP_ShopHangarVehicles", []];
				
				if (count _heliPad > 0) then {
					{
						_type = typeOf _x;
						_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayName");
						if ((_type call IP_fnc_getCargoSeats) > 0) then {
							(_filterNames select 0) pushBack _displayName;
							(_filterNames select 1) pushBack _type;
						};
					} forEach _heliPad;
				};
			};
			
			default {};
		};
	} forEach _insertionTypes;
};

_filterNames