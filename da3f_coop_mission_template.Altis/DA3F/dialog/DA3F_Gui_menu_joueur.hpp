/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Dan Anderson (pépito)
*       DA3F_Gui_menu_joueur.hpp
*       menu_joueur
*
*/
	class DA3F_menu_joueur {
	 idd = 420000;
	 name= "DA3F_menu_joueur";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
			tooltip = "Mission By [DA3F] Aroun Le BriCodeur"; //--- ToDo: Localize;
		};
		class PixBackG: MCF_RscPicture
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

		class DA3F_ListItems: MCF_RscListbox
		{
			idc = 1501;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.187 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
		};
		class DA3F_Edit_Val: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
		};
		class DA3F_btn_Give: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Donner"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.8,0.5,0.1,1};
			colorText[] = {-1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick ="_this call DA3F_fnc_GiveItems";
		};
		class DA3F_btn_Use: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Utiliser"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.3,0.8,-1,1};
			colorText[] = {-1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick = "_this call DA3F_fnc_UseItems";
		};
		class DA3F_NearUnits_Items: MCF_RscCombo
		{
			idc = 2100;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {-1,-1,-1,0.85};
		};
		class DA3F_NearUnitCash: MCF_RscCombo
		{
			idc = 2101;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {-1,-1,-1,0.85};
		};
		class DA3F_Edit_Cash: MCF_RscEdit
		{
			idc = 1401;
			text = "1"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
		};
		class DA3F_Btn_Give_Cash: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Donner"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.8,0.5,0.1,1};
			colorText[] = {-1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick ="_this call DA3F_fnc_GiveMoney";
		};
		class txt_give_Cash: MCF_RscText
		{
			idc = 1001;
			text = "Donner du cash"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscListbox_1501: MCF_RscListbox
		{
			idc = 1500;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.187 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
		};
		class DA3F_btn_ValideAct: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.9,0.3,-1,1};
			colorText[] = {-1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick = "_this call DA3F_fnc_Units_Interaction_valide";
		};
		class DA3F_btn_Close: MCF_RscButtonMenu
		{
			idc = 2404;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.012552 * safezoneW;
			h = 0.020963 * safezoneH;
			colorBackground[] = {0.9,0.1,-1,1};
			colorText[] = {-1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick = "closedialog 0";
		};		
		class DA3F_CtrlGrp: MCF_RscControlsGroup
		{
			idc = 2300;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.088 * safezoneH;
			class Controls
			{	
			class DA3F_ItemsInfo: MCF_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Liste des Spé. (En cours de dev...)";
		                shadow=1;
		                x = 0;
		                y = 0;
		                w = 0.249813 * safezoneW;
		                h = 2.25;
        				colorBackground[] = {-1,-1,-1,0.5};
		        };
			};
		};
	};
};