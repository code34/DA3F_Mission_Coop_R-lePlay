/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_ShopVehicule.hpp
*
*/	
	class DA3F_SpawnVeh {
	 idd = 1811173;
	 name= "DA3F_SpawnVeh";
	 movingEnable = true;
	 enableSimulation = true;
	 onload = "";
	 class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.11328 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.773438 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class pixBackG: MCF_RscPicture
		{
			idc = 1203;
			text = "satellite.jpg";
			x = 0.118438 * safezoneW + safezoneX;
			y = 0.252444 * safezoneH + safezoneY;
			w = 0.763125 * safezoneW;
			h = 0.577556 * safezoneH;
		};

		class DA3F_Pix_Veh: MCF_RscPicture
		{
			idc = 1200;
			text = "imgs\404error.jpg";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class DA3F_CamMrk: MCF_RscPicture
		{
			idc = 1201;
			text = "imgs\404error.jpg";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class DA3F_MapView: MCF_RscMapControl
		 {
		 idc = 31400;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.517 * safezoneH;
		 maxSatelliteAlpha = 0.75;
		 alphaFadeStartScale = 1.15;
		 alphaFadeEndScale = 1.29;
		 };
	 };

	 class controls {
		class DA3F_txt_veh: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Choisissez une catégorie :"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_listCat: MCF_RscCombo
		{
			idc = 2100;
			text = ".."; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
					onlbselchanged = "_this call DA3F_fnc_ShowList";
					sizeEx = 0.04;
					colorText[]= {0,0.7,0.2,1};
					colorBackground[] = {-1,-1,-1,0.7};
		};
		class DA3F_listVeh: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.165 * safezoneH;
					sizeEx = 0.04;
					colorText[]= {0,0.7,0.2,1};
					colorBackground[] = {-1,-1,-1,0.7};
					onlbselchanged = "[_this,0] call DA3F_fnc_ShowCam";
		};
		class DA3F_List_Mrk: MCF_RscListbox
		{
			idc = 1501;
			text = ".."; //--- ToDo: Localize;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.176 * safezoneH;
					sizeEx = 0.04;
					colorText[]= {0,0.7,0.2,1};
					colorBackground[] = {-1,-1,-1,0.7};
					tooltip = "Lieu sur le quel  le vehicule sera envoye"; //--- ToDo: Localize;
					onlbselchanged = "[_this,1] call DA3F_fnc_ShowCam";
		};
		class RscStructuredText_1101: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Choisissez un lieu de spawn"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_Param_1: MCF_RscCombo
		{
			idc = 2101;
			text = ".."; //--- ToDo: Localize;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_Param_2: MCF_RscCombo
		{
			idc = 2102;
			text = ".."; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_Param_3: MCF_RscCombo
		{
			idc = 2103;
			text = ".."; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class DA3F_btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn Vehicule"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.525937 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_ValideVehBuy";
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.15;
					font="EtelkaMonospacePro";
				};
			colorBackground[] = {-1,0.8,0.1,1};
		};
		class DA3F_btn_Close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Fermeture du menu"; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.773438 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "closedialog 0";
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
			colorBackground[] = {0.8,-1,0.1,1};
		};
		class DA3F: MCF_RscStructuredText
		{
			idc = 1102;
			text = "By Dev'Arma 3 France"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};