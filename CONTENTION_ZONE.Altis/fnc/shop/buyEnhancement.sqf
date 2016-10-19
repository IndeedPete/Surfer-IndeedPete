private ["_i", "_enhancement", "_price"];
_i = _this;
if (_i == -1) exitWith {hint "You have to select a camp enhancement first!"};

_enhancement = IP_AvailableCampEnhancements select _i;
_price = getNumber(missionConfigFile >> "ShopCampEnhancements" >> _enhancement >> "price");

if (_price call IP_fnc_purchase) then {
	_inPosession = player getVariable ["IP_ShopCampEnhancements", []];
	player setVariable ["IP_ShopCampEnhancements", (_inPosession + [_enhancement])];
	call IP_fnc_closeShop;
	IP_AvailableCampEnhancements = IP_AvailableCampEnhancements - [_enhancement];
	
	_enhancement spawn {
		["IP_BlackScreen", false] call IP_fnc_blackOut;
		sleep 0.5;
		
		{
			_campEnhancement = _x getVariable ["IP_ShopCampEnhancement", ""];
			if (_campEnhancement == _this) then {
				_x enableSimulation true;
				_x hideObject false;
			};
		} forEach (allMissionObjects "All");
		
		if (isText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker")) then {
			_marker = getText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker");
			_marker setMarkerAlpha 1;
		} else {
			if (isArray(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker")) then {
				_markers = getArray(missionConfigFile >> "ShopCampEnhancements" >> _this >> "marker");
				{_x setMarkerAlpha 1} forEach _markers;
			};
		};
		
		_title = getText(missionConfigFile >> "ShopCampEnhancements" >> _this >> "title");
		_buildTime = if (isNumber(missionConfigFile >> "ShopCampEnhancements" >> _this >> "buildTime")) then {(getNumber(missionConfigFile >> "ShopCampEnhancements" >> _this >> "buildTime"))} else {(getNumber(missionConfigFile >> "ShopMetaInformation" >> "defaultBuildTime"))};
		if (_buildTime > 0) then {skipTime _buildTime};		
		sleep 0.5;
		["IP_BlackScreen"] call IP_fnc_blackIn;
		
		["EnhancementDeployed", [_title]] call BIS_fnc_showNotification;
		["CampEnhancements"] call IP_fnc_openShop;
	};
};