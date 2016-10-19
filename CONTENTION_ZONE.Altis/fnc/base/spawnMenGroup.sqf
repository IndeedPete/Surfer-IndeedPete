/*
Name: spawnMenGroup
Author: IndeedPete
Purpose: Creates men group.
----------
Parameters:
_pos - ARRAY of NUMBER: Position where units will be created. - [0, 0, 0]
_side - SIDE (OPTIONAL): Side of unit. - east - DEFAULT: west
_size - NUMBER: Amount of spawned units. - 5
_selection - ARRAY of STRING (OPTIONAL): Selections of units that will be spawned, availability depends on side. Available selections in general: "STD" (standard units), "SF" (special forces), "GUE" (guerilla units) - ["STD"] - DEFAULT: ["STD", "SF", "GUE"] 
_grpId - STRING (OPTIONAL): Group ID for spawned unit. - "Delta-2-4" - DEFAULT: ""
----------
Requires: track
*/

private ["_array", "_arrays", "_grp", "_grpID"];

_pos = [_this, 0, [0, 0, 0], [[]]] call BIS_fnc_param;
_side = [_this, 1, west, [west]] call BIS_fnc_param;
_size = [_this, 2, 0, [0]] call BIS_fnc_param;
_selection = [_this, 3, ["STD", "SF", "GUE"], [[]]] call BIS_fnc_param;
_blacklist = [_this, 4, [], [[]]] call BIS_fnc_param;
_grpId = [_this, 5, "", [""]] call BIS_fnc_param;
if (count _selection == 0) then {_selection = ["STD", "SF", "GUE", "STY"]};

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

if (count _arrays == 0) exitWith {hint format ["IP_fnc_menspawn: Wrong selection parameters!\nSelection: %1\nSide: %2", _selection, _side]};
_array = _arrays call BIS_fnc_selectRandom;
_array = _array - _blacklist;

_grp = createGroup _side;
for "_i" from 1 to _size do {
	_class = _array call BIS_fnc_selectRandom;
	_unit = _grp createUnit [_class, _pos, [], 0, "NONE"];
};

if(_grpId != "")then{
	_grp setGroupID [_grpId];
};

_leader = leader _grp;
[_leader] spawn IP_fnc_track;
_count = count units _grp;
{_x setVariable ["IP_Spawned", true]} forEach units _grp;
[_leader, _count]