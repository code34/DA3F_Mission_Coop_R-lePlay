/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_GUI_Consult.hpp
*       Menu permettant de poser/prendre stockage virtuel 
*		Et consultation de la capacité
*
*/
class Gui_Coms_Consult{
	idd = 121217;
	name= "Gui_Coms_Consult";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		

		class DA3F_backG: MCF_RscText
		{
			idc = 1000;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class DA3F_Pix_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.209 * safezoneH;
		};
	};

class controls {
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			sizeEx = 0.04;
		};
		class DA3F_Btn_Dep: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "déposer"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.75,-1,0.85};
            colorSelectBackground[] = {0,0.2,0.5,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.33,0.33,0.4,0.5};
			class Attributes {align = "center";};
			onbuttonclick = "hint 'En cours de dev...'";
		};
		class DA3F_btn_retr: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "prendre"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.75,0.4,0.85};
            colorSelectBackground[] = {0,0.6,0.2,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.33,0.33,0.4,0.5};
			class Attributes {align = "center";};
			onbuttonclick = "hint 'En cours de dev...'";
		};
		class DA3F_GrpInfo: MCF_RscControlsGroup
		{
			idc = 2300;
			text = ".."; //--- ToDo: Localize;
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.209 * safezoneH;
			class Controls
			{			
				class DA3F_ItemsInfo: MCF_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Attente des infos";
		                shadow=1;
		                x = 0;
		                y = 0;
						w = 0.154844 * safezoneW;
						h = 0.418 * safezoneH;
        				colorBackground[] = {-1,-1,-1,0};
		        };
			};
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.75,-1,0.4,0.85};
            colorSelectBackground[] = {1,0,0,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.9,0.25,0,0.5};
			onbuttonclick = "closedialog 0";
		};
	};
};