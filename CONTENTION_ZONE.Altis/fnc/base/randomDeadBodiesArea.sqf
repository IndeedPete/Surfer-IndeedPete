private ["_array", "_arrays"];
_area = [_this, 0, "", ["", []]] call BIS_fnc_param;
_side = [_this, 1, civilian, [civilian]] call BIS_fnc_param;
_menCounts = [_this, 2, [], [[]]] call BIS_fnc_param;
_selection = [_this, 4, ["STD", "SF", "GUE", "STY"], [[]]] call BIS_fnc_param;
_customCode = [_this, 5, {}, [{}]] call BIS_fnc_param;
_blacklist = [_this, 6, [], [[]]] call BIS_fnc_param;

_arrays = [];
switch (_side) do{
	case west:{
		_BLUmenSTD = ["B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_engineer_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AA_F","B_soldier_AT_F","B_officer_F","B_soldier_repair_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F","B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F","B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F"];
		_BLUmenSF = ["B_recon_exp_F","B_recon_JTAC_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_TL_F"];
		_BLUmenGUE = ["B_G_Soldier_A_F","B_G_soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_soldier_exp_F","B_G_Soldier_GL_F","B_G_soldier_M_F","B_G_officer_F","B_G_Soldier_F","B_G_soldier_LAT_F","B_G_Soldier_lite_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"];

		if ("STD" in _selection) then {_arrays set [(count _arrays), _BLUmenSTD]};
		if ("SF" in _selection) then {_arrays set [(count _arrays), _BLUmenSF]};
		if ("GUE" in _selection) then {_arrays set [(count _arrays), _BLUmenGUE]};
	};
	
	case east:{
		_OPFmenSTD = ["O_Soldier_A_F","O_soldier_AR_F","O_medic_F","O_engineer_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_soldier_AA_F","O_soldier_AT_F","O_officer_F","O_soldier_repair_F","O_Soldier_F","O_soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_AAR_F","O_soldier_AAA_F","O_soldier_AAT_F"];
		_OPFmenSF = ["O_recon_exp_F","O_recon_JTAC_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_TL_F","O_soldier_AAR_F","O_soldier_AAA_F","O_soldier_AAT_F"];
		_OPFmenGUE = ["O_G_Soldier_A_F","O_G_soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_soldier_exp_F","O_G_Soldier_GL_F","O_G_soldier_M_F","O_G_officer_F","O_G_Soldier_F","O_G_soldier_LAT_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F"];
		
		if ("STD" in _selection) then {_arrays set [(count _arrays), _OPFmenSTD]};
		if ("SF" in _selection) then {_arrays set [(count _arrays), _OPFmenSF]};
		if ("GUE" in _selection) then {_arrays set [(count _arrays), _OPFmenGUE]};
	};
	
	case resistance:{
		_INDmenSTD = ["I_Soldier_A_F","I_soldier_AR_F","I_medic_F","I_engineer_F","I_soldier_exp_F","I_Soldier_GL_F","I_soldier_M_F","I_soldier_AA_F","I_soldier_AT_F","I_officer_F","I_soldier_repair_F","I_Soldier_F","I_soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F","I_soldier_AAR_F","I_soldier_AAA_F","I_soldier_AAT_F"];
		_INDmenGUE = ["I_G_Soldier_A_F","I_G_soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_soldier_exp_F","I_G_Soldier_GL_F","I_G_soldier_M_F","I_G_officer_F","I_G_Soldier_F","I_G_soldier_LAT_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F"];
		
		if ("STD" in _selection) then {_arrays set [(count _arrays), _INDmenSTD]};
		if ("GUE" in _selection) then {_arrays set [(count _arrays), _INDmenGUE]};
	};
	
	case civilian:{
		_CIVmenSTD = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_man_p_beggar_F","C_man_w_worker_F","C_man_hunter_1_F","C_man_p_shorts_1_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];
		_CIVmenSTY = ["C_Orestes","C_Nikos"];
		if ("STD" in _selection) then {_arrays set [(count _arrays), _CIVmenSTD]};
		if ("STY" in _selection) then {_arrays set [(count _arrays), _CIVmenSTY]};
	};
};

_totalCount = round((_menCounts select 0) + random((_menCounts select 1) - (_menCounts select 0)));
_array = _arrays call BIS_fnc_selectRandom;
_array = _array - _blacklist;
_grp = createGroup _side;

for "_i" from 0 to (_totalCount - 1) do {
	_pos = _area call IP_fnc_SHKPos;
	_class = _array call BIS_fnc_selectRandom;
	_unit = _grp createUnit [_class, _pos, [], 0, "NONE"];
	[_unit] call IP_fnc_deadBody;
	_unit spawn _customCode;
	sleep 0.3;
};

if (IP_TESTMODE) then {hint format ["IP_fnc_randomDeadBodiesArea\nUnits created: %1", _totalCount]};
_totalCount