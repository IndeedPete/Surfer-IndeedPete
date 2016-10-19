_unit = [_this, 0, IP_Main, [ObjNull]] call BIS_fnc_param;
_skill = [_this, 1, 5, [0]] call BIS_fnc_param;
_silenced = [_this, 2, false, [true]] call BIS_fnc_param;
_night = [_this, 3, [((dayTime < 7) OR (dayTime > 19)), true], [[]]] call BIS_fnc_param;
_addMoney = [_this, 4, false, [true]] call BIS_fnc_param;
_code = [_this, 5, {}, [{}]] call BIS_fnc_param;

_team = _unit getVariable ["IP_Team", []];
if (count _team == 0) exitWith {};

_grp = group _unit;
_pos = getPos _unit;
_veh = vehicle _unit;

{
	_teammate = _grp createUnit [_x, _pos, [], 0, "FORM"]; 
	_teammate setVariable ["IP_Spawned", true];
	_teammate setVariable ["IP_InTeam", true];
	_teammate enableIRLasers true;
	
	if (_x in ["B_CTRG_soldier_M_medic_F", "B_CTRG_soldier_AR_A_F", "B_CTRG_soldier_engineer_exp_F", "B_CTRG_soldier_GL_LAT_F"]) then { // British Knights Player Team
		_teammate setVariable ["IP_Faction", "BritishKnights"];
		[_teammate, _skill, _silenced, _night] call IP_fnc_createBK;
		_teammate addEventHandler ["Killed", {
			_class = typeOf (_this select 0);
			_team = IP_Main getVariable ["IP_Team", []];
			_killedTeammates = IP_Main getVariable ["IP_KilledTeammates", []];
			
			_team = _team - [_class];
			_killedTeammates = _killedTeammates + [_class];
			
			IP_Main setVariable ["IP_Team", _team];
			IP_Main setVariable ["IP_KilledTeammates", _killedTeammates];
		}];
	} else {
		_teammate setVariable ["IP_Faction", "ION"];
		if (round(random 1) > 0.66) then {_teammate setRank "CORPORAL"};
		[_teammate, _skill, _silenced, _night, _addMoney] call IP_fnc_createMerc;	
	};
	
	if (_unit != _veh) then {
		if (((typeOf _veh) == "B_G_Offroad_01_armed_F") && {isNull(gunner _veh)}) then {
			_teammate moveInGunner _veh;
		} else {
			_teammate moveInCargo _veh;
		};
	};
	
	if (IP_TESTMODE) then {_teammate allowDamage false};	
	_teammate spawn _code;
} forEach _team;