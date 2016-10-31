class rscTitles
{
	// RAD
	class SURF_RSC_RAD
	{
		idd = 1000;
		movingenable = false;
		duration = 1e+1000;

		class Controls
		{
			class SURF_PIC_RAD: RscPicture
			{
				idc = 1200;
				text = "images\rad.paa"; // Path to image
				colorText[] = {1,1,1,1.0}; // RGBA
				x = 0.94 * safezoneW + safezoneX;
				y = 0.3 * safezoneH + safezoneY;
				w = 0.052 * safezoneW; // 0.105
				h = 0.084 * safezoneH; // 0.168
			};
		};
	};

	// BIO
	class SURF_RSC_BIO
	{
		idd = 1001;
		movingenable = false;
		duration = 1e+1000;

		class Controls
		{
			class SURF_PIC_BIO: RscPicture
			{
				idc = 1200;
				text = "images\bio.paa"; // Path to image
				colorText[] = {1,1,1,1.0}; // RGBA
				x = 0.94 * safezoneW + safezoneX;
				y = 0.45 * safezoneH + safezoneY;
				w = 0.052 * safezoneW;  // 0.105
				h = 0.084 * safezoneH;  // 0.168
			};
		};
	};

	// Icon
	class SURF_RSC_CHEM
	{
		idd = 1002;
		movingenable = false;
		duration = 1e+1000;

		class Controls
		{
			class SURF_PIC_CHEM: RscPicture
			{
				idc = 1200;
				text = "images\chem.paa"; // Path to image
				colorText[] = {1,1,1,1.0}; // RGBA
				x = 0.94 * safezoneW + safezoneX;
				y = 0.6 * safezoneH + safezoneY;
				w = 0.052 * safezoneW;
				h = 0.084 * safezoneH;
			};
		};
	};
	
	class IP_DLG_SIMPLESENTENCE
	{
		idd = 20000;
		movingenable = false;
		duration = 1e+1000;
		onLoad = "UINamespace setVariable ['DLG_SimpleSentence', _this select 0]"; 		
		
		class Controls
		{
			class IP_BOX_MAIN: BOX
			{
				idc = -1;
				text = ""; //--- ToDo: Localize;
				x = 0.244062 * safezoneW + safezoneX;
				y = 0.724 * safezoneH + safezoneY;
				w = 0.511875 * safezoneW;
				h = 0.112 * safezoneH;
			};
			
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Fylose)
			////////////////////////////////////////////////////////

			class RscFrame_1800: RscFrame
			{
				idc = 1800;
				x = 0.244062 * safezoneW + safezoneX;
				y = 0.724 * safezoneH + safezoneY;
				w = 0.511875 * safezoneW;
				h = 0.112 * safezoneH;
			};
			class RscPicture_1200: RscPicture
			{
				idc = 1200;
				text = "#(argb,256,256,1)r2t(camrender0,1.0)";
				x = 0.250625 * safezoneW + safezoneX;
				y = 0.738 * safezoneH + safezoneY;
				w = 0.065625 * safezoneW;
				h = 0.084 * safezoneH;
			};
			class RscStructuredText_1100: RscStructuredText
			{
				idc = 1100;
				x = 0.322812 * safezoneW + safezoneX;
				y = 0.738 * safezoneH + safezoneY;
				w = 0.426562 * safezoneW;
				h = 0.084 * safezoneH;
			};
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////
		};
	};
};

class IP_DLG_CONVERSATION
{
    idd = 20001;
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
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Bogiri)
		////////////////////////////////////////////////////////

		class IP_FRM_CONVERSATION: RscFrame
		{
			idc = 1800;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class IP_PIC_FIRST: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.112 * safezoneH;
		};
		class IP_PIC_SECOND: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.112 * safezoneH;
		};
		class IP_STX_CONVERSATION: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.504 * safezoneH;
		};
		class IP_LSB_RESPONSES: RscListbox
		{
			idc = 1500;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.112 * safezoneH;
			onLBSelChanged = "((_this select 0) lbData (_this select 1)) call IP_fnc_selectResponse";
		};
		class IP_STX_FIRST: RscStructuredText
		{
			idc = 1101;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.378 * safezoneH;
		};
		class IP_STX_SECOND: RscStructuredText
		{
			idc = 1102;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.378 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};