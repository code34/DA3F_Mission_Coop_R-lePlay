	class DA3F_DeathMenu {
	 idd = 1811172;
	 name= "DA3F_DeathMenu";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_Result_Info: MCF_RscStructuredText
		{
			idc = 1100;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class RscStructuredText_1101: MCF_RscStructuredText
		{
			idc = 1101;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
	 };

	 class controls {
		class DA3F_Call_Medic: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Demander de l'aide"; //--- ToDo: Localize;
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {align = "center";};
			colorBackground[] = {-1,1,0.1,0.8};
			onbuttonclick = "_this call DA3F_fnc_Help_Me";
		};
		class DA3F_btn_Respawn: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Respawn"; //--- ToDo: Localize;
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "DA3F_IsRespawn = true;call DA3F_fnc_SpawnStartMenu";
			colorBackground[] = {0.4,0.2,0.1,0.8};
			class Attributes {align = "center";};
		};
		class DA3F_btn_Backlobby: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Retour au lobby"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {align = "center";};
			onbuttonclick = "call DA3F_fnc_backLobby";
			colorBackground[] = {0.8,0.2,0.1,0.8};
		};
	};
};