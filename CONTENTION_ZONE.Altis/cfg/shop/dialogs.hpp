class IP_DLG_SHOP_MISSIONS
{
    idd = 10000;
    movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Vusahe)
		////////////////////////////////////////////////////////

		class IP_FRM_SHOP_MAIN: RscFrame
		{
			idc = 1800;
			text = "Mission Control"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class IP_BTN_SHOP_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			action = "call IP_fnc_closeShop";
		};
		class IP_PIC_SHOP_PROFILE: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class IP_TXT_SHOP_NAME: RscText
		{
			idc = 1000;
			text = "NAME: "; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_SHOP_RANK: RscText
		{
			idc = 1001;
			text = "RANK: Senior Contractor"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_SHOP_MONEY: RscText
		{
			idc = 1002;
			text = "FUNDS: "; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_SHOP_LABEL_INSERTION: RscText
		{
			idc = 1003;
			text = "Insertion:"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_LSB_SHOP_MISSIONS: RscListbox
		{
			idc = 1500;
			text = "Available Missions"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.231 * safezoneH;
			onLBSelChanged = "IP_LastLSB = 1500; _this call IP_fnc_onLBSelChanged";
			onLBDblClick = "[(lbCurSel 1500), 1500] call IP_fnc_onLBDblClick";
		};
		class IP_STX_SHOP_MISSION: RscStructuredText
		{
			idc = 1100;
			text = "Mission Summary"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class IP_BTN_SELECTMISSION: RscButton
		{
			idc = 1601;
			text = "Select"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Select Mission"; //--- ToDo: Localize;
			action = "1601 call IP_fnc_buttonAction";
		};
		class IP_CMB_SHOP_NAVIGATION: RscCombo
		{
			idc = 2100;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "if ((IP_Navigation select ((_this select 0) lbValue (_this select 1))) != IP_LastOpened) then {[] call IP_fnc_closeShop; [(IP_Navigation select ((_this select 0) lbValue (_this select 1)))] spawn IP_fnc_openShop;};";
		};
		class IP_TXT_SHOP_LABEL_NAVIGATION: RscText
		{
			idc = 1004;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_SHOP_INSERTION: RscCombo
		{
			idc = 2101;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[((_this select 0) lbValue (_this select 1))] call IP_fnc_shopFilter;";
		};
		class IP_BTN_SHOP_INSERT: RscButton
		{
			idc = 1602;
			text = "Insert"; //--- ToDo: Localize;
			x = 0.613438 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Insert to Mission"; //--- ToDo: Localize;
			action = "1602 call IP_fnc_buttonAction";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_SHOP_ITEMS
{
	idd = 10001;
	movingEnable = true;
	
	class Controls
	{
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Bixelu)
		////////////////////////////////////////////////////////

		class IP_FRM_SHOP_CATEGORY: RscFrame
		{
			idc = 1800;
			text = "Shop Category"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class IP_BTN_SHOP_CLOSE: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "call IP_fnc_closeShop";
		};
		class IP_LSB_SHOP_ITEMS_LEFT: RscListbox
		{
			idc = 1500;
			text = "Shop Items Left"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.22 * safezoneH;
			onLBSelChanged = "IP_LastLSB = 1500; _this call IP_fnc_onLBSelChanged";
			onLBDblClick = "[(lbCurSel 1500), 1500] call IP_fnc_onLBDblClick";
		};
		class IP_BTN_SHOP_PURCHASE: RscButton
		{
			idc = 1601;
			text = "Purchase"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			action = "1601 call IP_fnc_buttonAction";
		};
		class IP_TXT_SHOP_ITEMS_LEFT: RscText
		{
			idc = 1004;
			text = "Shop Items Left"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_LSB_SHOP_ITEMS_RIGHT: RscListbox
		{
			idc = 1501;
			text = "Shop Items Right"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.22 * safezoneH;
			onLBSelChanged = "IP_LastLSB = 1501; _this call IP_fnc_onLBSelChanged";
			onLBDblClick = "[(lbCurSel 1501), 1501] call IP_fnc_onLBDblClick";
		};
		class IP_TXT_SHOP_ITEMS_RIGHT: RscText
		{
			idc = 1005;
			text = "Shop Items Right"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_STX_SHOP_INFO: RscStructuredText
		{
			idc = 1100;
			text = "Info Box"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class IP_CMB_SHOP_NAVIGATION: RscCombo
		{
			idc = 2100;
			text = "Navigation"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "if ((IP_Navigation select ((_this select 0) lbValue (_this select 1))) != IP_LastOpened) then {[] call IP_fnc_closeShop; [(IP_Navigation select ((_this select 0) lbValue (_this select 1)))] spawn IP_fnc_openShop;};";
		};
		class IP_TXT_SHOP_NAVIGATION_LABEL: RscText
		{
			idc = 1000;
			text = "Navigation:"; //--- ToDo: Localize;
			x = 0.579426 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_CMB_SHOP_FILTER: RscCombo
		{
			idc = 2101;
			text = "Filter"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[((_this select 0) lbValue (_this select 1))] call IP_fnc_shopFilter;";
		};
		class IP_TXT_SHOP_LABEL_FILTER: RscText
		{
			idc = 1001;
			text = "Filter:"; //--- ToDo: Localize;
			x = 0.579895 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_BTN_SHOP_SELL: RscButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			action = "1602 call IP_fnc_buttonAction";
		};
		class IP_BTN_SHOP_FUNCTION: RscButton
		{
			idc = 1603;
			text = "Additional Function"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			action = "1603 call IP_fnc_buttonAction";
		};
		class IP_TXT_SHOP_LABEL_FUNDS: RscText
		{
			idc = 1002;
			text = "Available Funds:"; //--- ToDo: Localize;
			x = 0.579948 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IP_TXT_SHOP_FUNDS: RscText
		{
			idc = 1003;
			text = "9999999.99"; //--- ToDo: Localize;
			x = 0.580417 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////	
	};
};

class IP_DLG_AMOUNT
{
	idd = 10002;
	movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Nocixy)
		////////////////////////////////////////////////////////

		class IP_FRM_AMOUNT: RscFrame
		{
			idc = 1800;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class IP_TXT_HOWMANY: RscText
		{
			idc = 1000;
			text = "How Many?"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_MAGAZINE: RscText
		{
			idc = 1001;
			text = "5.56mm STANAG 30"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_PRICE: RscText
		{
			idc = 1002;
			text = "Price: "; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_TOTAL: RscText
		{
			idc = 1003;
			text = "Total:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_SLD_AMOUNT: RscSlider
		{
			idc = 1900;
			text = "Amount"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.055 * safezoneH;
			onSliderPosChanged = "(sliderPosition 1900) call IP_fnc_amountSetTotal";
		};
		class IP_BTN_OKAY: RscButton
		{
			idc = 1600;
			text = "Okay"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			action = "1600 call IP_fnc_amountButtonAction";
		};
		class IP_BTN_CANCEL: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closeDialog 0";
		};
		class IP_TXT_AMOUNT: RscText
		{
			idc = 1004;
			text = "Amount: "; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.055 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class IP_DLG_INSERT
{
	idd = 10003;
	movingenable = true;   
    
    class Controls
    {
		class IP_BOX_MAIN: BOX
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.371093 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.253 * safezoneH;
		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by IndeedPete, v1.063, #Pobixa)
		////////////////////////////////////////////////////////

		class IP_FRM_INSERT: RscFrame
		{
			idc = 1800;
			x = 0.371093 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class IP_TXT_LABEL_TO: RscText
		{
			idc = 1000;
			text = "Insert to:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_LABEL_BY: RscText
		{
			idc = 1001;
			text = "By:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_TO: RscText
		{
			idc = 1002;
			text = "Super Long Mission Title"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_BY: RscText
		{
			idc = 1003;
			text = "Super Long Vehicle Display Name"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_BTN_OKAY: RscButton
		{
			idc = 1600;
			text = "Insert"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0; [] call IP_fnc_startMission;";
		};
		class IP_BTN_CANCEL: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0; [] spawn IP_fnc_openShop;";
		};
		class IP_TXT_LABEL_SIZE: RscText
		{
			idc = 1004;
			text = "Team Size:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_SIZE: RscText
		{
			idc = 1005;
			text = "8"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_LABEL_CAPACITY: RscText
		{
			idc = 1006;
			text = "Capacity:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class IP_TXT_CAPACITY: RscText
		{
			idc = 1007;
			text = "20"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};