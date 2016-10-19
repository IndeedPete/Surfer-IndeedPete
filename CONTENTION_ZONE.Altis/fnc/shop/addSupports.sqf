if (!(isNil "IP_CAMMODE") && {IP_CAMMODE}) exitWith {};

private ["_mission", "_supportTypes", "_campEnhancements"];
_mission = getText(missionConfigFile >> "name");
_supportTypes = if (isArray(missionConfigFile >> "ShopMissions" >> _mission >> "supportTypes")) then {(getArray(missionConfigFile >> "ShopMissions" >> _mission >> "supportTypes"))} else {[]};
if (count _supportTypes < 1) exitWith {};
if (isNil "IP_MainInitDone") exitWith {"Player not initialised! (IP_MainInitDone is nil.)" call BIS_fnc_error};
_campEnhancements = player getVariable ["IP_ShopCampEnhancements", ["Mortar", "Contractors"]];

if (("Mortar" in _supportTypes) && {"Mortar" in _campEnhancements}) then {
	[player, IP_SupReq, IP_SupPro_Arty] call BIS_fnc_addSupportLink;
};

if ("CAS" in _supportTypes) then {
	private "_CASClasses";
	_campVehicles = player getVariable ["IP_ShopCampVehicles", ["IP_I_Heli_Light_01_armed_digi_F", "IP_I_Heli_light_03_digi_F"]];
	_insertion = player getVariable ["IP_ShopInsertion", "foot"];
	_CASClasses = [];
	_CASClasspaths = "(isNumber(_x >> 'cas')) && {(getNumber(_x >> 'cas')) == 1}" configClasses (missionConfigFile >> "ShopCampVehicles" >> "Air");
	
	{
		_class = configName _x;
		if ((_class in _campVehicles) && {(_class != _insertion) OR ({_x == _class} count _campVehicles > 1)}) then {
			_CASClasses pushBack _class;
		};
	} forEach _CASClasspaths;
	
	if (count _CASClasses < 1) exitWith {};	
	"SupportProvider_Virtual_CAS_Heli" createUnit [(getMarkerPos "mCASStart"), (createGroup sideLogic), (format ["IP_SupPro_CAS = this; this setVariable ['BIS_SUPP_vehicles', %1]; this setVariable ['BIS_SUPP_vehicleInit', '(group _this) setGroupID [""Valkyrie""];'];", _CASClasses])];
	[player, IP_SupReq, IP_SupPro_CAS] call BIS_fnc_addSupportLink;
};

if (("Contractors" in _supportTypes) && {"Contractors" in _campEnhancements}) then {
	_silenced = player getVariable ["IP_ShopTeamSilenced", false];
	_side = side player;
	_grp = createGroup _side;
	_pos = getMarkerPos "mMERCStart";
	_dir = markerDir "mMERCStart";
	
	{
		_merc = [_pos, _x, _side, _grp, false, _silenced] call IP_fnc_createMerc;
		_merc setDir _dir;
	} forEach ["Teamleader", "Autorifleman", "LAT", "Marksman", "Medic", "Engineer", "Grenadier", "Rifleman"];
	
	_leader = leader _grp;
	_leader setVariable ["IP_LiveFeed", true];
	[_leader] call IP_fnc_track;
	_grp setGroupID ["Mercenary"];
	if (isNil "IP_Com") then {
		IP_Com = (createGroup sideLogic) createUnit ["HighCommand", [0,0,0], [], 0, "NONE"];  
	};
	
	if (isNil "IP_SubMerc") then {
		IP_SubMerc = (createGroup sideLogic) createUnit ["HighCommandSubordinate", [0,0,0], [], 0, "NONE"];
	};	
	
	IP_Com synchronizeObjectsAdd [player];  
	IP_Com synchronizeObjectsAdd [IP_SubMerc];    
	IP_SubMerc synchronizeObjectsAdd [_leader];
	[IP_Com] execVM "\A3\modules_f\HC\data\scripts\hc.sqf";
	
	[_leader, player, "Merc_CheckIn", "Misc_MercCheckIn", "SIDE"] call IP_fnc_simpleSentenceKB;
};