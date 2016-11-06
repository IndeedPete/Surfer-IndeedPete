class ShopWeapons
{	
	class Optics
	{
		basePrice = 500;
		displayName = "Optics";
		
		class Binocular
		{
			price = 500;
		};
		class Rangefinder
		{
			price = 1000;
		};
		class Laserdesignator
		{
			price = 1500;
			show = 0;
		};
		class Laserdesignator_02: Laserdesignator {};
		class Laserdesignator_03: Laserdesignator {};
		class Laserdesignator_02_ghex_F: Laserdesignator {};
		class Laserdesignator_01_khk_F: Laserdesignator {};
	};
	
	class Pistols
	{
		basePrice = 450;
		displayName = "Pistols";
		
		class hgun_Pistol_Signal_F
		{
			merc = 0;
			origin = "USA";
			price = 250;
			show = 0;
		};
		class hgun_Pistol_01_F
		{
			origin = "Russia";
			price = 400;
		};
		class hgun_P07_F
		{
			origin = "EF";
			price = 500;
		};
		class hgun_P07_khk_F: hgun_P07_F {};
		class hgun_Rook40_F
		{
			origin = "Russia";
			price = 500;
		}; 
		class hgun_ACPC2_F
		{
			origin = "USA";
			price = 500;
		}; 
		class hgun_Pistol_heavy_01_F
		{
			origin = "USA";
			price = 750;
		}; 
		class hgun_Pistol_heavy_02_F
		{
			origin = "EF";
			price = 750;
		};
	};
	
	class SMG
	{
		basePrice = 1250;
		displayName = "SMGs";
		
		class hgun_PDW2000_F
		{
			origin = "Singapore";
			price = 1500;
		};
		class SMG_02_F
		{
			origin = "EF";
			price = 1500;
		};
		class SMG_05_F
		{
			origin = "EF";
			price = 1500;
		};
		class hlc_smg_mp5k_PDW
		{
			origin = "Germany";
			price = 1500;
		};
		class hlc_smg_mp5k: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5a2: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5a3: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5a4: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5n: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5sd5: hlc_smg_mp5k_PDW {};
		class hlc_smg_mp5sd6: hlc_smg_mp5k_PDW {};
		class hlc_smg_9mmar: hlc_smg_mp5k_PDW {};
		class hlc_rifle_augpara
		{
			origin = "Austria";
			price = 1500;
		};
		class hlc_rifle_augpara_b: hlc_rifle_augpara {};
		class hlc_rifle_augpara_t: hlc_rifle_augpara {};
		class hlc_rifle_auga2para
		{
			origin = "Austria";
			price = 1500;
		};
		class hlc_rifle_auga2para_b: hlc_rifle_auga2para {};
		class hlc_rifle_auga2para_t: hlc_rifle_auga2para {};
		class hlc_smg_mp510
		{
			origin = "Germany";
			price = 1750;
		};
		class SMG_01_F
		{
			origin = "USA";
			price = 2000;
		};
	};
	
	class Carbines
	{
		basePrice = 2500;
		displayName = "Carbines";
		
		class arifle_TRG20_F
		{
			origin = "Israel";
			price = 3000;
		};
		class IP_arifle_TRG20_FBlack: arifle_TRG20_F {};
		class IP_arifle_TRG20_FTriangle: arifle_TRG20_F 
		{
			merc = 0;
			show = 0;
		};
		class arifle_Mk20C_F
		{
			origin = "EF";
			price = 3000;
		};
		class arifle_Mk20C_plain_F: arifle_Mk20C_F {};
		class IP_arifle_Mk20C_FBlack: arifle_Mk20C_F {};
		class arifle_AKS_F
		{
			origin = "Russia";
			price = 3000;
		};
		class hlc_rifle_aks74u
		{
			origin = "Russia";
			price = 3000;
		};
		class hlc_rifle_falosw
		{
			origin = "EF";
			price = 3000;
		};		
		class hlc_rifle_hk51
		{
			origin = "EF";
			price = 3000;
		};
		class hlc_rifle_hk53
		{
			origin = "EF";
			price = 3000;
		};
		class hlc_rifle_cqbr
		{
			origin = "EF";
			price = 3000;
		};
		class hlc_rifle_RU556
		{
			origin = "USA";
			price = 3000;
		};
		class hlc_rifle_RU5562
		{
			origin = "USA";
			price = 3000;
		};
		class hlc_rifle_auga1carb
		{
			origin = "Austria";
			price = 3000;
		};
		class hlc_rifle_auga1carb_t: hlc_rifle_auga1carb {};
		class hlc_rifle_auga1carb_b: hlc_rifle_auga1carb {};
		class hlc_rifle_auga2carb
		{
			origin = "Austria";
			price = 3000;
		};
		class hlc_rifle_auga2carb_t: hlc_rifle_auga2carb {};
		class hlc_rifle_auga2carb_b: hlc_rifle_auga2carb {};
		class hlc_rifle_augsrcarb
		{
			origin = "Austria";
			price = 3000;
		};
		class hlc_rifle_augsrcarb_t: hlc_rifle_augsrcarb {};
		class hlc_rifle_augsrcarb_b: hlc_rifle_augsrcarb {};
		class hlc_rifle_saiga12k
		{
			origin = "Russia";
			price = 3000;
		};
		class arifle_Katiba_C_F
		{
			origin = "Iran";
			price = 4000;
		};
		class arifle_MXC_F
		{
			origin = "USA";
			price = 4000;
		};
		class arifle_MXC_Black_F: arifle_MXC_F {};
		class arifle_MXC_khk_F: arifle_MXC_F {};
		class IP_arifle_MXC_sand_F
		{
			merc = 0;
			origin = "EF";
			price = 4000;
			show = 0;
		};
		class IP_arifle_MXC_desert_F: IP_arifle_MXC_sand_F {};
		class IP_arifle_MXC_Sage_F: IP_arifle_MXC_sand_F {};
		class IP_arifle_MXC_Altis_F: IP_arifle_MXC_sand_F {};
		class IP_arifle_MXC_Green_F: IP_arifle_MXC_sand_F 
		{
			merc = 1;
			show = 1;
		};
		class IP_arifle_MXC_Woodland_F: IP_arifle_MXC_Green_F {};
		class IP_arifle_MXC_White_F: IP_arifle_MXC_sand_F {};
		class IP_arifle_MXC_Snow_F: IP_arifle_MXC_sand_F {};
		class IP_arifle_MXC_Black_F: IP_arifle_MXC_Green_F {};
		class IP_arifle_MXC_Black_Digi_F: IP_arifle_MXC_Green_F {};
		class hlc_rifle_aku12
		{
			origin = "Russia";
			price = 4000;
		};
	};
	
	class Rifles
	{
		basePrice = 3000;
		displayName = "Rifles";
		
		class arifle_AKM_F
		{
			origin = "Russia";
			price = 3000;
		};
		class hlc_rifle_ak47
		{
			origin = "Russia";
			price = 3000;
		};
		class hlc_rifle_akm
		{
			origin = "Russia";
			price = 3000;
		};
		class arifle_TRG21_F
		{
			origin = "Israel";
			price = 3500;
		};
		class IP_arifle_TRG21_FBlack: arifle_TRG21_F {};
		class IP_arifle_TRG21_FTriangle: arifle_TRG21_F
		{
			merc = 0;
			show = 0;
		};
		class arifle_Mk20_plain_F
		{
			origin = "EF";
			price = 3500;
		};
		class arifle_Mk20_F: arifle_Mk20_plain_F {};
		class arifle_SPAR_01_blk_F
		{
			origin = "Germany";
			price = 3500;
		};
		class arifle_SPAR_01_khk_F: arifle_SPAR_01_blk_F {};
		class arifle_SPAR_01_snd_F: arifle_SPAR_01_blk_F {};
		class IP_arifle_Mk20_FBlack: arifle_Mk20_plain_F {};
		class hlc_rifle_STG58F
		{
			origin = "EF";
			price = 3500;
		};
		class hlc_rifle_ak74
		{
			origin = "Russia";
			price = 3500;
		};
		class hlc_rifle_aks74
		{
			origin = "Russia";
			price = 3500;
		};
		class hlc_rifle_l1a1slr
		{
			origin = "Britain";
			price = 3500;
		};
		class hlc_rifle_SLR
		{
			origin = "Australia";
			price = 3500;
		};
		class hlc_rifle_SLRchopmod
		{
			origin = "Australia";
			price = 3500;
		};
		class hlc_rifle_FAL5061
		{
			origin = "EF";
			price = 3500;
		};
		class hlc_rifle_c1A1
		{
			origin = "Canada";
			price = 3500;
		};
		class hlc_rifle_LAR
		{
			origin = "Israel";
			price = 3500;
		};
		class hlc_rifle_g3a3
		{
			origin = "EF";
			price = 3500;
		};
		class hlc_rifle_g3ka4
		{
			origin = "EF";
			price = 3500;
		};
		class hlc_rifle_Colt727
		{
			origin = "USA";
			price = 3500;
		};
		class hlc_rifle_bcmjack
		{
			origin = "USA";
			price = 3500;
		};
		class hlc_rifle_Bushmaster300
		{
			origin = "USA";
			price = 3500;
		};		
		class hlc_rifle_vendimus
		{
			origin = "USA";
			price = 3500;
		};
		class hlc_rifle_honeybase
		{
			origin = "USA";
			price = 3500;
		};
		class hlc_rifle_honeybadger
		{
			origin = "USA";
			price = 3500;
		};
		class hlc_rifle_m4
		{
			origin = "USA";
			price = 3500;
		};		
		class hlc_rifle_aug
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_auga1_t: hlc_rifle_aug {};
		class hlc_rifle_auga1_B: hlc_rifle_aug {};
		class hlc_rifle_aughbar
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_aughbar_b: hlc_rifle_aughbar {};
		class hlc_rifle_aughbar_t: hlc_rifle_aughbar {};
		class hlc_rifle_auga2
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_auga2_b: hlc_rifle_auga2 {};
		class hlc_rifle_auga2_t: hlc_rifle_auga2 {};
		class hlc_rifle_auga2lsw
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_auga2lsw_t: hlc_rifle_auga2lsw {};
		class hlc_rifle_auga2lsw_b: hlc_rifle_auga2lsw {};
		class hlc_rifle_augsr
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_augsr_b: hlc_rifle_augsr {};
		class hlc_rifle_augsr_t: hlc_rifle_augsr {};
		class hlc_rifle_augsrhbar
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_augsrhbar_b: hlc_rifle_augsrhbar {};
		class hlc_rifle_augsrhbar_t: hlc_rifle_augsrhbar {};
		class hlc_rifle_auga3
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_auga3_bl: hlc_rifle_auga3 {};
		class hlc_rifle_auga3_b: hlc_rifle_auga3 {};
		class arifle_CTAR_blk_F
		{
			origin = "China";
			price = 4000;
		};		
		class hlc_rifle_aek971
		{
			origin = "Russia";
			price = 4000;
		};
		class arifle_AK12_F
		{
			origin = "Russia";
			price = 4500;
		};
		class hlc_rifle_ak12
		{
			origin = "Russia";
			price = 5000;
		};
		class arifle_Katiba_F
		{
			origin = "Iran";
			price = 5000;
		};
		class arifle_MX_F
		{
			origin = "USA";
			price = 5000;
		};
		class arifle_MX_black_F: arifle_MX_F {};
		class arifle_MX_khk_F: arifle_MX_F {};
		class IP_arifle_MX_sand_F
		{
			origin = "EF";
			price = 5000;
		};
		class IP_arifle_MX_desert_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_Sage_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_Altis_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_Green_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_Woodland_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_White_F: IP_arifle_MX_sand_F 
		{
			merc = 0;
			show = 0;
		};
		class IP_arifle_MX_Snow_F: IP_arifle_MX_White_F {};
		class IP_arifle_MX_Black_F: IP_arifle_MX_sand_F {};
		class IP_arifle_MX_Black_Digi_F: IP_arifle_MX_sand_F {};
	};
	
	class RiflesU
	{
		displayName = "Rifles (Underwater)";
		
		class arifle_SDAR_F
		{
			price = 7500;
		};		
	};
	
	class RiflesGL
	{
		basePrice = 4000;
		displayName = "Rifles (GL)";
		
		class hlc_rifle_akmgl
		{
			origin = "Russia";
			price = 3500;
		};
		class arifle_TRG21_GL_F
		{
			origin = "Israel";
			price = 4000;
		};
		class IP_arifle_TRG21_GL_FBlack: arifle_TRG21_GL_F {};
		class IP_arifle_TRG21_GL_FTriangle: arifle_TRG21_GL_F
		{
			merc = 0;
			show = 0;
		};
		class arifle_Mk20_GL_plain_F
		{
			origin = "EF";
			price = 4000;
		};
		class arifle_Mk20_GL_F: arifle_Mk20_GL_plain_F {};
		class IP_arifle_Mk20_GL_FBlack: arifle_Mk20_GL_plain_F {};
		class arifle_SPAR_01_GL_blk_F
		{
			origin = "Germany";
			price = 4000;
		};
		class arifle_SPAR_01_GL_khk_F: arifle_SPAR_01_GL_blk_F {};
		class arifle_SPAR_01_GL_snd_F: arifle_SPAR_01_GL_blk_F {};
		class hlc_rifle_auga3_GL
		{
			origin = "Austria";
			price = 3500;
		};
		class hlc_rifle_auga3_GL_BL: hlc_rifle_auga3_GL {};
		class hlc_rifle_auga3_GL_B: hlc_rifle_auga3_GL {};
		class hlc_rifle_aks74_GL
		{
			origin = "Russia";
			price = 4000;
		};
		class hlc_rifle_osw_GL
		{
			origin = "Britain";
			price = 4000;
		};
		class HLC_Rifle_g3ka4_GL
		{
			origin = "EF";
			price = 4000;
		};
		class hlc_rifle_Colt727_GL
		{
			origin = "USA";
			price = 4000;
		};
		class hlc_rifle_m4m203
		{
			origin = "USA";
			price = 4000;
		};
		class arifle_CTAR_GL_blk_F
		{
			origin = "China";
			price = 4500;
		};
		class arifle_AK12_GL_F
		{
			origin = "Russia";
			price = 5500;
		};
		class hlc_rifle_ak12GL
		{
			origin = "Russia";
			price = 6000;
		};
		class arifle_Katiba_GL_F
		{
			origin = "Iran";
			price = 6000;
		};
		class arifle_MX_GL_F
		{
			origin = "USA";
			price = 6000;
		};
		class arifle_MX_GL_black_F: arifle_MX_GL_F {};
		class arifle_MX_GL_khk_F: arifle_MX_GL_F {};
		class IP_arifle_MX_GL_sand_F
		{
			origin = "EF";
			price = 6000;
		};
		class IP_arifle_MX_GL_desert_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_Sage_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_Altis_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_Green_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_Woodland_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_White_F: IP_arifle_MX_GL_sand_F
		{
			merc = 0;
			show = 0;			
		};
		class IP_arifle_MX_GL_Snow_F: IP_arifle_MX_GL_White_F {};
		class IP_arifle_MX_GL_Black_F: IP_arifle_MX_GL_sand_F {};
		class IP_arifle_MX_GL_Black_Digi_F: IP_arifle_MX_GL_sand_F {};
		class arifle_ARX_blk_F
		{
			origin = "China";
			price = 6500;
		};
		class arifle_ARX_ghex_F: arifle_ARX_blk_F {};
		class arifle_ARX_hex_F: arifle_ARX_blk_F {};
	};
	
	class LMG
	{
		basePrice = 5000;
		displayName = "L/MGs";
		
		class arifle_SPAR_02_blk_F
		{
			origin = "Germany";
			price = 4500;
		};
		class arifle_SPAR_02_khk_F: arifle_SPAR_02_blk_F {};
		class arifle_SPAR_02_snd_F: arifle_SPAR_02_blk_F {};
		class arifle_CTARS_blk_F
		{
			origin = "China";
			price = 5000;
		};
		class hlc_rifle_rpk
		{
			origin = "Russia";
			price = 5000;
		};
		class hlc_rifle_rpk74n
		{
			origin = "Russia";
			price = 5500;
		};
		class LMG_03_F
		{
			origin = "USA";
			price = 6000;
		};		
		class hlc_lmg_minimipara
		{
			origin = "USA";
			price = 6000;
		};
		class hlc_lmg_minimi: hlc_lmg_minimipara {};
		class hlc_lmg_minimi_railed: hlc_lmg_minimipara {};
		class hlc_lmg_m249para: hlc_lmg_minimipara {};
		class hlc_lmg_M249E2: hlc_lmg_minimipara {};
		class hlc_m249_pip1: hlc_lmg_minimipara {};
		class hlc_m249_pip2: hlc_lmg_minimipara {};
		class hlc_m249_pip3: hlc_lmg_minimipara {};
		class hlc_m249_pip4: hlc_lmg_minimipara {};		
		class arifle_MX_SW_F
		{
			origin = "USA";
			price = 6000;
		};
		class arifle_MX_SW_black_F: arifle_MX_SW_F {};
		class arifle_MX_SW_khk_F: arifle_MX_SW_F {};
		class IP_arifle_MX_SW_sand_F
		{
			origin = "EF";
			price = 6000;
		};
		class IP_arifle_MX_SW_desert_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_Sage_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_Altis_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_Green_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_Woodland_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_White_F: IP_arifle_MX_SW_sand_F
		{
			merc = 0;
			show = 0;			
		};
		class IP_arifle_MX_SW_Snow_F: IP_arifle_MX_SW_White_F {};
		class IP_arifle_MX_SW_Black_F: IP_arifle_MX_SW_sand_F {};
		class IP_arifle_MX_SW_Black_Digi_F: IP_arifle_MX_SW_sand_F {};
		class hlc_rifle_rpk12
		{
			origin = "Russia";
			price = 6000;
		};
		class hlc_lmg_M60E4
		{
			origin = "USA";
			price = 6500;
		};
		class LMG_Mk200_F
		{
			origin = "USA";
			price = 7000;
		};
		class LMG_Zafir_F
		{
			origin = "Israel";
			price = 7500;
		};
		class MMG_01_hex_F
		{
			merc = 0;
			origin = "EF";
			price = 9000;
			show = 0;
		};
		class MMG_01_tan_F: MMG_01_hex_F {};
		class IP_MMG_01_Black_F: MMG_01_hex_F
		{
			merc = 1;
			show = 1;			
		};
		class IP_MMG_01_Snow_F: MMG_01_hex_F {};
		class IP_MMG_01_SnowHex_F: MMG_01_hex_F {};
		class MMG_02_camo_F
		{
			merc = 0;
			origin = "USA";
			price = 9000;
			show = 0;
		};
		class MMG_02_sand_F: MMG_02_camo_F {};
		class MMG_02_black_F: MMG_02_camo_F
		{
			merc = 1;
			show = 1;			
		};
	};
	
	class Marksman
	{
		basePrice = 5000;
		displayName = "Marksman Rifles";
		
		class hlc_rifle_SAMR
		{
			origin = "USA";
			price = 4000;
		};
		class srifle_DMR_07_blk_F
		{
			origin = "China";
			price = 5500;
		};
		class srifle_DMR_07_ghex_F: srifle_DMR_07_blk_F {};
		class srifle_DMR_07_hex_F: srifle_DMR_07_blk_F {};
		class arifle_MXM_F
		{
			origin = "USA";
			price = 6000;
		};
		class arifle_MXM_Black_F: arifle_MXM_F {};
		class arifle_MXM_khk_F: arifle_MXM_F {};
		class IP_arifle_MXM_sand_F
		{
			origin = "EF";
			price = 6000;
		};
		class IP_arifle_MXM_desert_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_Sage_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_Altis_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_Green_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_Woodland_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_White_F: IP_arifle_MXM_sand_F
		{
			merc = 0;
			show = 0;			
		};
		class IP_arifle_MXM_Snow_F: IP_arifle_MXM_White_F {};
		class IP_arifle_MXM_Black_F: IP_arifle_MXM_sand_F {};
		class IP_arifle_MXM_Black_Digi_F: IP_arifle_MXM_sand_F {};
		class srifle_DMR_06_olive_F
		{
			origin = "USA";
			price = 6000;
		};
		class srifle_DMR_06_camo_F: srifle_DMR_06_olive_F {};
		class hlc_rifle_g3sg1
		{
			origin = "EF";
			price = 6000;
		};
		class hlc_rifle_M14
		{
			origin = "USA";
			price = 6000;
		};
		class hlc_rifle_M21
		{
			origin = "USA";
			price = 6000;
		};
		class hlc_rifle_M14DMR
		{
			origin = "USA";
			price = 6000;
		};
		class hlc_rifle_m14sopmod
		{
			origin = "USA";
			price = 6000;
		};
		class srifle_DMR_01_F
		{
			origin = "Russia";
			price = 7000;
		};
		class srifle_EBR_F
		{
			origin = "USA";
			price = 7000;
		};
		class arifle_SPAR_03_blk_F
		{
			origin = "Germany";
			price = 6500;
		};
		class arifle_SPAR_03_khk_F: arifle_SPAR_03_blk_F {};
		class arifle_SPAR_03_snd_F: arifle_SPAR_03_blk_F {};
		class srifle_DMR_03_F
		{
			origin = "EF";
			price = 7000;
		};
		class srifle_DMR_03_camo_F: srifle_DMR_03_F {};
		class srifle_DMR_03_khaki_F: srifle_DMR_03_F {};
		class srifle_DMR_03_tan_F: srifle_DMR_03_F {};
		class srifle_DMR_03_multicam_F: srifle_DMR_03_F {};
		class srifle_DMR_03_woodland_F: srifle_DMR_03_F {};
		class IP_srifle_DMR_03_Snow_F: srifle_DMR_03_khaki_F
		{
			merc = 0;
			show = 0;			
		};
		class IP_srifle_DMR_03_Triangle_F: srifle_DMR_03_F {};
		class IP_srifle_DMR_03_SnowHex_F: IP_srifle_DMR_03_Snow_F {};
		class srifle_DMR_04_F
		{
			origin = "Russia";
			price = 9000;
		};
		class srifle_DMR_04_Tan_F: srifle_DMR_04_F {};
		class IP_srifle_DMR_04_SnowHex_F: srifle_DMR_04_Tan_F
		{
			merc = 0;
			show = 0;			
		};
		class srifle_DMR_05_blk_F
		{
			origin = "Iran";
			price = 9000;
		};
		class srifle_DMR_05_hex_F: srifle_DMR_05_blk_F {};
		class srifle_DMR_05_tan_f: srifle_DMR_05_blk_F {};		
		class IP_srifle_DMR_05_SnowHex_F: srifle_DMR_05_tan_f
		{
			merc = 0;
			show = 0;			
		};
		class srifle_DMR_02_F
		{
			origin = "USA";
			price = 9000;
		};
		class srifle_DMR_02_camo_F: srifle_DMR_02_F {};
		class srifle_DMR_02_sniper_F: srifle_DMR_02_F {};
		class IP_srifle_DMR_02_Snow_F: srifle_DMR_02_sniper_F
		{
			merc = 0;
			show = 0;			
		};
	};
	
	class Sniper
	{
		basePrice = 7000;
		displayName = "Sniper Rifles";
		
		class hlc_rifle_psg1
		{
			origin = "EF";
			price = 8000;
		};
		class hlc_rifle_awcovert
		{
			origin = "USA";
			price = 8000;
		};
		class hlc_rifle_awcovert_BL: hlc_rifle_awcovert {};
		class hlc_rifle_awcovert_FDE: hlc_rifle_awcovert {};
		class hlc_rifle_awmagnum
		{
			origin = "USA";
			price = 8000;
		};
		class hlc_rifle_awmagnum_BL: hlc_rifle_awmagnum {};
		class hlc_rifle_awmagnum_FDE: hlc_rifle_awmagnum {};
		class hlc_rifle_awMagnum_FDE_ghillie: hlc_rifle_awmagnum {};
		class hlc_rifle_awMagnum_BL_ghillie: hlc_rifle_awmagnum {};
		class hlc_rifle_awMagnum_OD_ghillie: hlc_rifle_awmagnum {};		
		class srifle_GM6_F
		{
			origin = "EF";
			price = 10000;
		};
		class srifle_GM6_camo_F: srifle_GM6_F {};
		class srifle_GM6_ghex_F: srifle_GM6_F {};
		class srifle_LRR_F
		{
			origin = "USA";
			price = 10000;
		};
		class srifle_LRR_camo_F: srifle_LRR_F {};
		class srifle_LRR_tna_F: srifle_LRR_F {};
	};
	
	class Launchers
	{
		basePrice = 9000;
		displayName = "Launchers";
		
		class launch_RPG7_F
		{
			origin = "Russia";
			price = 7500;
		};
		class launch_RPG32_F
		{
			origin = "Iran";
			price = 10000;
		};
		class launch_NLAW_F
		{
			origin = "USA";
			price = 15000;
		};
		class launch_Titan_short_F
		{
			merc = 0;
			origin = "USA";
			price = 25000;
			show = 0;
		};
		class launch_B_Titan_short_F: launch_Titan_short_F {};
		class launch_I_Titan_short_F: launch_Titan_short_F
		{
			merc = 1;
			show = 1;			
		};
		class launch_O_Titan_short_F: launch_Titan_short_F {};
		class IP_launch_B_Titan_short_snw_F: launch_Titan_short_F
		{
			merc = 0;
			show = 1;			
		};
		class IP_launch_O_Titan_short_snw_F: launch_Titan_short_F
		{
			merc = 0;
			show = 1;			
		};
		class launch_Titan_F
		{
			merc = 0;
			origin = "USA";
			price = 25000;
			show = 0;
		};
		class launch_B_Titan_F: launch_Titan_F {};
		class launch_I_Titan_F: launch_Titan_F
		{
			merc = 1;
			show = 1;			
		};
		class launch_O_Titan_F: launch_Titan_F {};
		class IP_launch_B_Titan_snw_F: launch_Titan_F
		{
			merc = 0;
			show = 1;			
		};
		class IP_launch_O_Titan_snw_F: launch_Titan_F
		{
			merc = 0;
			show = 1;			
		};
	};
};