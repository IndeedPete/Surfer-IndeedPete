_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_skill = [_this, 1, 0, [0]] call BIS_fnc_param;

switch (_skill) do {
	case 0: {
		_unit setSkill ["aimingAccuracy",0.65];
		_unit setSkill ["spotDistance",0.95];
		_unit setSkill ["spotTime",0.85];
		_unit setSkill ["courage",0.75];
		_unit setSkill ["commanding",1.00];
		_unit setSkill ["aimingShake",0.65];
		_unit setSkill ["aimingSpeed",0.85];
		_unit setSkill ["endurance",0.75];
		_unit setSkill ["reloadSpeed",0.75];
		_unit setSkill ["general",0.8];
	};

	case 1: {
		_unit setSkill ["aimingSpeed", 0.05];
        _unit setSkill ["spotDistance", 0.05];
        _unit setSkill ["aimingAccuracy", 0.02];
        _unit setSkill ["aimingShake", 0.02];
        _unit setSkill ["spotTime", 0.1];
        _unit setSkill ["spotDistance", 0.3];
        _unit setSkill ["commanding", 0.3];
        _unit setSkill ["general", 0.2];
	};
	
	case 2: {
		_unit setSkill ["aimingSpeed", 0.1];
        _unit setSkill ["spotDistance", 0.1];
        _unit setSkill ["aimingAccuracy", 0.05];
        _unit setSkill ["aimingShake", 0.05];
        _unit setSkill ["spotTime", 0.2];
        _unit setSkill ["spotDistance", 0.4];
        _unit setSkill ["commanding", 0.4];
        _unit setSkill ["general", 0.3];
	};

	case 3: {
		_unit setSkill ["aimingSpeed", 0.15];
        _unit setSkill ["spotDistance", 0.15];
        _unit setSkill ["aimingAccuracy", 0.1];
        _unit setSkill ["aimingShake", 0.1];
        _unit setSkill ["spotTime", 0.3];
        _unit setSkill ["spotDistance", 0.5];
        _unit setSkill ["commanding", 0.5];
        _unit setSkill ["general", 0.6];
	};

	case 4: {
        _unit setSkill ["aimingSpeed", 0.2];
        _unit setSkill ["spotDistance", 0.2];
        _unit setSkill ["aimingAccuracy", 0.2];
        _unit setSkill ["aimingShake", 0.2];
        _unit setSkill ["spotTime", 0.4];
        _unit setSkill ["spotDistance", 0.6];
        _unit setSkill ["commanding", 0.6];
        _unit setSkill ["general", 0.7];
	};
     
	case 5: {	 
        _unit setSkill ["aimingSpeed", 0.3];
        _unit setSkill ["spotDistance", 0.3];
        _unit setSkill ["aimingAccuracy", 0.3];
        _unit setSkill ["aimingShake", 0.3];
        _unit setSkill ["spotTime", 0.5];
        _unit setSkill ["spotDistance", 0.8];
        _unit setSkill ["commanding", 0.8];
        _unit setSkill ["general", 0.9];
	};
	
	default {hint ("IP_fnc_setSkill:\nSkill level " + str(_skill) + " not recognised!")};
};