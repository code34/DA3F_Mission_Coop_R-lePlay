	class DA3F_GarageVeh {
	 idd = 161217;
	 name= "DA3F_GarageVeh";
	 movingEnable = true;
	 enableSimulation = true;
	 class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class DA3F_pix_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.33 * safezoneH;
		};
	 };

	 class controls {
		class DA3F_ListeVeh: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.308 * safezoneH;
			colorText[] = {0.9,0.3,-1,1};
			colorBackground[] = {-1,-1,-1,0.5};
			sizeex = 0.05;
		};
		class DA3F_Btn_Garage: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Garage"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.7,0.2,-1,0.85};
			onbuttonclick = "_this call DA3F_fnc_vehicleInGarage";
			tooltip = "Mettre le vehicule au garage"; //--- ToDo: Localize;
					class Attributes {align = "center";};
		};
		class DA3F_btn_Rep: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Reparation"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.6,0.3,0.1,0.85};
			colorBackgroundFocused[] = {0.6,0.2,0,0.5};
			tooltip = "2,500 €"; //--- ToDo: Localize;
			tooltipColor[] = {0.9,0.4,0.1,1}; //--- ToDo: Localize;
			tooltipColorShade[] = {-1,-1,-1,1}; //--- ToDo: Localize;
			onbuttonclick = "_this spawn DA3F_fnc_reparation";
					class Attributes {align = "center";};
		};
		class DA3F_Btn_Close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Fermeture"; //--- ToDo: Localize;
					colorBackground[] = {0.9,0.2,-1,1};
					colorBackground2[] = {0.6,0.3,0,0.5};
		            colorSelectBackground[] = {0.6,0.3,0,0.5};
		            colorSelectBackground2[] = {0,0.5,0,0.5};
					colorBackgroundFocused[] = {0.6,0.2,0,0.5};
					onbuttonclick = "closedialog 0";
					class Attributes {align = "center";};
		};
	};
};





////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Pompot' Le Despote, v1.063, #Deqiti)
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
