class ShopUniforms
{
	basePrice = 250;
	
	class Civilian
	{
		displayName = "Civilian";
		
		class U_C_Poloshirt_blue
		{
			price = 50;
			show = 0;
		};
		class U_C_Poloshirt_burgundy: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_stripped: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_tricolour: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_salmon: U_C_Poloshirt_blue {};
		class U_C_Poloshirt_redwhite: U_C_Poloshirt_blue {};
		class U_C_Commoner1_1: U_C_Poloshirt_blue {};
		class U_C_Commoner1_2: U_C_Poloshirt_blue {};
		class U_C_Commoner1_3: U_C_Poloshirt_blue {};
		class U_C_Poor_shorts_1: U_C_Poloshirt_blue {};
		class U_C_Commoner_shorts: U_C_Poloshirt_blue {};
		class U_C_ShirtSurfer_shorts: U_C_Poloshirt_blue {};
		class U_C_TeeSurfer_shorts_1: U_C_Poloshirt_blue {};
		class U_C_TeeSurfer_shorts_2: U_C_Poloshirt_blue {};
		class U_C_Poor_1
		{
			description = "Old Blue T-Shirt, Dark Cargo Pants with Holes in Pockets, and Undersized Boots";
			price = 100;
		};
		class U_Competitor
		{
			description = "Black-Yellow ION Polo-Shirt, Bright Jeans, and Boots";
			price = 200;
		}; 
		class U_Rangemaster
		{
			description = "Blue Rangemaster Polo-Shirt, Bright Jeans, and Boots";
			price = 200;
		};
		class U_C_WorkerCoveralls
		{
			price = 250;
			show = 0;
		};
		class IP_U_C_WorkerCoveralls: U_C_WorkerCoveralls {};
		class IP_U_I_Coveralls_grey: U_C_WorkerCoveralls {};
		class U_C_Scientist
		{
			price = 250;
			show = 0;
			zombieTexture = "images\ScienceZombie.paa";
		};
		class IP_U_C_Doctor: U_C_Scientist {};
		class IP_U_B_ParamedicCoveralls_EF: U_C_Scientist {};
		class U_IG_Guerilla3_1
		{
			description = "Shirt, Dark Jacket, Blue Jeans, Scarf, and Boots";
			price = 250;
		};
		class U_C_Journalist
		{
			price = 250;
			show = 0;
		};
		class U_C_HunterBody_grn
		{
			description = "Shirt, Bright Jacket, Blue Jeans, Scarf, Talisman, Radio, Knife, and Boots";
			price = 400;
		};
		class IP_U_C_HunterBody_grn: U_C_HunterBody_grn {};
		class U_NikosAgedBody
		{
			price = 1000;
			show = 0;
		};
		class U_OrestesBody
		{
			description = "YOLO T-Shirt, Trendy Giccu Leather Jacket, Camo Shorts, and Jordans<br/>'For the fashion-conscious hitman. Kill it - with style!'";
			price = 1500;
			show = 0;
		};
		class U_NikosBody
		{
			description = "Dragon Shirt, Worn Jeans, and Squirrel Leather Shoes<br/>Approved by Limnos Fashion Police";
			price = 2000;
			show = 0;
		};
		class U_C_Driver_1
		{
			price = 3000;
			show = 0;
		};
		class U_C_Driver_2: U_C_Driver_1 {};
		class U_C_Driver_3: U_C_Driver_1 {};
		class U_C_Driver_4: U_C_Driver_1 {};
		class U_C_Driver_1_black: U_C_Driver_1 {};
		class U_C_Driver_1_blue: U_C_Driver_1 {};
		class U_C_Driver_1_green: U_C_Driver_1 {};
		class U_C_Driver_1_red: U_C_Driver_1 {};
		class U_C_Driver_1_white: U_C_Driver_1 {};
		class U_C_Driver_1_yellow: U_C_Driver_1 {};
		class U_C_Driver_1_orange: U_C_Driver_1 {};
	};
	
	class Paramilitary
	{
		displayName = "Paramilitary";
		
