/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_AdminMenu.hpp
*       ???
*
*/

class DA3F_AdminMenu{
	idd = 2212172;
	name= "DA3F_AdminMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_backG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class pixBackG: MCF_RscPicture
		{
			idc = 1201;
			text = "satellite.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	};

		class controls {
		class ListUnit: MCF_RscListNbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.242 * safezoneH;
			colorText[] = {-1,1,-1,0.9};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeex = 0.043;
		};
		class btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Valide"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,0.85,-1,1};
			onbuttonclick = "_this call DA3F_fnc_SwitchAction";
		};
		class listeAction: MCF_RscListNbox
		{
			idc = 1501;
			text = ".."; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.22 * safezoneH;
			colorText[] = {0.9,0.3,0.2,0.95};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeex = 0.043;
		};
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "inscrivez un message ou une somme d'argent"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.066 * safezoneH;			
			canModify = 1;
			linespacing = 1;
    		style = 0 + 16 + 0x200;
			colorText[] = {-1,-1,-1,0.95};
			colorBackground[] = {1,1,1,0.75};
			sizeex = 0.035;
		};
		class CtrlGrp_InfoUnit: MCF_RscControlsGroup
		{
			idc = 2300;
			text = ".."; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.242 * safezoneH;
			class Controls
			{
				class RscStructuredText_1100: MCF_RscStructuredText
				{
					idc = 2010;
					x = 0; 
					y = 0;
					w = 0.155 * safezoneW;
					h = 2 * safezoneH;
				};
			};
		};
		class Btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.85,-1,-1,1};
			onbuttonclick = "closedialog 0";
		};
		/*
		class btn_act_racc_1: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "action 1"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.4,0.1,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		class btn_act_racc_2: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "action 2"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.3,0.1,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		class btn_act_racc_3: MCF_RscButtonMenu
		{
			idc = 2404;
			text = "action 3"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.25,0.2,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		class btn_act_racc_4: MCF_RscButtonMenu
		{
			idc = 2405;
			text = "action 4"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.2,0.15,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		*/
		class btn_Kick: MCF_RscButtonMenu
		{
			idc = 2406;
			text = "Kick"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.95,0.5,0.2,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		class btn_ban: MCF_RscButtonMenu
		{
			idc = 2407;
			text = "Ban"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.95,0.5,0.2,1};
			onbuttonclick = "[1,""En cours de dev...""]call DA3F_fnc_hint";
			class attributes{align="center"};
		};
		class CamLookUnit: MCF_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,0.2)";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.242 * safezoneH;
		};
	};
};








