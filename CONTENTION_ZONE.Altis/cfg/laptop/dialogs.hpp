class IP_DLG_LAPTOP
{
    idd = 50000;
    movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Jiwocu)
		////////////////////////////////////////////////////////
		class IP_FRM_LAPTOP: RscFrame
		{
			idc = 1800;
			text = "Skynet v8.01"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class IP_BTN_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.696875 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.042 * safezoneH;
			action = "closeDialog 0";
		};
		class IP_FRM_INNER: RscFrame
		{
			idc = 1801;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.602 * safezoneH;
		};
		class IP_STX_TEXT: RscStructuredText
		{
			idc = 1100;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.574 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};