		class U_I_G_resistanceLeader_F
		{
			price = 200;
		};
		class U_BG_Guerilla1_1
		{
			price = 300;
		};
		class IP_U_BG_Guerilla1_1WoodTiger: U_BG_Guerilla1_1 {};
		class IP_U_BG_Guerilla1_1_MCAM_US_Desert: U_BG_Guerilla1_1 {};
		class IP_U_BG_Guerilla1_1SnowRed: IP_U_BG_Guerilla1_1WoodTiger
		{
			merc = 0;
			show = 0;
		};
		class U_BG_Guerilla2_1
		{
			price = 300;
		};
		class IP_U_BG_Guerilla2_1_Steppentarn: U_BG_Guerilla2_1 {};
		class U_BG_Guerilla2_2
		{
			price = 300;
		};
		class U_BG_Guerilla2_3
		{
			price = 300;
		};	
		class U_BG_Guerilla3_2
		{
			price = 300;
		};
		class U_BG_Guerrilla_6_1
		{
			price = 300;
		};
		class IP_U_BG_Guerrilla_6_1Police: U_BG_Guerrilla_6_1
		{
			merc = 0;
			show = 0;
		};
		class IP_U_BG_Guerrilla_6_1SnowUS: IP_U_BG_Guerrilla_6_1Police {};
		class IP_U_BG_Guerrilla_6_1WoodPlain: IP_U_BG_Guerrilla_6_1Police {};
		class IP_U_BG_Guerrilla_6_1WoodSplitter: IP_U_BG_Guerrilla_6_1Police {};
		class IP_U_BG_Guerrilla_6_1BlackTriangle: IP_U_BG_Guerrilla_6_1Police {};
		class IP_U_BG_Guerrilla_6_1Black: U_BG_Guerilla3_2 {};
		class U_BG_leader
		{
			price = 300;
		};
		class IP_U_BG_leader_WoodTriangleBW: U_BG_leader
		{
			merc = 0;
			show = 0;
		};
		class IP_U_BG_leader_USSnowFinnish: IP_U_BG_leader_WoodTriangleBW {};
		class IP_U_BG_leader_WoodSwedishSS: IP_U_BG_leader_WoodTriangleBW {}; 
	};
	
	class Military
	{
		displayName = "Military";
		
		class U_I_CombatUniform
		{
			merc = 0;
			price = 500;
		};
		class U_I_CombatUniform_tshirt: U_I_CombatUniform {};
		class U_I_CombatUniform_shortsleeve: U_I_CombatUniform {};
		class IP_U_I_CombatUniform_Police: U_I_CombatUniform 
		{
			show = 0;			
		};
		class IP_U_I_CombatUniform_shortsleeve_Police: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_Triangle: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_Triangle: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_USSnow: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_USSnow: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_US: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_US: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_BW: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_BW: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_MARPAT: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_MARPAT: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_Swedish: IP_U_I_CombatUniform_Police {};
		class IP_U_I_CombatUniform_shortsleeve_Swedish: IP_U_I_CombatUniform_Police {};
		class U_I_OfficerUniform
		{
			merc = 0;
			price = 750;
		};
		class U_B_CombatUniform_mcam_tshirt
		{
			price = 500;
		};
		class IP_U_B_CombatUniform_mcam_tshirt_EFAltis: U_B_CombatUniform_mcam_tshirt {};
		class IP_U_B_CombatUniform_mcam_tshirt_EFDesert: U_B_CombatUniform_mcam_tshirt {};
		class U_I_G_Story_Protagonist_F
		{
			price = 600;
		};
		class U_B_CombatUniform_mcam
		{
			price = 750;
		};
		class U_B_CombatUniform_mcam_vest: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFBlackWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFBlackWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFAltis: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFAltis: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFAltisWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFAltisWolf: U_B_CombatUniform_mcam {};		
		class IP_U_B_CombatUniform_mcam_EFDesert: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFDesert: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFDesertMain: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFDesertWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFDesertWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFNavy: U_B_CombatUniform_mcam {};		
		class IP_U_B_CombatUniform_mcam_vest_EFNavy: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFWoodland: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFWoodland: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFWoodlandWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_vest_EFWoodlandWolf: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_mcam_EFSnow: U_B_CombatUniform_mcam
		{
			merc = 0;
			show = 0;
		};				
		class IP_U_B_CombatUniform_mcam_vest_EFSnow: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_mcam_EFSnowWolf: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_mcam_vest_EFSnowWolf: IP_U_B_CombatUniform_mcam_EFSnow {};	
		class IP_U_B_CombatUniform_mcam_TXSnow: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_mcam_vest_TXSnow: IP_U_B_CombatUniform_mcam_EFSnow {};		
		class IP_U_O_CombatUniform_mcam_BKSnow: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_O_CombatUniform_mcam_vest_BKSnow: IP_U_B_CombatUniform_mcam_EFSnow {};		
		class IP_U_B_CombatUniform_EF_Snow_ATACS_Wolf: IP_U_B_CombatUniform_mcam_EFSnow {};	
		class IP_U_B_CombatUniform_EF_Snow_ATACS_Wolf_vest: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_ATACS_EF_Snow_Wolf: IP_U_B_CombatUniform_mcam_EFSnow {};	
		class IP_U_B_CombatUniform_ATACS_EF_Snow_Wolf_vest: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_ATACS_Wolf: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_ATACS_Wolf_vest: IP_U_B_CombatUniform_mcam_EFSnow {};			
		class IP_U_B_CombatUniform_Woodland_Sage: U_B_CombatUniform_mcam {};
		class IP_U_B_CombatUniform_Woodland_Sage_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_C_B_CombatUniform_Woodland_Sage_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Woodland: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Woodland_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Sage: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Sage_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_woodland_dark_grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_woodland_dark_grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_woodland_mtp_grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_woodland_mtp_grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_snow_mtp_grey: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_snow_mtp_grey_Vest: IP_U_B_CombatUniform_mcam_EFSnow {};
		class IP_U_B_CombatUniform_EF_Woodland: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_EF_Woodland_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_EF_Woodland_Grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_EF_Woodland_Grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_EF_Woodland_Sage: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_EF_Woodland_Sage_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Grey_woodland: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_Grey_woodland_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Grey_woodland: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Grey_woodland_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Sage_woodland: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Sage_woodland_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Snow_Grey: IP_U_B_CombatUniform_Woodland_Sage {};
		class IP_U_B_CombatUniform_MTP_Snow_Grey_Vest: IP_U_B_CombatUniform_Woodland_Sage {};
		class U_B_CTRG_2
		{
			price = 500;
		};
		class U_B_CTRG_1
		{
			price = 750;
		};
		class U_B_CTRG_3: U_B_CTRG_1 {};
		class U_O_CombatUniform_ocamo
		{
			merc = 0;
			description = "Compatible to BIS Glass, equipped with hologram emitters.";
			price = 25000;
			show = 0;
		};
		class U_O_CombatUniform_oucamo: U_O_CombatUniform_ocamo {};
		class IP_U_O_CombatUniform_SnowTiger: U_O_CombatUniform_ocamo {};
		class IP_U_O_CombatUniform_SnowHex: U_O_CombatUniform_ocamo {};
		class IP_U_O_CombatUniform_BA: U_O_CombatUniform_ocamo {};
		class U_O_OfficerUniform_ocamo
		{
			price = 750;
			show = 0;
			zombieTexture = "images\OpforClothing_GreyZombie7.paa";
		};
		class IP_U_O_OfficerUniform_SnowTiger: U_O_OfficerUniform_ocamo {};
		class IP_U_O_OfficerUniform_SnowHex: U_O_OfficerUniform_ocamo {};
	};
	
