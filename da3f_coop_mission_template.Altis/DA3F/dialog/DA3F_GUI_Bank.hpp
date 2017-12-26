class Gui_Bank{
	idd = 19319;
	name= "Gui_Bank";
	//
	movingEnable = true;
	enableSimulation = true;
//	onLoad = "_this execVM 'scripts\Msg.sqf'";

	class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.35568 * safezoneW + safezoneX;
			y = 0.379019 * safezoneH + safezoneY;
			w = 0.278331 * safezoneW;
			h = 0.263959 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Dev'Arma 3 France"; //--- ToDo: Localize;
		};
	};

class controls {
		class DA3F_Cash: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Cash :"; //--- ToDo: Localize;
			x = 0.376298 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0876226 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_CashEdit: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Cash Joueur"; //--- ToDo: Localize;
			x = 0.515463 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0876226 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class devise: MCF_RscStructuredText
		{
			idc = 1102;
			text = "€"; //--- ToDo: Localize;
			x = 0.613394 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0154628 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_Bank: MCF_RscStructuredText
		{
			idc = 1103;
			text = "Banque :"; //--- ToDo: Localize;
			x = 0.376298 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.0876226 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_BankEdit: MCF_RscStructuredText
		{
			idc = 1104;
			text = "Banque Joueur"; //--- ToDo: Localize;
			x = 0.515463 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.0876226 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class devise_bis: MCF_RscStructuredText
		{
			idc = 1105;
			text = "€"; //--- ToDo: Localize;
			x = 0.613394 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.0154628 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "0"; //--- ToDo: Localize;
			x = 0.376298 * safezoneW + safezoneX;
			y = 0.554991 * safezoneH + safezoneY;
			w = 0.0876226 * safezoneW;
			h = 0.0439931 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class  DA3F_btn_depo: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Déposer"; //--- ToDo: Localize;
			x = 0.510309 * safezoneW + safezoneX;
			y = 0.532995 * safezoneH + safezoneY;
			w = 0.0670055 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_Retir: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Retirer"; //--- ToDo: Localize;
			x = 0.510309 * safezoneW + safezoneX;
			y = 0.576988 * safezoneH + safezoneY;
			w = 0.0670055 * safezoneW;
			h = 0.0329948 * safezoneH;
		};
		class DA3F_Close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.592777 * safezoneW + safezoneX;
			y = 0.532995 * safezoneH + safezoneY;
			w = 0.0309256 * safezoneW;
			h = 0.0769879 * safezoneH;
			colorBackground[] = {0.8,-1,-1,0.7};
		};
	};
};