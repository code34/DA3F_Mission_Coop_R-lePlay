/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_escort.hpp
*       Menu escorte 
*
*/
	class DA3F_escortMenu {
	 idd = 280118;
	 name= "DA3F_escortMenu";
	 movingEnable = 1;
	 enableSimulation = 1;
	 class controlsBackground {
		class backG: MCF_RscText
		{
			idc = 1000;
			x = 0.093125 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.378 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
	 };

	 class controls {

		class Btn_escort: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Escorter"; //--- ToDo: Localize;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
			
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackground2[] = { 0, 0, 0, 0 };
    		colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
			colorSelectBackground[] = { 0, 0, 0, 0 };
			colorSelectBackground2[] = { 0, 0, 0, 0 };
			colorFocused[] = {0,0.65,0.75,1};
			color[] = {-1,0.3,0.9,1};
			color2[] = {1,0.7,0,1};
				class attributes
				{
					size = 2;
					align="center";
				};
			onbuttonclick = "_this call DA3F_fnc_Escorte_Start";
		};

		class Btn_Go_Veh: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Mettre dans le vehicule"; //--- ToDo: Localize;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
			
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackground2[] = { 0, 0, 0, 0 };
    		colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
			colorSelectBackground[] = { 0, 0, 0, 0 };
			colorSelectBackground2[] = { 0, 0, 0, 0 };
			colorFocused[] = {0,0.65,0.75,1};
			color[] = {-1,0.3,0.9,1};
			color2[] = {0.4,0.7,0,1};
				class attributes
				{
					size = 1.5;
					align="center";
				};
			onbuttonclick = "closedialog 0;_this spawn DA3F_fnc_Escorte_Go_Veh";
		};

		class Btn_stop_escorte: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Stopper l'escorte"; //--- ToDo: Localize;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
			
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackground2[] = { 0, 0, 0, 0 };
    		colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
			colorSelectBackground[] = { 0, 0, 0, 0 };
			colorSelectBackground2[] = { 0, 0, 0, 0 };
			colorFocused[] = {0,0.65,0.75,1};
			color[] = {-1,0.3,0.9,1};
			color2[] = {1,0.7,0,1};
				class attributes
				{
					size = 2;
					align="center";
				};
			onbuttonclick = "_this call DA3F_fnc_Escorte_Stop";
		};

		class Btn_freedom: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "Detacher/Liberer"; //--- ToDo: Localize;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
			
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackground2[] = { 0, 0, 0, 0 };
    		colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
			colorSelectBackground[] = { 0, 0, 0, 0 };
			colorSelectBackground2[] = { 0, 0, 0, 0 };
			colorFocused[] = {0,0.65,0.75,1};
			color[] = {-1,0.3,0.9,1};
			color2[] = {1,0.7,0,1};
				class attributes
				{
					size = 2;
					align="center";
				};
			onbuttonclick = "_this call DA3F_fnc_Escorte_Freedom";
		};
	};
};
/*
backG
["0.093125 * safezoneW + safezoneX","0.374 * safezoneH + safezoneY","0.249375 * safezoneW","0.378 * safezoneH"]

Btn_escort
Escorter 
["0.10625 * safezoneW + safezoneX","0.402 * safezoneH + safezoneY","0.223125 * safezoneW","0.07 * safezoneH"]

Btn_Go_Veh
Mettre dans le vehicule
["0.10625 * safezoneW + safezoneX","0.486 * safezoneH + safezoneY","0.223125 * safezoneW","0.07 * safezoneH"]

Btn_stop_escorte
Stopper l'escorte
["0.10625 * safezoneW + safezoneX","0.57 * safezoneH + safezoneY","0.223125 * safezoneW","0.07 * safezoneH"]

Btn_freedom
Detacher/Liberer
["0.10625 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.223125 * safezoneW","0.07 * safezoneH"]

pos center
["0.454062 * safezoneW + safezoneX","0.556 * safezoneH + safezoneY","0 * safezoneW","0 * safezoneH"]
*/