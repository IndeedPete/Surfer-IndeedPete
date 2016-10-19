// Character Templates
class CharacterTemplates 
{	
	// Dealer
	class dealer 
	{
		allowDamage = 0;
		goggles = "";
		headgear = "";
		identity = "dealer";
		items[] = {"FirstAidKit"};
		night[] = {"false", "false"};
		rank = "CAPTAIN";
		skill = 3;
		uniform = "U_C_HunterBody_grn";
		variables = "[['IP_Faction', 'Freezoners', true], ['IP_LiveFeed', true, true], ['IP_Avatar', 'images\dealerAvatar.jpg', true], ['IP_ConvSpecial', 'Dealer', true], ['IP_MissionRadius', [500, 2500], true]]";
	};
	
	// Doctor
	class doctor 
	{
		allowDamage = 0;
		goggles = "G_Lady_Dark";
		headgear = "";
		identity = "doctor";
		items[] = {"FirstAidKit"};
		night[] = {"false", "false"};
		rank = "LIEUTENANT";
		skill = 4;
		uniform = "U_C_Scientist";
		texture = "images\hawkins3.paa";
		variables = "[['IP_LiveFeed', true, true], ['IP_Avatar', 'images\doctorAvatar.jpg', true], ['IP_ConvSpecial', 'Quantum Physicist And Hobby Surgeon', true]]";
	};
	
	// Gravedigger
	class gravedigger 
	{
		allowDamage = 0;
		goggles = "G_Bandanna_beast";
		headgear = "H_Hat_brown";
		identity = "gravedigger";
		items[] = {"FirstAidKit"};
		night[] = {"false", "false"};
		rank = "MAJOR";
		skill = 5;
		uniform = "U_I_G_resistanceLeader_F";
		variables = "[['IP_LiveFeed', true, true], ['IP_Avatar', 'images\gravediggerAvatar.jpg', true], ['IP_ConvSpecial', 'Guardian Of The Dead', true]]";
	};
	
	// Mechanic
	class mechanic 
	{
		allowDamage = 0;
		backpack = "";
		goggles = "G_Aviator";
		headgear = "H_Cap_blk_CMMG";
		identity = "mechanic";
		insignia = "111thID";
		items[] = {"FirstAidKit"};
		magazines = "[['9Rnd_45ACP_Mag', 3]]";
		night[] = {"false", "false"};
		rank = "LIEUTENANT";
		skill = 4;
		uniform = "U_C_WorkerCoveralls";
		texture = "images\MadMike4.paa";
		variables = "[['IP_LiveFeed', true, true], ['IP_Avatar', 'images\mechanicAvatar.jpg', true], ['IP_ConvSpecial', 'Hill Billy And Mechanic', true]]";
		vest = "V_Rangemaster_belt";
		//weapons[] = {"hgun_ACPC2_F"};
		weapons[] = {};
	};
	
	// Priest
	class priest 
	{
		allowDamage = 0;
		backpack = "";
		goggles = "";
		headgear = "";
		identity = "priest";
		items[] = {};
		magazines = "[]";
		night[] = {"false", "false"};
		uniform = "U_C_Scientist";
		texture = "images\priest.paa";
		variables = "[['IP_LiveFeed', true, true], ['IP_Avatar', 'images\profStartAvatar.jpg', true]]";
		vest = "";
		weapons[] = {};
	};
	
	// Professor Wolfram
	class profStart 
	{
		allowDamage = 0;
		goggles = "";
		headgear = "";
		identity = "profStart";
		items[] = {};
		magazines = "[]";
		night[] = {"false", "false"};
		uniform = "U_C_Scientist";
		texture = "images\ScienceZombie.paa";
		variables = "[['IP_LiveFeed', true, true], ['IP_Avatar', 'images\profStartAvatar.jpg', true]]";
		vest = "";
		weapons[] = {};
	};
	
	// Rival
	class rival {
		allowDamage = 0;
		attachments = "[['optic_Nightstalker']]";
		goggles = "G_Lowprofile";
		headgear = "";
		identity = "rival";
		items[] = {"FirstAidKit"};
		magazines = "[['150Rnd_762x54_Box', 3], ['9Rnd_45ACP_Mag', 3], ['HandGrenade', 2], ['SmokeShell', 1], ['SmokeShellGreen', 1]]";
		night[] = {"false", "false"};
		rank = "SERGEANT";
		skill = 5;
		//texture[] = {"txt\clothingMOD.rvmat", "txt\clothing_rus_coBA.paa"};
		texture = "images\OpforClothing_Grey.paa";
		uniform = "U_O_CombatUniform_ocamo";
		variables = "[['IP_Faction', 'Contention', true], ['IP_LiveFeed', true, true], ['IP_Avatar', 'images\rivalAvatar.jpg', true]]";
		vest = "V_PlateCarrier1_blk";
		weapons[] = {"LMG_Zafir_pointer_F", "hgun_ACPC2_F"};
	};
};