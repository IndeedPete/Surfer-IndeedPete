class Factions
{
    class Altis
    {
        displayName = "Rebuplic of Altis";
		displayNameShort = "Altis";
    };	
	class AltisMil
    {
        displayName = "Altis Armed Forces";
		displayNameShort = "AAF";
    };	
	class BlackArrow
    {
        blacklistUniforms[] = {"U_Competitor", "U_B_CTRG_1", "U_B_CTRG_2", "U_B_CTRG_3", "U_I_G_resistanceLeader_F", "U_B_Wetsuit"};
		blacklistHeadgear[] = {"H_Cap_blk_ION"};
		displayName = "Black Arrow";
		displayNameShort = "BA";
		
		class Ranks
		{
			class PRIVATE
			{
				displayName = "Contractor";
				displayNameShort = "Contractor";
			};
			class CORPORAL
			{
				displayName = "Senior Contractor";
				displayNameShort = "Senior Contractor";
			};
			class SERGEANT
			{
				displayName = "Detail Leader";
				displayNameShort = "Detail Leader";
			};
			class LIEUTENANT
			{
				displayName = "Section Leader";
				displayNameShort = "Section Leader";
			};
			class CAPTAIN
			{
				displayName = "Executive";
				displayNameShort = "Executive";
			};
			class MAJOR
			{
				displayName = "Partner";
				displayNameShort = "Partner";
			};
			class COLONEL
			{
				displayName = "Managing Partner";
				displayNameShort = "Managing Partner";
			};
		};
    };	
	class Contention
    {
        displayName = "CONTENTION";
		displayNameShort = "CONTENTION";
		enemyFactions[] = {"Freezoners", "Zombies"};
	};
	class China
    {
        displayName = "People's Republic of China";
		displayNameShort = "China";
	};
	class CSAT
    {
        displayName = "Canton Protocol Strategic Alliance Treaty";
		displayNameShort = "CSAT";
		
		class Ranks
		{
			class PRIVATE // Ulan
			{
				displayName = "Ulan";
				displayNameShort = "Ulan.";
			};
			class CORPORAL // Centurion
			{
				displayName = "Centurion";
				displayNameShort = "Centurion";
			};
			class SERGEANT // Sub Lieutenant - Lieutenant
			{
				displayName = "Sub Lieutenant";
				displayNameShort = "SLt.";
			};
			class LIEUTENANT // Sub Commander
			{
				displayName = "Sub Commander";
				displayNameShort = "SCdr.";
			};
			class CAPTAIN // Commander
			{
				displayName = "Commander";
				displayNameShort = "Cdr.";
			};
			class MAJOR // Major / Colonel
			{
				displayName = "Major";
				displayNameShort = "Maj.";
			};
			class COLONEL // Vice Proconsul / Proconsul
			{
				displayName = "Proconsul";
				displayNameShort = "Proconsul";
			};
		};
    };
	class DSE
    {
        displayName = "Deep Space Engineering";
		displayNameShort = "DSE";
    };
	class EF
    {
        displayName = "Europe";//"European Federation";
		displayNameShort = "Europe";//"EF";
    };
    class EFMil
    {
        displayName = "EUROFORCE";
		displayNameShort = "EUROFORCE";
		
		class Ranks
		{
			class PRIVATE // Serviceman 3rd Class - Serviceman 2nd Class
			{
				displayName = "Serviceman 2nd Class";
				displayNameShort = "2ndServ.";
			};
			class CORPORAL // Serviceman 1st Class
			{
				displayName = "Serviceman 1st Class";
				displayNameShort = "1stServ.";
			};
			class SERGEANT // Service Chief - Gunnery Chief - Operations Chief
			{
				displayName = "Gunnery Chief";
				displayNameShort = "Chief";
			};
			class LIEUTENANT // 2nd Lieutenant - 1st Lieutenant - Lieutenant Commander - Commander 
			{
				displayName = "Staff Lieutenant";
				displayNameShort = "SLt.";
			};
			class CAPTAIN // Captain
			{
				displayName = "Captain";
				displayNameShort = "Cpt.";
			};
			class MAJOR // Rear Admiral - Admiral 
			{
				displayName = "Admiral";
				displayNameShort = "Adm.";
			};
			class COLONEL // Fleet Admiral
			{
				displayName = "Fleet Admiral";
				displayNameShort = "FAdm.";
			};
		};
    };
	
	class FIA
    {
        displayName = "Freedom and Independence Army";
		displayNameShort = "FIA";
    };
	
	class Freezoners
	{
        displayName = "FREEZONERS";
		displayNameShort = "FREEZONERS";
		enemyFactions[] = {"Contention", "Zombies"};
    };
	
	class ION
    {
        blackListUniforms[] = {"U_O_CombatUniform_ocamo", "U_I_G_resistanceLeader_F", "U_B_Wetsuit"};
		displayName = "ION Inc.";
		displayNameShort = "ION";
		
		class Ranks
		{
			class PRIVATE
			{
				displayName = "Contractor";
				displayNameShort = "Contractor";
				insignia = "img\ranks\Rank_ION_Contractor.paa";
				rankInsignia = "Contractor";
				rate = 0.25;
			};
			class CORPORAL
			{
				displayName = "Senior Contractor";
				displayNameShort = "Senior Contractor";
				insignia = "img\ranks\Rank_ION_SeniorContractor.paa";
				rankInsignia = "SeniorContractor";
				rate = 0.2;
			};
			class SERGEANT
			{
				displayName = "Detail Leader";
				displayNameShort = "Detail Leader";
				insignia = "img\ranks\Rank_ION_DetailLeader.paa";
				rankInsignia = "DetailLeader";
				rate = 0.15;
			};
			class LIEUTENANT
			{
				displayName = "Section Leader";
				displayNameShort = "Section Leader";
				insignia = "img\ranks\Rank_ION_SectionLeader.paa";
				rankInsignia = "SectionLeader";
				rate = 0.1;
			};
			class CAPTAIN
			{
				displayName = "Executive";
				displayNameShort = "Executive";
				insignia = "img\ranks\Rank_ION_Executive.paa";
				rankInsignia = "Executive";
				rate = 0.05;
			};
			class MAJOR
			{
				displayName = "Partner";
				displayNameShort = "Partner";
				rate = 0;
			};
			class COLONEL
			{
				displayName = "Managing Partner";
				displayNameShort = "Managing Partner";
				rate = 0;
			};
		};
    };
	
	class Iran
    {
        displayName = "Islamic Republic of Iran";
		displayNameShort = "Iran";
    };
	class Israel
    {
        displayName = "State Israel";
		displayNameShort = "Israel";
    };
	class Pirates
    {
        displayName = "Pirates";
		displayNameShort = "Pirates";
    };
	class Private
    {
        displayName = "Private";
		displayNameShort = "Private";
    };
	class Rogues
    {
        blacklistUniforms[] = {"U_O_CombatUniform_ocamo", "U_Competitor", "U_B_CTRG_1", "U_B_CTRG_2", "U_B_CTRG_3", "U_I_G_resistanceLeader_F", "U_B_Wetsuit"};
		blacklistHeadgear[] = {"H_Cap_blk_ION"};
		displayName = "Rogues";
		displayNameShort = "Rogues";
    };
	class Russia
    {
        displayName = "Russian Federation";
		displayNameShort = "Russia";
    };
	class Singapore
    {
        displayName = "Republic of Singapore";
		displayNameShort = "Singapore";
    };
	class Unknown
	{
		displayName = "Unknown";
		displayNameShort = "Unknown";
	};
	class USA
    {
        displayName = "United States of America";
		displayNameShort = "USA";
    };
	class Zombies
    {
        blacklistUniforms[] = {"U_B_Wetsuit"};
		displayName = "ZOMBIES";
		displayNameShort = "ZOMBIES";
		enemyFactions[] = {"Contention", "Freezoners"};
    };
};