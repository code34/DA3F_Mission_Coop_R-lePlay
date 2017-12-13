/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_Esc.hpp
*       menu_joueur
*
*/
	class DA3F_menu_Esc {
	 idd = 261117;
	 name= "DA3F_menu_Esc";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_backG: MCF_RscText
		{
			idc = 1000;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class pix_backg: MCF_RscPicture
		{
			idc = 1200;
			text = "imgs\logoA3Custom.jpg";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.33 * safezoneH;
			tooltip = "By Dev'Arma 3 France"; //--- ToDo: Localize;
		};
	 };

	 class controls {
		class DA3F_txt_Site: MCF_RscStructuredText
		{
			idc = 1100;
			text = ".."; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "http://www.devarma3france.fr/"; //--- ToDo: Localize;
		};
		class txt_fb: MCF_RscStructuredText
		{
			idc = 1101;
			text = ".."; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "."; //--- ToDo: Localize;
		};
		class DA3F_paypal: MCF_RscStructuredText
		{
			idc = 1102;
			text = ".."; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "."; //--- ToDo: Localize;
		};
	};
};