/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_GUI_Consult.hpp
*       Menu permettant de poser/prendre stockage virtuel 
*		Et consultation de la capacité
*
*/
class Gui_Coms_Consult{
	idd = 121217;
	name= "Gui_Coms_Consult";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		

		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.525782 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class Pix_BackG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.308 * safezoneH;
		};
	};

class controls {
		class edit: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
			sizeEx = 0.04;
		};
		class List_InvPlayer: MCF_RscListbox
		{
			idc = 1500;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = 0.04;
			colorText[]=	{0.9,0.3,0.1,1};
		};
		class ListeStockag: MCF_RscListbox
		{
			idc = 1501;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = 0.04;
			colorText[]=	{0.9,0.3,0.1,1};
		};
		class txt_inv: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Inventaire"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {align = "center";};
		};
		class txt_Stock: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Stockage"; //--- ToDo: Localize;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {align = "center";};
		};
		class btn_switch_Inv: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "<.< "; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.75,0.4,0.85};
            colorSelectBackground[] = {0,0.6,0.2,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.33,0.33,0.4,0.5};
			class Attributes {align = "center";};
			onbuttonclick = "";//[1] call DA3F_fnc_Transfert_Target_1
			tooltip = "Transfert dans l'inventaire"; //--- ToDo: Localize;
		};
		class btn_switchStock: MCF_RscButtonMenu
		{
			idc = 2401;
			text = ">.> "; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.75,-1,0.85};
            colorSelectBackground[] = {0,0.2,0.5,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.33,0.33,0.4,0.5};
			class Attributes {align = "center";};
			onbuttonclick = "";//[0] call DA3F_fnc_Transfert_Target_1
			tooltip = "Transfert dans le stockage"; //--- ToDo: Localize;
		};
		class Btn_Close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.75,-1,0.4,0.85};
            colorSelectBackground[] = {1,0,0,0.5};
            colorSelectBackground2[] = {0,1,0,0.5};
			colorBackgroundFocused[] = {0.9,0.25,0,0.5};
			onbuttonclick = "closedialog 0";
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
	};
};



////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Pompote Le Despote, v1.063, #Jyxize)
////////////////////////////////////////////////////////
/*
class DA3F_BackG: RscText
{
	idc = 1000;
	x = 0.525782 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.422812 * safezoneW;
	h = 0.33 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.4};
};
class List_InvPlayer: RscListbox
{
	idc = 1500;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.22 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.3};
};
class ListeStockag: RscListbox
{
	idc = 1501;
	x = 0.7475 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.22 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.3};
};
class txt_inv: RscStructuredText
{
	idc = 1100;
	text = "Inventaire"; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.033 * safezoneH;
};
class txt_Stock: RscStructuredText
{
	idc = 1101;
	text = "Stockage"; //--- ToDo: Localize;
	x = 0.7475 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.033 * safezoneH;
};
class btn_switch_Inv: RscButtonMenu
{
	idc = 2400;
	text = "<<<"; //--- ToDo: Localize;
	x = 0.793906 * safezoneW + safezoneX;
	y = 0.753 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.9,0.3,0.1,1};
	tooltip = "Transfert dans l'inventaire"; //--- ToDo: Localize;
};
class btn_switchStock: RscButtonMenu
{
	idc = 2401;
	text = ">>>"; //--- ToDo: Localize;
	x = 0.603125 * safezoneW + safezoneX;
	y = 0.753 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.9,0.3,0.1,1};
	tooltip = "Transfert dans le stockage"; //--- ToDo: Localize;
};
class Btn_Close: RscButtonMenu
{
	idc = 2402;
	text = "X"; //--- ToDo: Localize;
	x = 0.948594 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.9,0,0.1,1};
	tooltip = "Fermeture du menu"; //--- ToDo: Localize;
};
class Pix_BackG: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,0.3)";
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.308 * safezoneH;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
