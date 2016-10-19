// Deprecated? Replaced by Shop System? // Also in use by M06.
class ClassnameTemplates
{
	class Contention
	{
		superTexture[] = {"images\OpforClothing_Grey.rvmat", "images\OpforClothing_Grey.paa"};
		superUniform = "U_O_CombatUniform_ocamo";
		
		class O_Soldier_lite_F
		{
			backpackPool[] = {};
			goggles = 1;
			handgrenadeCount = 0;
			handMagCount = 3;
			handWeaponPool[] = {"hgun_Rook40_F"};
			headgear = 1;
			items[] = {"FirstAidKit"};
			primMagCount = 4;
			primWeaponPool[] = {"SMG_02_F", "SMG_02_ACO_F", "SMG_02_ARCO_pointg_F"};
			primWeaponProbability = 0.7;
			secMagazines[] = {};
			secWeapon = "";
			skill = 3;
			vest = 1;
		};
	};
	
	// Obsolete!
	class Freezoners
	{
		superHeadgear[] = {"H_Watchcap_camo", "H_Shemag_olive_hs", "H_Booniehat_dirty", "H_Cap_oli", "H_ShemagOpen_khk"};
		superHeadgearProbability = 0.45;
		superGoggles[] = {"G_Bandanna_blk", "G_Bandanna_oli", "G_Balaclava_combat", "G_Balaclava_blk", "G_Bandanna_shades", "G_Combat"};
		superGogglesProbability = 0.5;
		//superVests[] = {"V_PlateCarrier2_rgr", "V_PlateCarrier3_rgr", "V_PlateCarrierGL_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierSpec_rgr"};
		superVestProbability = 0.5;
		superUniforms[] = {"U_BG_Guerilla3_2", "U_BG_Guerilla3_1", "U_BG_Guerilla2_3", "U_BG_Guerilla2_2", "U_BG_Guerilla2_1"};
		superBackpackPool[] = {"B_AssaultPack_khk", "B_AssaultPack_dgtl", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_AssaultPack_blk", "B_AssaultPack_cbr", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oucamo", "B_FieldPack_cbr", "B_FieldPack_blk", "B_Kitbag_rgr", "B_Kitbag_mcamo", "B_Kitbag_sgg", "B_Kitbag_cbr", "B_TacticalPack_rgr", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_blk", "B_TacticalPack_oli", "B_Carryall_ocamo", "B_Carryall_oucamo", "B_Carryall_mcamo", "B_Carryall_khk", "B_Carryall_cbr"};
		superBackpackProbability = 0.5;
		superItems[] = {"FirstAidKit"};
	};
};