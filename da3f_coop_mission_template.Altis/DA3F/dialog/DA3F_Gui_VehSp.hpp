	class DA3F_SpawnVeh {
	 idd = 1811173;
	 name= "DA3F_SpawnVeh";
	 movingEnable = true;
	 enableSimulation = true;
	 class controlsBackground {

		class DA3F_img_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0.1,0.1,0.4,0.8)";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class pix_Veh: MCF_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class pix_visu: MCF_RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.143 * safezoneH;
		};
	 };

	 class controls {
		class list_Veh: MCF_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.242 * safezoneH;
			sizeEx = 0.025;
			colorText[]= {0,0.2,0.6,1};
			colorBackground[] = {-1,-1,-1,0.7};
			onLBSelChanged = "";
		};
		class list_sp_veh: MCF_RscListbox
		{
			idc = 1501;
			text = "";
			x = 0.474218 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.121 * safezoneH;
			sizeEx = 0.04;
			colorText[]= {0,0.2,0.6,1};
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class DA3F_ListCate: MCF_RscCombo
		{
			idc = 2100;
			text = ""; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.030 * safezoneH;
			sizeEx = 0.04;
			colorText[]= {0,0.2,0.6,1};
			colorBackground[] = {-1,-1,-1,0.7};
			onLBSelChanged = "_this call DA3F_fnc_ShowList";
		};
		class DA3F_ListVeh: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Choisissez un vehicule"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscStructuredText_1100: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Choisissez un lieu de Spawn";
			x = 0.474218 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,0.6,-1,1};
			colorBackground2[] = {0.6,0.3,0,0.5};
            colorSelectBackground[] = {0.6,0.3,0,0.5};
            colorSelectBackground2[] = {0,0.5,0,0.5};
			tooltip = "Sortie du véhicule"; //--- ToDo: Localize;
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
		};
		class btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Fermeture"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "closedialog 0";
			colorBackground[] = {1,-1,-1,1};
		};
	};
};