class Gui_Veh{
	idd = 251217;
	name= "Gui_Veh";
	//
	movingEnable = true;
	enableSimulation = true;
//	onLoad = "_this execVM 'scripts\Msg.sqf'";

	class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class RscPicture_1200: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.22 * safezoneH;
		};
	};

class controls {

		class DA3F_txt_info: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Attente des infos..."; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class RscListbox_1500: MCF_RscListbox
		{
			idc = 1500;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.198 * safezoneH;
			sizeex = 0.035;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class DA3F_btn_valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.9,0.3,0.1,1};
			onbuttonclick =	"_this call DA3F_fnc_ValideVehAction";
				class Attributes
				{
					align="center";
				};
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "X"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.1,0.1,1};
			onbuttonclick =	"closedialog 0";
		};
	};
};