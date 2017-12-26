class Gui_Shop_Specialisation{
	idd = 10812172;
	name= "Gui_Shop_Specialisation";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};

		class pix_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.462 * safezoneH;
		};
	};

class controls {
		class DA3F_listSp: MCF_RscListbox
		{
			idc = 1500;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.176 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
			onlbselchanged = "_this call DA3F_fnc_ShowDesc_Spe";
		};

		class DA3F_CtrlGrp: MCF_RscControlsGroup
		{
			idc = 2300;
			text = "";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.176 * safezoneH;
			class Controls
			{	
			class DA3F_ItemsInfo: MCF_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Attente des infos";
		                shadow=1;
		                x = 0;
		                y = 0;
		                w = 0.11575 * safezoneW;
		                h = 2.25;
        				colorBackground[] = {-1,-1,-1,0.5};
		        };
			};
		};
		class DA3F_txt_listeSpe: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Liste des specialisations"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_txt_DescSpe: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Description :"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_txt_SpeUnit: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Vos specialisations"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_list_Spe_Unit: MCF_RscListbox
		{
			idc = 1501;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.132 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
		};
		class DA3F_Btn_Spe_Buy: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {-1,0.85,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,0] call DA3F_fnc_Shop_Spe_BuySell";
		};
		class DA3F_Btn_Spe_Sell: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Revendre mon autorisation"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.85,0.5,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,1] call DA3F_fnc_Shop_Spe_BuySell";
		};
		class DA3F_Btn_Spe_Close: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "X"; //--- ToDo: Localize;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.85,-1,-1,1};
			onbuttonclick = "closedialog 0";
		};
	};
};