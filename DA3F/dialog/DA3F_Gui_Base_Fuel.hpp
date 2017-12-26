/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_Base_Fuel.hpp
*       ???
*
*/

class Gui_station{
	idd = 221217;
	name= "Gui_station";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class RscPicture_1200: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
	};

class controls {
		class DA3F_ListVeh: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.242 * safezoneH;
			colorText[] = {0.9,0.3,0.1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			onlbselchanged = "_this call DA3F_fnc_ShowInfoVehFuel";
			sizeex = 0.04;
		};
		class RscStructuredText_1100: MCF_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class DA3F_Edit_Litre: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeex = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,0.75};
			tooltip = "Indiquez le nombre de litre que vous souhaitez mettre dans le vehicule"; //--- ToDo: Localize;
		};
		class DA3F_Liste_citerne: MCF_RscCombo
		{
			idc = 2100;
			text = ".."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			onlbselchanged = "";
			sizeex = 0.04;
		};
		class DA3F_list_Carbu: MCF_RscCombo
		{
			idc = 2101;
			text = ".."; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			onlbselchanged = "";
			sizeex = 0.04;
		};
		
		class DA3F_txt_listeCarbu: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Choisissez le carburant"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes	{align="center";size=0.9;};
		};
		class DA3F_Txt_SelectCiterne: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Choisissez la citerne a debiter"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes	{align="center";size=0.9;};
		};
		class DA3F_btn_valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.3,0.1,1};
			class Attributes	{align="center"};
			onbuttonclick = "_this call DA3F_fnc_refuel";
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.15,0.1,1};
			onbuttonclick = "closeDialog 0";
		};
		class DA3F_btn_valide_full: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Faire le plein"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes	{align="center"};
			colorBackground[] = {0.9,0.4,0.2,1};
			onbuttonclick = "";
		};
	};
};