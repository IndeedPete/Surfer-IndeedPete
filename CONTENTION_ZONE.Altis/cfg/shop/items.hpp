class ShopItems
{
	// Misc
	class Misc
	{	
		displayName = "Miscellaneous";
		
		// Kits
		class FirstAidKit
		{
			price = 100;
		};
		class ItemCompass
		{
			price = 50;
		};
		class ItemWatch
		{
			price = 100;
		};
		class ItemMap
		{
			price = 150;
		};		
		class ItemRadio
		{
			price = 250;
		};
		class ItemGPS
		{
			price = 250;
		};
		class Medikit
		{
			price = 2000;
		};
		class Toolkit
		{
			price = 2000;
		};
		class MineDetector
		{
			price = 1000;
		};
		class B_UavTerminal
		{
			price = 4000;
			show = 1;
		};
		class I_UavTerminal: B_UavTerminal
		{
			show = 0;
		};
		class O_UavTerminal: I_UavTerminal {};
		// non weapon optics
		class NVGoggles
		{
			price = 2000;
			show = 1;
		};
		class NVGoggles_INDEP: NVGoggles {};
		class NVGoggles_OPFOR: NVGoggles {};
		class NVGoggles_tna_F: NVGoggles {};
		class IP_NVGoggles_SNW: NVGoggles
		{
			show = 0;
		};
		class O_NVGoggles_ghex_F
		{
			price = 2000;
			show = 1;
		};
		class O_NVGoggles_hex_F: O_NVGoggles_ghex_F {};
		class O_NVGoggles_urb_F: O_NVGoggles_ghex_F {};
		class NVGogglesB_blk_F
		{
			price = 4000;
			show = 1;
		};
		class NVGogglesB_grn_F: NVGogglesB_blk_F {};
		class NVGogglesB_gry_F: NVGogglesB_blk_F {};
	};
	
	// Vests (Light)
	class VestsLight
	{
		basePrice = 500;
		displayName = "Vests (Light)";
		
		class V_Rangemaster_belt
		{
			price = 250;
		};		
		class V_BandollierB_rgr
		{
			price = 500;
		};	
		class V_BandollierB_khk: V_BandollierB_rgr {};
		class V_BandollierB_cbr: V_BandollierB_rgr {};
		class V_BandollierB_blk: V_BandollierB_rgr {};
		class V_BandollierB_oli: V_BandollierB_rgr {};
		class V_BandollierB_ghex_F: V_BandollierB_rgr {};
		class IP_V_BandollierB_snw: V_BandollierB_rgr
		{
			merc = 0;
			show = 0;			
		};
		class IP_V_BandollierO_snw: IP_V_BandollierB_snw {};
		class V_TacChestrig_cbr_F
		{
			price = 750;
		};
		class V_TacChestrig_grn_F: V_TacChestrig_cbr_F {};
		class V_TacChestrig_oli_F: V_TacChestrig_cbr_F {};
	};
	
	// Vests (Medium)
	class VestsMedium
	{
		basePrice = 2000;
		displayName = "Vests (Medium)";
		
		class V_Chestrig_blk
		{
			price = 1000;
		};
		class V_Chestrig_khk: V_Chestrig_blk {};
		class V_Chestrig_oli: V_Chestrig_blk {};
		class V_Chestrig_rgr: V_Chestrig_blk {};
		class V_HarnessO_brn
		{
			price = 1500;
		};	
		class V_HarnessO_gry: V_HarnessO_brn {};
		class V_HarnessO_ghex_F: V_HarnessO_brn {};
		class IP_V_HarnessO_gryST: V_HarnessO_brn
		{
			merc = 0;
			show = 0;			
		};
		class V_HarnessOGL_brn
		{
			price = 1500;
		};
		class V_HarnessOGL_gry: V_HarnessOGL_brn {};
		class V_HarnessOGL_ghex_F: V_HarnessOGL_brn {};
		class IP_V_HarnessOGL_gryST: V_HarnessOGL_brn
		{
			merc = 0;
			show = 0;			
		};
		class V_HarnessOSpec_brn
		{
			price = 1500;
		};
		class V_HarnessOSpec_gry: V_HarnessOSpec_brn {};
		class IP_V_HarnessOSpec_gryST: V_HarnessOSpec_brn
		{
			merc = 0;
			show = 0;			
		};
		class V_TacVest_khk
		{
			price = 1500;	
		};
		class V_TacVest_brn: V_TacVest_khk {};
		class V_TacVest_oli: V_TacVest_khk {};
		class V_TacVest_blk: V_TacVest_khk {};
		class V_TacVest_camo: V_TacVest_khk {};
		class V_TacVest_blk_POLICE: V_TacVest_khk {};
		class V_TacVestCamo_khk: V_TacVest_khk {};
		class V_TacVest_gen_F: V_TacVest_khk {};		
		class IP_V_TacVest_Police: V_TacVest_khk
		{
			merc = 0;
			show = 0;
		};
		class IP_V_TacVest_WoodFlecktarn: V_TacVest_oli {};
		class IP_V_TacVest_WoodUS: V_TacVest_oli {};
		class IP_V_TacVest_WoodSwedish: V_TacVest_oli {};
		class IP_V_TacVest_WoodRussian: V_TacVest_oli {};
		class IP_V_TacVest_WoodMARPAT: V_TacVest_oli {};		
		class IP_V_TacVest_WoodTriangle: V_TacVest_oli {};
		class IP_V_TacVest_USSnow: V_TacVest_oli
		{
			merc = 0;
			show = 0;
		};
		class IP_V_TacVest_SnowBW: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_SnowRussian: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_SnowRed: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_SnowHex: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_SnowTiger: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_MP: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_Paramedic: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_snw: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_snwCamo: IP_V_TacVest_USSnow {};
		class IP_V_TacVest_PIMP: IP_V_TacVest_USSnow {};
		class V_Press_F
		{
			merc = 0;
			price = 2000;
		};
		class IP_V_Press_F: V_Press_F {};
		class IP_V_Press_F_Police: V_Press_F
		{
			show = 0;
		};
		class IP_V_Press_F_WoodFlecktarn: V_Press_F {};	
		class IP_V_Press_F_WoodUS: V_Press_F {};
		class IP_V_Press_F_WoodSwedish: V_Press_F {};
		class IP_V_Press_F_WoodRussian: V_Press_F {};
		class IP_V_Press_F_WoodMARPAT: V_Press_F {};
		class IP_V_Press_F_WoodTriangle: V_Press_F {};
		class IP_V_Press_F_USSnow: IP_V_Press_F_Police {};
		class IP_V_Press_F_SnowBW: IP_V_Press_F_Police {};
		class IP_V_Press_F_SnowRussian: IP_V_Press_F_Police {};
		class IP_V_Press_F_SnowRed: IP_V_Press_F_Police {};		
		class V_TacVestIR_blk
		{
			price = 2000;
		};
		class V_PlateCarrier1_blk
		{
			price = 3000;
		};	
		class V_PlateCarrier1_rgr: V_PlateCarrier1_blk {};
		class V_PlateCarrier1_tna_F: V_PlateCarrier1_blk {};
		class V_PlateCarrier1_rgr_noflag_F: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_rgrEF: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_rgrEFWolf: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_altisEFWolf: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_khkEF: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_khkEFWolf: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_blkEF: V_PlateCarrier1_blk {};		
		class IP_V_PlateCarrier1_blkEFWolf: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_blkEFMP: V_PlateCarrier1_blk {};
		class IP_V_PlateCarrier1_snwEF: V_PlateCarrier1_blk
		{
			merc = 0;
			show = 0;
		};
		class IP_V_PlateCarrier1_snwEFWolf: IP_V_PlateCarrier1_snwEF {};
		class IP_V_PlateCarrier1_snwTX: IP_V_PlateCarrier1_snwEF {};
		class V_PlateCarrierIA1_dgtl
		{
			price = 3000;
		};
		class IP_V_PlateCarrierIA1_Triangle: V_PlateCarrierIA1_dgtl {};
		class IP_V_PlateCarrierIA1_BW: V_PlateCarrierIA1_dgtl {};
		class IP_V_PlateCarrierIA1_US: V_PlateCarrierIA1_dgtl {};
		class IP_V_PlateCarrierIA1_MARPAT: V_PlateCarrierIA1_dgtl {};
		class IP_V_PlateCarrierIA1_Swedish: V_PlateCarrierIA1_dgtl {};
		class IP_V_PlateCarrierIA1_USSnow: V_PlateCarrierIA1_dgtl {};
		class V_PlateCarrier2_rgr
		{
			price = 3500;
		};
		class V_PlateCarrier2_tna_F: V_PlateCarrier2_rgr {};
		class V_PlateCarrier2_rgr_noflag_F: V_PlateCarrier2_rgr {};
		class IP_V_PlateCarrier2_rgrEF: V_PlateCarrier2_rgr {};
		class IP_V_PlateCarrier2_rgrEFWolf: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_altisEFWolf: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_khkEF: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_khkEFWolf: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_blkEF: IP_V_PlateCarrier2_rgrEF {};		
		class IP_V_PlateCarrier2_blkEFWolf: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_blkEFMP: IP_V_PlateCarrier2_rgrEF {};
		class IP_V_PlateCarrier2_snwEF: IP_V_PlateCarrier2_rgrEF
		{
			merc = 0;
			show = 0;
		};
		class IP_V_PlateCarrier2_snwEFWolf: IP_V_PlateCarrier2_snwEF {};
		class IP_V_PlateCarrier2_snwTX: IP_V_PlateCarrier2_snwEF {};
		class V_PlateCarrier3_rgr
		{
			price = 4000;
		};
		class IP_V_PlateCarrier3_rgrEF: V_PlateCarrier3_rgr {};
		class IP_V_PlateCarrier3_rgrEFWolf: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_altisEFWolf: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_khkEF: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_khkEFWolf: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_blkEF: IP_V_PlateCarrier3_rgrEF {};		
		class IP_V_PlateCarrier3_blkEFWolf: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_blkEFMP: IP_V_PlateCarrier3_rgrEF {};
		class IP_V_PlateCarrier3_snwEF: IP_V_PlateCarrier3_rgrEF
		{
			merc = 0;
			show = 0;
		};
		class IP_V_PlateCarrier3_snwEFWolf: IP_V_PlateCarrier3_snwEF {};
		class IP_V_PlateCarrier3_snwTX: IP_V_PlateCarrier3_snwEF {};
		class V_PlateCarrierIA2_dgtl
		{
			price = 4000;
		};
		class IP_V_PlateCarrierIA2_Triangle: V_PlateCarrierIA2_dgtl {};
		class IP_V_PlateCarrierIA2_BW: V_PlateCarrierIA2_dgtl {};
		class IP_V_PlateCarrierIA2_US: V_PlateCarrierIA2_dgtl {};
		class IP_V_PlateCarrierIA2_MARPAT: V_PlateCarrierIA2_dgtl {};
		class IP_V_PlateCarrierIA2_Swedish: V_PlateCarrierIA2_dgtl {};
		class IP_V_PlateCarrierIA2_USSnow: V_PlateCarrierIA2_dgtl
		{
			merc = 0;
			show = 0;
		};
	};
	
	// Vests (Heavy)
	class VestsHeavy
	{
		basePrice = 4000;
		displayName = "Vests (Heavy)";
		
		class V_PlateCarrierIAGL_dgtl
		{
			price = 5000;
		};
		class V_PlateCarrierIAGL_oli: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_Triangle: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_BW: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_US: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_MARPAT: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_Swedish: V_PlateCarrierIAGL_dgtl {};
		class IP_V_PlateCarrierIAGL_USSnow: V_PlateCarrierIAGL_dgtl
		{
			merc = 0;
			show = 0;
		};
		class V_PlateCarrierGL_rgr
		{
			price = 5000;
		};
		class V_PlateCarrierGL_blk: V_PlateCarrierGL_rgr {};
		class V_PlateCarrierGL_mtp: V_PlateCarrierGL_rgr {};
		class V_PlateCarrierGL_tna_F: V_PlateCarrierGL_rgr {};
		class IP_V_PlateCarrierGL_rgrEF: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_rgrEFWolf: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_altisEFWolf: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_khkEF: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_khkEFWolf: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_blkEF: V_PlateCarrierGL_mtp {};		
		class IP_V_PlateCarrierGL_blkEFWolf: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_blkEFMP: V_PlateCarrierGL_mtp {};
		class IP_V_PlateCarrierGL_snwEF: V_PlateCarrierGL_mtp
		{
			merc = 0;
			show = 0;
		};
		class IP_V_PlateCarrierGL_snwEFWolf: IP_V_PlateCarrierGL_snwEF {};
		class IP_V_PlateCarrierGL_snwTX: IP_V_PlateCarrierGL_snwEF {};
		class IP_V_PlateCarrierGL_rgrSnowHex: IP_V_PlateCarrierGL_snwEF {};
		class IP_V_PlateCarrierGL_rgrSnowTiger: IP_V_PlateCarrierGL_snwEF {};		
		class V_PlateCarrierSpec_rgr 
		{
			price = 5000;
		};
		class V_PlateCarrierSpec_blk: V_PlateCarrierSpec_rgr {};
		class V_PlateCarrierSpec_mtp: V_PlateCarrierSpec_rgr {};
		class V_PlateCarrierSpec_tna_F: V_PlateCarrierSpec_rgr {};
		class IP_V_PlateCarrierSpec_rgrEF: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_rgrEFWolf: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_altisEFWolf: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_khkEF: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_khkEFWolf: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_blkEF: V_PlateCarrierSpec_mtp {};		
		class IP_V_PlateCarrierSpec_blkEFWolf: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_blkEFMP: V_PlateCarrierSpec_mtp {};
		class IP_V_PlateCarrierSpec_snwEF: V_PlateCarrierSpec_mtp
		{
			merc = 0;
			show = 0;
		};
		class IP_V_PlateCarrierSpec_snwEFWolf: IP_V_PlateCarrierSpec_snwEF {};
		class IP_V_PlateCarrierSpec_snwTX: IP_V_PlateCarrierSpec_snwEF {};
		class IP_V_PlateCarrierSpec_rgrSnowHex: IP_V_PlateCarrierSpec_snwEF {};
		class IP_V_PlateCarrierSpec_rgrSnowTiger: IP_V_PlateCarrierSpec_snwEF {};
	};
	
	// Diving
	class DivingGear
	{
		displayName = "Diving Gear";
		
		class G_Diving
		{
			price = 250;
		};
		class V_RebreatherB
		{
			merc = 0;
			price = 3000;
			show = 0;
		};	
		class V_RebreatherIR: V_RebreatherB {};
		class V_RebreatherIA: V_RebreatherB
		{
			merc = 1;
			show = 1;			
		};
	};
	
	// Goggles
	class Goggles
	{
		basePrice = 100;
		displayName = "Facewear";
		
		class G_Bandanna_tan
		{
			price = 10;
		};
		class G_Bandanna_blk: G_Bandanna_tan {};
		class G_Bandanna_oli: G_Bandanna_tan {};
		class G_Bandanna_khk: G_Bandanna_tan {};
		class G_Bandanna_beast: G_Bandanna_tan {};
		class G_Bandanna_shades
		{
			price = 110;
		};
		class G_Bandanna_sport
		{
			price = 110;
		};
		class G_Bandanna_aviator
		{
			price = 210;
		};
		class G_Balaclava_blk
		{
			price = 20;
		};
		class G_Balaclava_oli: G_Balaclava_blk {};
		class IP_G_Balaclava_snw: G_Balaclava_blk {};
		class G_Balaclava_lowprofile
		{
			price = 70;
		};
		class G_Balaclava_combat
		{
			price = 320;
		};
		class G_Spectacles
		{
			price = 50;
		};	
		class G_Spectacles_Tinted: G_Spectacles {};		
		class G_Lowprofile
		{
			price = 50;
		};	
		class G_Squares
		{
			price = 50;
		};
		class G_Squares_Tinted: G_Squares {};
		class G_Sport_Blackred
		{
			price = 100;
		};
		class G_Sport_BlackWhite: G_Sport_Blackred {};
		class G_Sport_Blackyellow: G_Sport_Blackred {};
		class G_Sport_Greenblack: G_Sport_Blackred {};
		class G_Sport_Checkered: G_Sport_Blackred {};
		class G_Sport_Red: G_Sport_Blackred {};
		class G_Shades_Black
		{
			price = 100;
		};	
		class G_Shades_Blue: G_Shades_Black {};
		class G_Shades_Green: G_Shades_Black {};
		class G_Shades_Red: G_Shades_Black {};		
		class G_Lady_Mirror
		{
			price = 150;
		};	
		class G_Lady_Dark: G_Lady_Mirror {};
		class G_Lady_Red: G_Lady_Mirror {};
		class G_Lady_Blue: G_Lady_Mirror {};
		class G_Aviator
		{
			price = 200;
		};
		class Mask_M40
		{
			price = 250;
		};
		class Mask_M40_OD: Mask_M40 {};
		class Mask_M50: Mask_M40 {};
		class G_Combat
		{
			price = 300;
		};
		class G_Tactical_Black
		{
			//description = "Compatible to BIS Glass.";
			price = 500;
		};
		class G_Tactical_Clear
		{
			//description = "Compatible to BIS Glass.";
			price = 500;
		};
		class G_Balaclava_TI_blk_F
		{
			price = 500;
		};
		class G_Balaclava_TI_tna_F: G_Balaclava_TI_blk_F {};
		class G_Balaclava_TI_G_blk_F
		{
			price = 800;
		};
		class G_Balaclava_TI_G_tna_F: G_Balaclava_TI_G_blk_F {};
	};	
	
	// Headgear (Soft)
	class HeadgearSoft
	{
		basePrice = 15;
		displayName = "Headgear (Soft)";
		
		class H_Bandanna_surfer
		{
			merc = 0;
			price = 10;
		};
		class H_Bandanna_khk: H_Bandanna_surfer {};
		class H_Bandanna_cbr: H_Bandanna_khk {};
		class H_Bandanna_sgg: H_Bandanna_surfer
		{
			merc = 1;
		};
		class H_Bandanna_gry: H_Bandanna_sgg {};
		class H_Bandanna_camo: H_Bandanna_sgg {};
		class H_Bandanna_mcamo: H_Bandanna_khk {};
		class H_Bandanna_khk_hs
		{
			price = 30;
		};
		class IP_H_Bandanna_snw: H_Bandanna_khk_hs
		{
			merc = 0;
		};
		class IP_H_Bandanna_snwCamo: IP_H_Bandanna_snw {};
		class H_Shemag_khk
		{
			price = 20;
		};
		class H_Shemag_tan: H_Shemag_khk {};
		class H_Shemag_olive: H_Shemag_khk {};
		class H_ShemagOpen_khk: H_Shemag_khk {};
		class H_ShemagOpen_tan: H_Shemag_khk {};
		class H_Shemag_olive_hs
		{
			price = 40;
		};		
		class H_Booniehat_khk
		{
			price = 30;
		};
		class H_Booniehat_indp: H_Booniehat_khk {};
		class H_Booniehat_mcamo: H_Booniehat_khk {};
		class H_Booniehat_grn: H_Booniehat_khk {};
		class H_Booniehat_tan: H_Booniehat_khk {};
		class H_Booniehat_dirty: H_Booniehat_khk {};
		class H_Booniehat_tna_F: H_Booniehat_khk {};
		class IP_H_Booniehat_mcamoEFAltis: H_Booniehat_mcamo {};
		class IP_H_Booniehat_mcamoEFBlack: H_Booniehat_khk {};
		class IP_H_Booniehat_mcamoEFDesert: H_Booniehat_mcamo {};
		class IP_H_Booniehat_mcamoEFNavy: H_Booniehat_mcamo {};
		class IP_H_Booniehat_mcamoEFSnow: H_Booniehat_khk
		{
			merc = 0;
			show = 0;
		};
		class IP_H_Booniehat_mcamoEFWoodland: H_Booniehat_khk {};		
		class IP_H_Booniehat_HexSnow: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_SnowTiger: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_mcamoPO: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_mcamoWoodFlecktarn: H_Booniehat_khk {};
		class IP_H_Booniehat_mcamoWoodUS: H_Booniehat_khk {};
		class IP_H_Booniehat_mcamoWoodSwedish: H_Booniehat_khk {};		
		class IP_H_Booniehat_mcamoWoodRussian: H_Booniehat_khk {};
		class IP_H_Booniehat_mcamoWoodMARPAT: H_Booniehat_khk {};		
		class IP_H_Booniehat_Triangle: H_Booniehat_khk {};
		class IP_H_Booniehat_USSnow: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_mcamoSnowBW: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_mcamoSnowRussian: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_mcamoSnowRed: IP_H_Booniehat_mcamoEFSnow {};
		class IP_H_Booniehat_BA: IP_H_Booniehat_mcamoEFSnow {};		
		class H_Booniehat_khk_hs
		{
			price = 50;
		};
		class H_Cap_red
		{
			merc = 0;
			price = 40;
		};
		class H_Cap_blu: H_Cap_red {};
		class H_Cap_oli: H_Cap_red
		{
			merc = 1;
		};
		class H_Cap_tan: H_Cap_red {};
		class H_Cap_blk: H_Cap_oli {};
		class H_Cap_blk_CMMG: H_Cap_oli {};
		class H_Cap_brn_SPECOPS: H_Cap_oli {};
		class H_Cap_tan_specops_US: H_Cap_red {};
		class H_Cap_khaki_specops_UK: H_Cap_oli {};
		class H_Cap_grn: H_Cap_oli {};
		class H_Cap_grn_BI: H_Cap_oli {};
		class H_Cap_blk_Raven: H_Cap_oli {};
		class H_Cap_blk_ION: H_Cap_oli {};
		class H_Cap_press: H_Cap_red
		{
			show = 0;
		};
		class IP_H_Cap_blue_PO: H_Cap_red {};
		class IP_H_Cap_khaki_BSM: H_Cap_red {};
		class IP_H_Cap_khaki_EF: H_Cap_press
		{
			merc = 1;
		};
		class IP_H_Cap_red_paramedic_EF: H_Cap_press {};
		class H_BandMask_blk
		{
			price = 50;
		};	
		class H_Cap_headphones
		{
			price = 60;
		};
		class H_Watchcap_blk
		{
			price = 40;
		};
		class H_Watchcap_khk: H_Watchcap_blk {};
		class H_Watchcap_camo: H_Watchcap_blk {};
		class H_Watchcap_sgg: H_Watchcap_blk {};
		class IP_H_Watchcap_blue: H_Watchcap_blk
		{
			merc = 0;
		};
		class IP_H_Watchcap_snw: IP_H_Watchcap_blue {};		
		class H_MilCap_ocamo
		{
			price = 60;
			merc = 0;
		};
		class H_MilCap_mcamo: H_MilCap_ocamo {};
		class H_MilCap_ghex_F: H_MilCap_ocamo {};
		class H_MilCap_tna_F: H_MilCap_ocamo {};
		class H_MilCap_gen_F: H_MilCap_ocamo {};
		class H_MilCap_oucamo: H_MilCap_ocamo
		{
			show = 1;
			merc = 1;
		};
		class H_MilCap_rucamo: H_MilCap_oucamo {};
		class H_MilCap_gry: H_MilCap_oucamo {};
		class H_MilCap_blue: H_MilCap_oucamo {};		
		class IP_H_MilCap_mcamoEFAltis: H_MilCap_ocamo {};
		class IP_H_MilCap_mcamoEFBlack: H_MilCap_oucamo {};
		class IP_H_MilCap_mcamoEFDesert: H_MilCap_ocamo {};
		class IP_H_MilCap_mcamoEFNavy: H_MilCap_ocamo {};
		class IP_H_MilCap_mcamoEFSnow: H_MilCap_oucamo
		{
			merc = 0;
			show = 0;
		};
		class IP_H_MilCap_mcamoEFWoodland: H_MilCap_oucamo {};		
		class IP_H_MilCap_bluePO: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_blueWoodFlecktarn: H_MilCap_oucamo {};
		class IP_H_MilCap_blueWoodUS: H_MilCap_oucamo {};
		class IP_H_MilCap_blueWoodSwedish: H_MilCap_oucamo {};
		class IP_H_MilCap_blueWoodRussian: H_MilCap_oucamo {};
		class IP_H_MilCap_blueWoodMARPAT: H_MilCap_oucamo {};		
		class IP_H_MilCap_WoodTriangle: H_MilCap_oucamo {};
		class IP_H_MilCap_USSnow: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_blueSnowBW: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_blueSnowRussian: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_blueSnowRed: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_HexSnow: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_SnowTiger: IP_H_MilCap_mcamoEFSnow {};
		class IP_H_MilCap_BA: IP_H_MilCap_mcamoEFSnow {};		
		class H_Beret_blk
		{
			price = 60;
		};
		class H_Beret_blk_POLICE: H_Beret_blk
		{
			merc = 0;
		};
		class H_Beret_red: H_Beret_blk {};
		class H_Beret_grn: H_Beret_blk {};
		class H_Beret_grn_SF: H_Beret_blk {};
		class H_Beret_brn_SF: H_Beret_blk {};
		class H_Beret_gen_F: H_Beret_blk {};
		class H_Beret_02
		{
			merc = 0;
			price = 100;
			show = 0;
		};
		class IP_H_Beret_02EF: H_Beret_02 {};
		class IP_H_Beret_02CSAT: H_Beret_02 {};
		class IP_H_Beret_02SnowTiger: H_Beret_02 {};
		class H_StrawHat
		{
			merc = 0;
			price = 100;
		};
		class H_StrawHat_dark: H_StrawHat {};
		class H_Hat_blue: H_StrawHat {};
		class H_Hat_brown: H_StrawHat {};
		class H_Hat_camo: H_StrawHat {};
		class H_Hat_grey: H_StrawHat {};
		class H_Hat_checker: H_StrawHat {};
		class H_Hat_tan: H_StrawHat {};
	};
	
	// Headgear (Combat)
	class HeadgearCombat
	{
		basePrice = 1000;
		displayName = "Headgear (Combat)";
		
		class H_Helmet_Skate
		{
			price = 500;
		};
		class H_HelmetB_light
		{
			price = 1000;
		};
		class H_HelmetB_light_grass: H_HelmetB_light {};
		class H_HelmetB_light_snakeskin: H_HelmetB_light {};
		class H_HelmetB_light_desert: H_HelmetB_light {};
		class H_HelmetB_light_black: H_HelmetB_light {};
		class H_HelmetB_light_sand: H_HelmetB_light {};
		class H_HelmetB_Light_tna_F: H_HelmetB_light {};
		class IP_H_HelmetB_light_Black: H_HelmetB_light {};
		class IP_H_HelmetB_light_Black_Digi: H_HelmetB_light {};
		class IP_H_HelmetB_light_khaki: H_HelmetB_light {};
		class IP_H_HelmetB_light_Desert: H_HelmetB_light {};
		class IP_H_HelmetB_light_Green_Sand: H_HelmetB_light {};		
		class IP_H_HelmetB_light_Altis: H_HelmetB_light {};
		class IP_H_HelmetB_light_Green: H_HelmetB_light {};
		class IP_H_HelmetB_light_Woodland: H_HelmetB_light {};
		class IP_H_HelmetB_light_White: H_HelmetB_light 
		{
			merc = 0;
			show = 0;
		};
		class IP_H_HelmetB_light_Snow: IP_H_HelmetB_light_White {};
		class H_HelmetIA
		{
			price = 2000;
		};
		class IP_H_HelmetIA_NavyRussian: H_HelmetIA
		{
			merc = 0;
			show = 0;
		};
		class IP_H_HelmetIA_WoodFlecktarn: H_HelmetIA {};
		class IP_H_HelmetIA_WoodUS: H_HelmetIA {};
		class IP_H_HelmetIA_WoodSwedish: H_HelmetIA {};
		class IP_H_HelmetIA_WoodRussian: H_HelmetIA {};
		class IP_H_HelmetIA_WoodMARPAT: H_HelmetIA {};
		class IP_H_HelmetIA_Triangle: H_HelmetIA {};
		class IP_H_HelmetIA_USSnow: IP_H_HelmetIA_NavyRussian {};
		class IP_H_HelmetIA_SnowBW: IP_H_HelmetIA_NavyRussian {};		
		class IP_H_HelmetIA_SnowRussian: IP_H_HelmetIA_NavyRussian {};
		class IP_H_HelmetIA_SnowRed: IP_H_HelmetIA_NavyRussian {};
		class IP_H_HelmetIA_BA: IP_H_HelmetIA_NavyRussian {};
		class IP_H_HelmetIA_Press: H_HelmetIA
		{
			merc = 0;
			show = 0;
		};		
		class H_HelmetB
		{
			price = 2000;
		};
		class H_HelmetB_plain_mcamo: H_HelmetB {};
		class H_HelmetB_plain_blk: H_HelmetB {};
		class H_HelmetB_camo: H_HelmetB {};
		class H_HelmetB_paint: H_HelmetB {};
		class H_HelmetB_tna_F: H_HelmetB {};
		class IP_H_HelmetB_Black: H_HelmetB {};
		class IP_H_HelmetB_Black_Digi: H_HelmetB {};
		class IP_H_HelmetB_khaki: H_HelmetB_plain_mcamo {};
		class IP_H_HelmetB_Desert: H_HelmetB_plain_mcamo {};
		class IP_H_HelmetB_Green_Sand: H_HelmetB_plain_mcamo {};		
		class IP_H_HelmetB_Altis: H_HelmetB_plain_mcamo {};
		class IP_H_HelmetB_Green: H_HelmetB {};
		class IP_H_HelmetB_Woodland: H_HelmetB {};
		class IP_H_HelmetB_White: H_HelmetB
		{
			merc = 0;
			show = 0;
		};
		class IP_H_HelmetB_Snow: IP_H_HelmetB_White {};		
		class H_HelmetSpecB
		{
			price = 3000;
		};
		class H_HelmetSpecB_paint1: H_HelmetSpecB {};
		class H_HelmetSpecB_paint2: H_HelmetSpecB {};
		class H_HelmetSpecB_blk: H_HelmetSpecB {};
		class H_HelmetB_Enh_tna_F: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_Black: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_Black_Digi: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_khaki: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_Desert: IP_H_HelmetSpecB_khaki {};
		class IP_H_HelmetSpecB_Green_Sand: IP_H_HelmetSpecB_khaki {};		
		class IP_H_HelmetSpecB_Altis: IP_H_HelmetSpecB_khaki {};
		class IP_H_HelmetSpecB_Green: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_Woodland: H_HelmetSpecB {};
		class IP_H_HelmetSpecB_White: H_HelmetSpecB
		{
			merc = 0;
			show = 0;
		};
		class IP_H_HelmetSpecB_Snow: IP_H_HelmetSpecB_White {};
		class H_HelmetO_ocamo
		{
			merc = 0;
			price = 3000;
			show = 0;
		};
		class H_HelmetO_oucamo: H_HelmetO_ocamo {};
		class H_HelmetO_ghex_F: H_HelmetO_ocamo {};
		class IP_H_HelmetO_SnowTiger: H_HelmetO_ocamo {};
		class IP_H_HelmetO_SnowHex: H_HelmetO_ocamo {};
		class H_HelmetLeaderO_ocamo
		{
			merc = 0;
			price = 3000;
			show = 0;
		};
		class H_HelmetLeaderO_oucamo: H_HelmetLeaderO_ocamo {};
		class H_HelmetLeaderO_ghex_F: H_HelmetLeaderO_ocamo {};
		class IP_H_HelmetLeaderO_SnowTiger: H_HelmetLeaderO_ocamo {};
		class IP_H_HelmetLeaderO_SnowHex: H_HelmetLeaderO_ocamo {};
		class H_HelmetSpecO_ocamo
		{
			merc = 0;
			price = 3000;
			show = 0;
		};
		class H_HelmetSpecO_blk: H_HelmetSpecO_ocamo {};
		class H_HelmetSpecO_ghex_F: H_HelmetSpecO_ocamo {};
		class IP_H_HelmetSpecO_SnowTiger: H_HelmetSpecO_ocamo {};
		class IP_H_HelmetSpecO_SnowHex: H_HelmetSpecO_ocamo {};
		class H_HelmetB_TI_tna_F
		{
			price = 3500;
		};
	};
	
	// Headgear (Special)
	class HeadgearSpecial
	{	
		displayName = "Headgear (Special)";
		show = 0;
		
		class H_RacingHelmet_1_F
		{
			price = 1000;
			show = 0;
		};
		class H_RacingHelmet_2_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_3_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_4_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_black_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_blue_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_green_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_red_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_white_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_yellow_F: H_RacingHelmet_1_F {};
		class H_RacingHelmet_1_orange_F: H_RacingHelmet_1_F {};
		class H_HelmetCrew_B
		{
			price = 2000;
		};
		class H_HelmetCrew_I: H_HelmetCrew_B {};
		class H_HelmetCrew_O: H_HelmetCrew_B {};
		class H_HelmetCrew_O_ghex_F: H_HelmetCrew_B {};
		class IP_H_HelmetCrew_O_Snow: H_HelmetCrew_B {};		
		class H_PilotHelmetHeli_B
		{
			price = 2000;
		};
		class H_PilotHelmetHeli_I: H_PilotHelmetHeli_B {};
		class H_PilotHelmetHeli_O: H_PilotHelmetHeli_B {};
		class IP_H_PilotHelmetHeli_O_Snow: H_PilotHelmetHeli_B {};
		class H_CrewHelmetHeli_B
		{
			price = 2000;
		};
		class H_CrewHelmetHeli_I: H_CrewHelmetHeli_B {};
		class H_CrewHelmetHeli_O: H_CrewHelmetHeli_B {};
		class IP_H_CrewHelmetHeli_O_Snow: H_CrewHelmetHeli_B {};
		class H_PilotHelmetFighter_B
		{
			price = 5000;
		};
		class H_PilotHelmetFighter_I: H_PilotHelmetFighter_B {};
		class H_PilotHelmetFighter_O: H_PilotHelmetFighter_B {};
		class IP_H_PilotHelmetFighter_O_Snow: H_PilotHelmetFighter_B {};
	};
	
	// Attachments (Muzzle)
	class AttachmentsMuzzle
	{	
		basePrice = 1000;
		displayName = "Attachments (Muzzle)";
		
		// Muzzles
		class muzzle_snds_L
		{
			price = 500;
		};
		class hlc_muzzle_Agendasix
		{
			price = 500;
		};
		class hlc_muzzle_Tundra: hlc_muzzle_Agendasix {};
		class muzzle_snds_acp
		{
			price = 750;
		};
		class hlc_muzzle_Agendasix10mm
		{
			price = 750;
		};	
		class muzzle_snds_m
		{
			price = 1000;
		};
		class hlc_muzzle_545SUP_AK
		{
			price = 1000;
		};
		class hlc_muzzle_556NATO_KAC
		{
			price = 1000;
		};
		class hlc_muzzle_300blk_KAC
		{
			price = 1000;
		};
		class muzzle_snds_58_wdm_F
		{
			price = 1100;
		};
		class muzzle_snds_H
		{
			price = 1250;
		};
		class muzzle_snds_H_khk_F: muzzle_snds_H {};
		class muzzle_snds_H_snd_F: muzzle_snds_H {};
		class muzzle_snds_H_MG
		{
			price = 1250;
		};
		class muzzle_snds_H_MG_khk_F: muzzle_snds_H_MG {};
		class muzzle_snds_H_MG_blk_F: muzzle_snds_H_MG {};
		class muzzle_snds_B
		{
			price = 1500;
		};
		class muzzle_snds_B_snd_F: muzzle_snds_B {};
		class muzzle_snds_B_khk_F: muzzle_snds_B {};
		class hlc_muzzle_762SUP_AK
		{
			price = 1500;
		};
		class hlc_muzzle_snds_fal
		{
			price = 1500;
		};
		class hlc_muzzle_snds_HK33
		{
			price = 1500;
		};
		class hlc_muzzle_snds_G3
		{
			price = 1500;
		};
		class hlc_muzzle_snds_M14
		{
			price = 1500;
		};
		class muzzle_snds_65_TI_blk_F
		{
			price = 2000;
		};
		class muzzle_snds_65_TI_ghex_F: muzzle_snds_65_TI_blk_F {};
		class muzzle_snds_65_TI_hex_F: muzzle_snds_65_TI_blk_F {};
		class muzzle_snds_338_black
		{
			price = 2000;
		};
		class muzzle_snds_338_green: muzzle_snds_338_black {};
		class muzzle_snds_338_sand: muzzle_snds_338_black
		{
			show = 0;
		};
		class muzzle_snds_93mmg
		{
			price = 2000;
		};
		class muzzle_snds_93mmg_tan: muzzle_snds_93mmg
		{
			show = 0;
		};
	};
	
	// Attachments (Rail)
	class AttachmentsRail
	{
		basePrice = 100;
		displayName = "Attachments (Rail)";
		
		class acc_flashlight
		{
			price = 50;
		};
		class acc_pointer_IR
		{
			price = 500;
		};
	};
	
	// Attachments (Optics)
	class AttachmentsOptics
	{
		basePrice = 250;
		displayName = "Attachments (Optics)";
		
		// Optics
		class optic_MRD
		{
			price = 100;
		};
		class optic_Yorris
		{
			price = 150;
		};
		class optic_Aco
		{
			price = 200;
		};
		class optic_ACO_grn: optic_Aco {};
		class optic_Aco_smg
		{
			price = 200;
		};
		class optic_ACO_grn_smg: optic_Aco_smg {};
		class hlc_optic_kobra
		{
			price = 200;
		};
		class optic_Holosight
		{
			price = 500;
		};
		class optic_Holosight_smg
		{
			price = 500;
		};
		class optic_MRCO
		{
			price = 1000;
		};
		class optic_Arco
		{
			price = 1000;
		};
		class optic_Hamr
		{
			price = 1000;
		};
		class HLC_Optic_1p29
		{
			price = 1000;
		};
		class hlc_optic_suit
		{
			price = 1000;
		};
		class HLC_Optic_ZFSG1
		{
			price = 1000;
		};
		class hlc_optic_accupoint_g3
		{
			price = 1000;
		};
		class optic_KHS_old
		{
			price = 1500;
		};
		class hlc_optic_artel_m14
		{
			price = 1500;
		};
		class optic_SOS
		{
			price = 2000;
		};		
		class optic_KHS_blk
		{
			price = 2000;
		};
		class optic_KHS_hex: optic_KHS_blk
		{
			show = 0;
		};
		class optic_KHS_tan: optic_KHS_hex {};		
		class optic_AMS
		{
			price = 2000;
		};
		class optic_AMS_khk: optic_AMS
		{
			show = 0;
		};
		class optic_AMS_snd: optic_AMS_khk {};		
		class optic_DMS
		{
			price = 2000;
		};
		class hlc_optic_PVS4FAL
		{
			price = 2000;
		};
		class HLC_Optic_PSO1
		{
			price = 3000;
		};
		class optic_LRPS
		{
			price = 4000;
		};
		class hlc_optic_LRT_m14
		{
			price = 4000;
		};
		class optic_NVS
		{
			price = 4000;
		};
		class optic_Nightstalker
		{
			price = 4000;
		};
		class optic_tws
		{
			price = 4000;
		};
		class optic_tws_mg
		{
			price = 4000;
		};
		class hlc_optic_goshawk
		{
			price = 4000;
		};
	};
	
	// Attachments (Under Barrel)
	class AttachmentsUnderBarrel
	{
		basePrice = 100;
		displayName = "Attachments (Under Barrel)";
		
		class bipod_01_F_snd
		{
			price = 100;
			show = 1;
		};
		class bipod_01_F_blk: bipod_01_F_snd
		{
			show = 1;
		};
		class bipod_01_F_mtp: bipod_01_F_snd {};
		class bipod_02_F_blk
		{
			price = 100;
		};
		class bipod_02_F_tan: bipod_02_F_blk 
		{
			show = 1;
		};
		class bipod_02_F_hex: bipod_02_F_tan {};
		class bipod_03_F_blk
		{
			price = 100;
		};
		class bipod_03_F_oli: bipod_03_F_blk {};
	};
	
	// Backpacks
	class Backpacks
	{
		basePrice = 500;
		displayName = "Backpacks";
		
		class B_AssaultPack_khk
		{
			price = 500;
		};
		class B_AssaultPack_dgtl: B_AssaultPack_khk {};
		class B_AssaultPack_rgr: B_AssaultPack_khk {};
		class B_AssaultPack_sgg: B_AssaultPack_khk {};
		class B_AssaultPack_blk: B_AssaultPack_khk {};
		class B_AssaultPack_cbr: B_AssaultPack_khk {};
		class B_AssaultPack_mcamo: B_AssaultPack_khk {};
		class B_AssaultPack_ocamo: B_AssaultPack_khk {};
		class B_AssaultPack_tna_F: B_AssaultPack_khk {};
		class IP_B_AssaultPack_SnowHex: B_AssaultPack_khk 
		{
			merc = 0;
			show = 0;
		};
		class IP_B_AssaultPack_SnowTiger: IP_B_AssaultPack_SnowHex {};
		class IP_B_AssaultPack_snw: IP_B_AssaultPack_SnowHex {};		
		class B_FieldPack_khk
		{
			price = 1000;
		};
		class B_FieldPack_ocamo: B_FieldPack_khk {};
		class B_FieldPack_oucamo: B_FieldPack_khk {};
		class B_FieldPack_cbr: B_FieldPack_khk {};
		class B_FieldPack_blk: B_FieldPack_khk {};
		class B_FieldPack_ghex_F: B_FieldPack_khk {};
		class IP_B_Fieldpack_blue: B_FieldPack_khk {};
		class IP_B_FieldPack_SnowHex: B_FieldPack_khk
		{
			merc = 0;
			show = 0;
		};
		class IP_B_FieldPack_SnowTiger: IP_B_FieldPack_SnowHex {};		
		class B_Kitbag_rgr
		{
			price = 1500;
		};
		class B_Kitbag_mcamo: B_Kitbag_rgr {};
		class B_Kitbag_sgg: B_Kitbag_rgr {};
		class B_Kitbag_cbr: B_Kitbag_rgr {};
		class IP_B_Kitbag_SnowHex: B_Kitbag_rgr
		{
			merc = 0;
			show = 0;
		};
		class IP_B_Kitbag_SnowTiger: IP_B_Kitbag_SnowHex {};
		class IP_B_Kitbag_snw: IP_B_Kitbag_SnowHex {};		
		class B_TacticalPack_rgr
		{
			price = 2000;
		};
		class B_TacticalPack_mcamo: B_TacticalPack_rgr {};
		class B_TacticalPack_ocamo: B_TacticalPack_rgr {};
		class B_TacticalPack_blk: B_TacticalPack_rgr {};
		class B_TacticalPack_oli: B_TacticalPack_rgr {};
		class IP_B_TacticalPack_blue_fPO: B_TacticalPack_rgr {};		
		class B_Carryall_ocamo
		{
			price = 2500;
		};
		class B_Carryall_oucamo: B_Carryall_ocamo {};
		class B_Carryall_mcamo: B_Carryall_ocamo {};
		class B_Carryall_khk: B_Carryall_ocamo {};
		class B_Carryall_cbr: B_Carryall_ocamo {};	
		class B_Carryall_ghex_F: B_Carryall_ocamo {};		
		class IP_B_Carryall_blue: B_Carryall_ocamo {};
		class IP_B_Carryall_SnowHex: B_Carryall_ocamo
		{
			merc = 0;
			show = 0;
		};
		class IP_B_Carryall_SnowTiger: IP_B_Carryall_SnowHex {};
		class IP_B_Carryall_blk: B_Carryall_ocamo {};
		class IP_B_Carryall_snw: IP_B_Carryall_SnowHex {};
		class B_ViperLightHarness_khk_F
		{
			price = 3000;
		};
		class B_ViperLightHarness_blk_F: B_ViperLightHarness_khk_F {};
		class B_ViperLightHarness_hex_F: B_ViperLightHarness_khk_F {};
		class B_ViperLightHarness_oli_F: B_ViperLightHarness_khk_F {};
		class B_ViperLightHarness_ghex_F: B_ViperLightHarness_khk_F {};
		class B_ViperHarness_oli_F
		{
			price = 3500;
		};
		class B_ViperHarness_khk_F: B_ViperHarness_oli_F {};
		class B_ViperHarness_ghex_F: B_ViperHarness_oli_F {};
		class B_ViperHarness_hex_F: B_ViperHarness_oli_F {};
		class B_ViperHarness_blk_F: B_ViperHarness_oli_F {};
		class B_Bergen_tna_F
		{
			price = 4000;
		};
		class B_Bergen_hex_F: B_Bergen_tna_F {};
		class B_Bergen_dgtl_F: B_Bergen_tna_F {};
		class B_Bergen_mcamo_F: B_Bergen_tna_F {};
	};
	
	// Backpacks Parachutes
	class BackpacksParachutes
	{
		basePrice = 3000;
		displayName = "Backpacks (Parachutes)";
		show = 0;
		
		class B_Parachute
		{
			price = 3000;
		};
	};
	
	// Backpacks Statics
	class BackpacksStatics
	{
		basePrice = 5000;
		displayName = "Backpacks (Statics)";
		show = 0;
		
		class B_HMG_01_weapon_F
		{
			price = 5000;
		};
		class I_HMG_01_weapon_F: B_HMG_01_weapon_F {};
		class O_HMG_01_weapon_F: B_HMG_01_weapon_F {};
		class B_HMG_01_support_F 
		{
			price = 5000;
		};
		class I_HMG_01_support_F: B_HMG_01_support_F {};
		class O_HMG_01_support_F: B_HMG_01_support_F {};
		class B_GMG_01_weapon_F
		{
			price = 5000;
		};
		class I_GMG_01_weapon_F: B_GMG_01_weapon_F {};
		class O_GMG_01_weapon_F: B_GMG_01_weapon_F {};
		class B_Mortar_01_weapon_F
		{
			price = 5000;
		};
		class I_Mortar_01_weapon_F: B_Mortar_01_weapon_F {};
		class O_Mortar_01_weapon_F: B_Mortar_01_weapon_F {};
		class B_Mortar_01_support_F 
		{
			price = 5000;
		};
		class I_Mortar_01_support_F: B_Mortar_01_support_F {};
		class O_Mortar_01_support_F: B_Mortar_01_support_F {};
	};
};