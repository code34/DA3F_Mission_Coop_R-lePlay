
class Gui_ShopNew{
	idd = 120118;
	name= "Gui_ShopNew";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class pixBackG: MCF_RscPicture
		{
			idc = 1200;
			text = "imgs\ShopWB.paa";
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.644 * safezoneH;
		};
	};

class controls {
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.479583 * safezoneW + safezoneX;
			y = 0.764148 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.0335556 * safezoneH;
			colorBackground[] = {0.8,0.8,0.8,0.8};
			colorSelection[] = {0.1,0.2,0.5,0.3};
		};
		class List_Shop: MCF_RscListbox
		{
			idc = 1500;
			text = "..."; //--- ToDo: Localize;
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.336 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colortext[] = {0.1,0.3,0.7,1};
			colorSelectBackground[] = {0.1,0.2,0.5,0.3};
			colorSelectBackground2[] = {0.5,0.2,0.1,0.3};
		};
		class List_ItemsUnit: MCF_RscListbox
		{
			idc = 1501;
			text = "..."; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.336 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colortext[] = {0.1,0.3,0.7,1};
			colorSelectBackground[] = {0.1,0.2,0.5,0.3};
			colorSelectBackground2[] = {0.5,0.2,0.1,0.3};
		};
		class Info_Items: MCF_RscControlsGroup
		{
			idc = 2300;
			text = "";
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.107259 * safezoneH;
			class Controls
			{
				class Info_Items_Txt: MCF_RscStructuredText
				{
					idc = 2301;
					text = "Sélectionne un items";
					x = 0;
					y = 0;
					w = 0.180312 * safezoneW;
					h = 0.100259 * safezoneH;
					/*
					class Attributes {
						align="center";
					};
					*/
				};
			};
		};
		class DA3F_Btn_Buy: MCF_RscButtonMenu
		{
			idc = 2400;
			x = 0.271355 * safezoneW + safezoneX;
			y = 0.757889 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			onbuttonclick = "";
		};

		class DA3F_Btn_Sell: MCF_RscButtonMenu
		{
			idc = 2401;
			x = 0.613541 * safezoneW + safezoneX;
			y = 0.756482 * safezoneH + safezoneY;
			w = 0.116667 * safezoneW;
			h = 0.0410741 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			onbuttonclick = "";
		};

		class DA3F_Btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.730209 * safezoneW + safezoneX;
			y = 0.183556 * safezoneH + safezoneY;
			w = 0.0181249 * safezoneW;
			h = 0.0289259 * safezoneH;
			colorBackground[] = {1,-1,-1,0.85};
			colorBackgroundFocused[] = {0,0,0,0};
			onbuttonclick = "closeDialog 0";
		};
	};
};