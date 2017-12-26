/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_SpawnTemp.hpp
*       Spawn temporaire
*
*/
	class DA3F_menu_SpTemp {
	 idd = 2611172;
	 name= "DA3F_menu_SpTemp";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class backG: MCF_RscText
		{
			idc = 1000;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	 };

	 class controls {
		class edit_notePos: MCF_RscEdit
		{
			idc = 1400;
			text = ".."; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			tooltip = "Indiquez une infos pour vous retrouver dans la liste de vos spawn temporaire"; //--- ToDo: Localize;
		};
		class btn_Save: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Save ma position"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,1,-1,0.8};
			onbuttonclick	= "_this call DA3F_fnc_addTempPos";
			class Attributes 
				{
					align = "center";
					valign = "middle";
					sizeEx= 0.06;
					font="EtelkaMonospacePro";
				};
		};
		class listTempSp: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colortext[] = {-1,0.8,0.1,1};
			sizeEx = 0.03;
		};
		class DA3F_btn_TP: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.8,0.2,0.1,0.8};
			onbuttonclick	= "_this call DA3F_fnc_SpawnTempPos";
			class Attributes 
				{
					align = "center";
					valign = "bottom";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
		};
		class RscStructuredText_1100: MCF_RscStructuredText
		{
			idc = 1100;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Fermeture"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0129166 * safezoneW;
			h = 0.320852 * safezoneH;
			colorBackground[] = {0.9,0.1,0.1,0.9};
			onbuttonclick	= "closedialog 0";
			class Attributes 
				{
					align = "center";
					font="EtelkaMonospacePro";
				};
		};
	};
};