	class Special
	{
		displayName = "Special";
		show = 0;
		
		class U_B_HeliPilotCoveralls
		{
			price = 250;
			show = 0;
		};
		class U_I_HeliPilotCoveralls: U_B_HeliPilotCoveralls {};
		class U_O_HeliPilotCoveralls: U_B_HeliPilotCoveralls {};
		class IP_U_B_Coveralls_PO: U_B_HeliPilotCoveralls {};
		class IP_U_O_HeliPilotCoveralls_SnowHex: U_B_HeliPilotCoveralls {};
		class IP_U_B_HeliPilotCoveralls_EF: U_B_HeliPilotCoveralls {};
		class U_B_Wetsuit
		{
			//description = "Whole-body neoprene diving wetsuit with diving fins.";
			//displayName = "Diving Wetsuit";
			price = 1000;
			show = 0;
		};
		class U_I_Wetsuit: U_B_Wetsuit 
		{
			show = 1;			
		};
		class U_O_Wetsuit: U_B_Wetsuit {};
		class IP_U_O_Wetsuit_SnowHex: U_B_Wetsuit {};
		class U_I_GhillieSuit
		{
			price = 750;
			show = 0;
		};
		class U_I_FullGhillie_lsh: U_I_GhillieSuit {};
		class U_I_FullGhillie_sard: U_I_GhillieSuit {};
		class U_I_FullGhillie_ard: U_I_GhillieSuit {};
		class U_B_GhillieSuit
		{
			price = 1000;
			show = 0;
		};
		class U_B_FullGhillie_lsh: U_B_GhillieSuit {};
		class U_B_FullGhillie_sard: U_B_GhillieSuit {};
		class U_B_FullGhillie_ard: U_B_GhillieSuit {};
		class U_O_GhillieSuit
		{
			price = 1250;
			show = 0;
		};
		class U_O_FullGhillie_lsh: U_O_GhillieSuit {};
		class U_O_FullGhillie_sard: U_O_GhillieSuit {};
		class U_O_FullGhillie_ard: U_O_GhillieSuit {};
		class U_B_pilotCoveralls
		{
			price = 2500;
			show = 0;
		};
		class U_I_pilotCoveralls: U_B_pilotCoveralls {};
		class U_O_pilotCoveralls: U_B_pilotCoveralls {};
		class IP_U_O_PilotCoveralls_SnowHex: U_B_pilotCoveralls {};
		class U_B_Protagonist_VR
		{
			price = 3000;
			show = 0;
		};
		class U_O_Protagonist_VR: U_B_Protagonist_VR {};
		class U_I_Protagonist_VR: U_B_Protagonist_VR {};
	};
};