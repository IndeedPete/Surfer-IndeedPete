class IP_DLG_PARAMS
{
    idd = 30000;
    movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Ciciqe)
		////////////////////////////////////////////////////////

		class IP_FRM_MAIN: RscFrame
		{
			idc = 1800;
			text = "PARAMETERS"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class IP_BTN_START: RscButton
		{
			idc = 1600;
			text = "Enter the Zone"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[true] call IP_fnc_assignParameters; closeDialog 0;";
			tooltip = "Start mission.";
		};
		class IP_BTN_RANDOM: RscButton
		{
			idc = 1601;
			text = "Random"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[1] call IP_fnc_openParamDialog";
			tooltip = "Set random parameters.";
		};
		class IP_BTN_RESET: RscButton
		{
			idc = 1602;
			text = "Reset"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
			action = "closeDialog 0";
			tooltip = "Reset parameters to default.";
		};
		class IP_TXT_RAIN: RscText
		{
			idc = 1000;
			text = "Acid Rain"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_FOG: RscText
		{
			idc = 1001;
			text = "Toxic Fog"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_BLOWOUT: RscText
		{
			idc = 1002;
			text = "Blowouts"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_ANOMALIES: RscText
		{
			idc = 1003;
			text = "Random Anomalies"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_LOOT: RscText
		{
			idc = 1004;
			text = "Loot Chance"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_STARTMONEY: RscText
		{
			idc = 1005;
			text = "Start Money"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_STARTEQUIPMENT: RscText
		{
			idc = 1006;
			text = "Start Equipment"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_PATROLS: RscText
		{
			idc = 1007;
			text = "Random Patrols"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_SKILL: RscText
		{
			idc = 1008;
			text = "Enemy AI Skill"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_PLAYINTRO: RscText
		{
			idc = 1009;
			text = "Play Intro"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_FRM_ZONE: RscFrame
		{
			idc = 1801;
			text = "ZONE"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class IP_FRM_MISSION: RscFrame
		{
			idc = 1802;
			text = "MISSION"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class IP_FRM_PLAYER: RscFrame
		{
			idc = 1803;
			text = "PLAYER"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class IP_FRM_ENEMIES: RscFrame
		{
			idc = 1804;
			text = "ENEMIES"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class IP_CMB_DAYLENGTH: RscCombo
		{
			idc = 2100;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the length of a day in minutes.";
		};
		class IP_TXT_DAYLENGHT: RscText
		{
			idc = 1010;
			text = "Day Length"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_START: RscText
		{
			idc = 1011;
			text = "Start"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_START: RscCombo
		{
			idc = 2101;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether you want to start the mission at day or at night.";
		};
		class IP_CMB_ACIDRAIN: RscCombo
		{
			idc = 2102;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether rain can cause damage or not.";
		};
		class IP_CMB_TOXICFOG: RscCombo
		{
			idc = 2103;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether fog can cause damage or not.";
		};
		class IP_CMB_BLOWOUTS: RscCombo
		{
			idc = 2104;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set to create a Blowout every X-Y minutes.";
		};
		class IP_CMB_RANDOMANOMALIES: RscCombo
		{
			idc = 2105;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set to create X-Y random anomalies on the map.";
		};
		class IP_CMB_PLAYINTRO: RscCombo
		{
			idc = 2106;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether you want to play the intro mission or start in the main camp right away.";
		};
		class IP_CMB_ENABLEMODCONTENT: RscCombo
		{
			idc = 2107;
			text = "Enable Mod Content"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Obsolete, does not work!";
		};
		class IP_CMB_AUTOINDEXING: RscCombo
		{
			idc = 2108;
			text = "Automated Indexing"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether you want the shop system to automatically index all mod content you are running and make it available for purchasing.";
		};
		class IP_CMB_LOOTCHANCE: RscCombo
		{
			idc = 2109;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the chance of random loot spawning in enterable buildings.";
		};
		class IP_TXT_ENABLEMODCONTENT: RscText
		{
			idc = 1012;
			text = "Enable Mod Content"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_AUTOINDEXING: RscText
		{
			idc = 1013;
			text = "Automated Indexing"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_RANDOMPATROLS: RscCombo
		{
			idc = 2110;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether random enemy patrols are dynamically spawned in near-by locations.";
		};
		class IP_CMB_ENEMYAISKILL: RscCombo
		{
			idc = 2111;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the skill level of enemy AI units.";
		};
		class IP_CMB_ENEMYWEAPONPICKUP: RscCombo
		{
			idc = 2112;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set whether you want to be able to pick up weapons from killed CONTENTION mercenaries.";
		};
		class IP_TXT_ENEMYWEAPONPICKUP: RscText
		{
			idc = 1015;
			text = "Weapons Lootable"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_STARTMONEY: RscCombo
		{
			idc = 2113;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the amount of cash available right from the start.";
		};
		class IP_CMB_STARTEQUIPMENT: RscCombo
		{
			idc = 2114;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the equipment available right from the start.";
		};
		class IP_TXT_NIGHTLENGTH: RscText
		{
			idc = 1014;
			text = "Night Length"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_NIGHTLENGTH: RscCombo
		{
			idc = 2115;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set the length of a night in minutes.";
		};
		class IP_BTN_LOAD: RscButton
		{
			idc = 1603;
			text = "Load"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[2] call IP_fnc_openParamDialog";
			tooltip = "Load the saved parameter preset from your profile namespace.";
		};
		class IP_BTN_SAVE: RscButton
		{
			idc = 1604;
			text = "Save"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[false] call IP_fnc_assignParameters";
			tooltip = "Save the currently set parameters to your profile namespace.";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
