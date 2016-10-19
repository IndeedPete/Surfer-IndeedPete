class ShopMagazines
{	
	basePrice = 0;
	basePriceExplosive = 500;
	
	// 9mm
    class 16Rnd_9x21_Mag
    {
        price = 16;
    };
	class 16Rnd_9x21_red_Mag: 16Rnd_9x21_Mag {};
	class 16Rnd_9x21_green_Mag: 16Rnd_9x21_Mag {};
	class 16Rnd_9x21_yellow_Mag: 16Rnd_9x21_Mag {};
	class hlc_25Rnd_9x19mm_M882_AUG
    {
        price = 25;
    };
	class hlc_25Rnd_9x19mm_JHP_AUG: hlc_25Rnd_9x19mm_M882_AUG {};
	class hlc_25Rnd_9x19mm_subsonic_AUG: hlc_25Rnd_9x19mm_M882_AUG {};
	class 30Rnd_9x21_Mag
    {
        price = 30;
    };
	class 30Rnd_9x21_Red_Mag: 30Rnd_9x21_Mag {};
	class 30Rnd_9x21_Yellow_Mag: 30Rnd_9x21_Mag {};
	class 30Rnd_9x21_Green_Mag: 30Rnd_9x21_Mag {};
	class hlc_30Rnd_9x19_B_MP5
    {
        price = 30;
    };
	class hlc_30Rnd_9x19_GD_MP5: hlc_30Rnd_9x19_B_MP5 {};
	class hlc_30Rnd_9x19_SD_MP5: hlc_30Rnd_9x19_B_MP5 {};
	
	// 10mm
	class hlc_30Rnd_10mm_B_MP5
    {
        price = 40;
    };
	class hlc_30Rnd_10mm_JHP_MP5: hlc_30Rnd_10mm_B_MP5 {};
	
	// .45
	class 6Rnd_45ACP_Cylinder
    {
        price = 9;
    };	
	class 9Rnd_45ACP_Mag
    {
        price = 14; // 13.50
    };	
	class 11Rnd_45ACP_Mag
    {
        price = 17; // 16.50
    };	
	class 30Rnd_45ACP_Mag_SMG_01
    {
        price = 45;
    };	
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green: 30Rnd_45ACP_Mag_SMG_01 {};
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red: 30Rnd_45ACP_Mag_SMG_01 {};
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow: 30Rnd_45ACP_Mag_SMG_01 {};
	
	// 5.45mm
	class hlc_30Rnd_545x39_B_AK
    {
        price = 60;
    };
	class hlc_30Rnd_545x39_T_AK: hlc_30Rnd_545x39_B_AK {};
	class hlc_30Rnd_545x39_EP_AK: hlc_30Rnd_545x39_B_AK {};
	class hlc_45Rnd_545x39_t_rpk
    {
        price = 90;
    };
	
	// 5.56mm
	class 20Rnd_556x45_UW_mag
    {
        price = 40;
    };	
	class 30Rnd_556x45_Stanag
    {
        price = 60;
    };	
    class 30Rnd_556x45_Stanag_Tracer_Red: 30Rnd_556x45_Stanag {};
	class 30Rnd_556x45_Stanag_Tracer_Green: 30Rnd_556x45_Stanag {};
    class 30Rnd_556x45_Stanag_Tracer_Yellow: 30Rnd_556x45_Stanag {};
	class 30Rnd_556x45_Stanag_red: 30Rnd_556x45_Stanag {};
	class 30Rnd_556x45_Stanag_green: 30Rnd_556x45_Stanag {};
	class hlc_30rnd_556x45_EPR
    {
        price = 60;
    };	
    class hlc_30rnd_556x45_SOST: hlc_30rnd_556x45_EPR {};
	class hlc_30rnd_556x45_SPR: hlc_30rnd_556x45_EPR {};
	class hlc_30Rnd_556x45_B_AUG
    {
        price = 60;
    };	
    class hlc_30Rnd_556x45_SOST_AUG: hlc_30Rnd_556x45_B_AUG {};
	class hlc_30Rnd_556x45_SPR_AUG: hlc_30Rnd_556x45_B_AUG {};
	class hlc_30Rnd_556x45_T_AUG: hlc_30Rnd_556x45_B_AUG {};
	class hlc_40Rnd_556x45_B_AUG
    {
        price = 80;
    };	
    class hlc_40Rnd_556x45_SOST_AUG: hlc_40Rnd_556x45_B_AUG {};
	class hlc_40Rnd_556x45_SPR_AUG: hlc_40Rnd_556x45_B_AUG {};
	class hlc_50rnd_556x45_EPR
	{
		price = 100;
	};
	class hlc_200rnd_556x45_M_SAW
    {
        price = 400;
    };	
    class hlc_200rnd_556x45_T_SAW: hlc_200rnd_556x45_M_SAW {};
	class hlc_200rnd_556x45_B_SAW: hlc_200rnd_556x45_M_SAW {};

	// 6.5mm Caseless
	class 30Rnd_65x39_caseless_mag
    {
        price = 75;
    };	
	class 30Rnd_65x39_caseless_mag_Tracer: 30Rnd_65x39_caseless_mag {};
    class 30Rnd_65x39_caseless_green: 30Rnd_65x39_caseless_mag {};
    class 30Rnd_65x39_caseless_green_mag_Tracer: 30Rnd_65x39_caseless_mag {};
    class 100Rnd_65x39_caseless_mag
    {
        price = 250;
    };
	class 100Rnd_65x39_caseless_mag_Tracer: 100Rnd_65x39_caseless_mag {};
    class 200Rnd_65x39_cased_Box
    {
        price = 500;
    };
	class 200Rnd_65x39_cased_Box_Tracer: 200Rnd_65x39_cased_Box {};
	
	// 7.62mm
	class 10Rnd_762x54_Mag
    {
        price = 30;
    };	
	class 20Rnd_762x51_Mag
    {
        price = 60;
    };
	class hlc_20Rnd_762x51_B_fal
    {
        price = 60;
    };
	class hlc_20Rnd_762x51_t_fal: hlc_20Rnd_762x51_B_fal {};
	class hlc_20Rnd_762x51_S_fal: hlc_20Rnd_762x51_B_fal {};	
	class hlc_20Rnd_762x51_B_G3
    {
        price = 60;
    };
	class hlc_20rnd_762x51_T_G3: hlc_20Rnd_762x51_B_G3 {};
	class hlc_20Rnd_762x51_B_M14
    {
        price = 60;
    };
	class hlc_20rnd_762x51_T_M14: hlc_20Rnd_762x51_B_M14 {};
	class hlc_30Rnd_762x39_b_ak
    {
        price = 90;
    };
	class hlc_30Rnd_762x39_t_ak: hlc_30Rnd_762x39_b_ak {};
	class hlc_45Rnd_762x39_t_rpk
    {
        price = 135;
    };
	class hlc_45Rnd_762x39_m_rpk: hlc_45Rnd_762x39_t_rpk {};
	class hlc_50rnd_762x51_M_FAL
    {
        price = 150;
    };
	class hlc_50rnd_762x51_M_G3
    {
        price = 150;
    };
	class hlc_50rnd_762x51_M_M14
    {
        price = 150;
    };
	class hlc_75rnd_762x39_m_rpk
    {
        price = 225;
    };
	class hlc_100Rnd_762x51_B_M60E4
    {
        price = 300;
    };
	class hlc_100Rnd_762x51_T_M60E4: hlc_100Rnd_762x51_B_M60E4 {};
	class hlc_100Rnd_762x51_M_M60E4: hlc_100Rnd_762x51_B_M60E4 {};
	class 150Rnd_762x54_Box
    {
        price = 450;
    };	
	class 150Rnd_762x54_Box_Tracer: 150Rnd_762x54_Box {};
	
	// .300
	class 29rnd_300BLK_STANAG
    {
        price = 90;
    };
	class 29rnd_300BLK_STANAG_T: 29rnd_300BLK_STANAG {};
	class 29rnd_300BLK_STANAG_S: 29rnd_300BLK_STANAG {};
	class hlc_5rnd_300WM_FMJ_AWM
    {
        price = 15;
    };
	class hlc_5rnd_300WM_AP_AWM: hlc_5rnd_300WM_FMJ_AWM {};
	class hlc_5rnd_300WM_BTSP_AWM: hlc_5rnd_300WM_FMJ_AWM {};
	class hlc_5rnd_300WM_mk248_AWM: hlc_5rnd_300WM_FMJ_AWM {};
	class hlc_5rnd_300WM_SBT_AWM: hlc_5rnd_300WM_FMJ_AWM {};
	
	// 12 Gauge
	class hlc_10rnd_12g_buck_S12
    {
        price = 35;
    };
	class hlc_10rnd_12g_slug_S12
    {
        price = 35;
    };
	
	// .338
	class 10Rnd_338_Mag
	{
		price = 35;
	};
	class 130Rnd_338_Mag
	{
		price = 455;
	};
	
	// 9.3mm
	class 10Rnd_93x64_DMR_05_Mag
    {
        price = 40;
    };
	class 150Rnd_93x64_Mag
	{
		price = 600;
	};
	
	// 12.7mm
	class 5Rnd_127x108_Mag
    {
        price = 25;
    };	
	class 5Rnd_127x108_APDS_Mag
    {
        price = 50;
    };
	class 10Rnd_127x54_Mag
    {
        price = 50;
    };	
	
	// .408
	class 7Rnd_408_Mag
    {
        price = 40; // 38.50
    };	
	
	// Grenades
	class HandGrenade_Stone
	{
		price = 1;
		show = 0;
	};
	class MiniGrenade
    {
        price = 150;
    };	
	class HandGrenade
    {
        price = 200;
    };
	class B_IR_Grenade
	{
		price = 150;
		show = 0;
	};
	class I_IR_Grenade: B_IR_Grenade {};
    class O_IR_Grenade: B_IR_Grenade {};
	class SmokeShell
    {
        price = 150;
    };	
	class SmokeShellRed: SmokeShell {};
    class SmokeShellGreen: SmokeShell {};
    class SmokeShellYellow: SmokeShell {};
    class SmokeShellPurple: SmokeShell {};
    class SmokeShellBlue: SmokeShell {};
    class SmokeShellOrange: SmokeShell {};
	
	// Grenade Launcher
	class 1Rnd_HE_Grenade_shell
    {
        price = 250;
    };
	class hlc_VOG25_AK
    {
        price = 250;
    };
	class 3Rnd_HE_Grenade_shell
	{
        price = 750;
    };
	class 1Rnd_Smoke_Grenade_shell
    {
        price = 200;
    };	
	class 1Rnd_SmokeRed_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};
    class 1Rnd_SmokeGreen_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};
    class 1Rnd_SmokeYellow_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};
    class 1Rnd_SmokePurple_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};
    class 1Rnd_SmokeBlue_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};
    class 1Rnd_SmokeOrange_Grenade_shell: 1Rnd_Smoke_Grenade_shell {};	
	class hlc_GRD_White
    {
        price = 200;
    };	
	class hlc_GRD_red: hlc_GRD_White {};
    class hlc_GRD_green: hlc_GRD_White {};
    class hlc_GRD_blue: hlc_GRD_White {};
    class hlc_GRD_orange: hlc_GRD_White {};
    class hlc_GRD_purple: hlc_GRD_White {};	
	class 3Rnd_Smoke_Grenade_shell
    {
        price = 600;
    };	
	class 3Rnd_SmokeRed_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class 3Rnd_SmokeGreen_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class 3Rnd_SmokeYellow_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class 3Rnd_SmokePurple_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class 3Rnd_SmokeBlue_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class 3Rnd_SmokeOrange_Grenade_shell: 3Rnd_Smoke_Grenade_shell {};
    class UGL_FlareWhite_F
    {
        price = 200;
    };	
	class UGL_FlareGreen_F: UGL_FlareWhite_F {};
    class UGL_FlareRed_F: UGL_FlareWhite_F {};
    class UGL_FlareYellow_F: UGL_FlareWhite_F {};
    class UGL_FlareCIR_F: UGL_FlareWhite_F {};
	class 3Rnd_UGL_FlareWhite_F
    {
        price = 600;
    };	
	class 3Rnd_UGL_FlareGreen_F: 3Rnd_UGL_FlareWhite_F {};
    class 3Rnd_UGL_FlareRed_F: 3Rnd_UGL_FlareWhite_F {};
    class 3Rnd_UGL_FlareYellow_F: 3Rnd_UGL_FlareWhite_F {};
    class 3Rnd_UGL_FlareCIR_F: 3Rnd_UGL_FlareWhite_F {};
	
	// Launchers
	class RPG32_F
    {
        price = 1000;
    };	
	class RPG32_HE_F
    {
        price = 1000;
    };	
	class NLAW_F
    {
        price = 2000;
    };
	class Titan_AT
    {
        price = 3000;
    };	
	class Titan_AP
    {
        price = 3000;
    };
	class Titan_AA
    {
        price = 3000;
    };
	
	// Mines
	class APERSMine_Range_Mag
    {
        price = 300;
    };
	class APERSTripMine_Wire_Mag
    {
        price = 350;
    };	
	class ClaymoreDirectionalMine_Remote_Mag
    {
        price = 350;
    };	
	class APERSBoundingMine_Range_Mag
    {
        price = 400;
    };	
	class SLAMDirectionalMine_Wire_Mag
    {
        price = 750;
    };	
	class ATMine_Range_Mag
    {
        price = 1000;
    };
	
	// Charges
	class IEDUrbanSmall_Remote_Mag
    {
        price = 1000;
    };
	class IEDLandSmall_Remote_Mag
    {
        price = 1000;
    };
	class DemoCharge_Remote_Mag
    {
        price = 2000;
    };
	class IEDUrbanBig_Remote_Mag
    {
        price = 3000;
    };
	class IEDLandBig_Remote_Mag
    {
        price = 3000;
    };
	class SatchelCharge_Remote_Mag
    {
        price = 4000;
    };
	
	// Laser
	class Laserbatteries
    {
        price = 100;
    };
	
	// Chemlights
	class Chemlight_green
    {
        price = 1;
    };	
	class Chemlight_red: Chemlight_green {};
    class Chemlight_yellow: Chemlight_green {};
    class Chemlight_blue: Chemlight_green {};
};