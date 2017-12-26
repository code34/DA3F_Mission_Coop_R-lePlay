/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_SpawnTemp.hpp
*       Spawn temporaire
*
*/
	class DA3F_menu_MyVeh {
	 idd = 1612172;
	 name= "DA3F_menu_MyVeh";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {

		class DA3F_backG: MCF_RscText
		{
			idc = 1000;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class RscPicture_1200: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.352 * safezoneH;
		};
	 };

	 class controls {

		class RscListbox_1500: MCF_RscListNbox
		{
			idc = 1500;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.264 * safezoneH;
			sizeEx = 0.045;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			onlbselchanged = "_this call DA3F_fnc_showInfoVeh";
		};
		class DA3F_btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.8,-1,1};
			onButtonClick = "_this call DA3F_fnc_CreateVehicle";
			class Attributes {align = "center";};
		};
		class RscControlsGroup_2300: MCF_RscControlsGroup
		{
			idc = 2300;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.264 * safezoneH;
			class Controls
			{	
			class DA3F_ItemsInfo: MCF_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Erreur de chargement de votre garage...";
		                shadow=1;
		                x = 0;
		                y = 0;
		                w = 0.149844 * safezoneW;
		                h = 2.25;
        				colorBackground[] = {-1,-1,-1,0.5};
		        };
			};
		};
		class Btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "X"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
			class Attributes {align = "center";};
			onButtonClick = "closedialog 0";
		};
	};
};