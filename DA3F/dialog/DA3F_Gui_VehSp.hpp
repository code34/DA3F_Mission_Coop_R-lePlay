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





////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Pompot' Le Despote, v1.063, #Deqiti)
////////////////////////////////////////////////////////

class DA3F_BackG: RscText
{
	idc = 1000;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.374 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.5};
};
class DA3F_ListeVeh: RscListbox
{
	idc = 1500;
	text = ".."; //--- ToDo: Localize;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.308 * safezoneH;
	colorText[] = {0.9,0.3,-1,1};
	colorBackground[] = {-1,-1,-1,0.5};
};
class DA3F_Btn_Garage: RscButtonMenu
{
	idc = 2400;
	text = "Garage"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.7,0.2,-1,0.85};
	tooltip = "Mettre le vehicule au garage"; //--- ToDo: Localize;
};
class DA3F_btn_Rep: RscButtonMenu
{
	idc = 2401;
	text = "Reparation"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.6,0.3,0.1,0.85};
	tooltip = "Mettre le vehicule au garage"; //--- ToDo: Localize;
};
class DA3F_Btn_Close: RscButtonMenu
{
	idc = 2402;
	text = "X"; //--- ToDo: Localize;
	x = 0.70625 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.9,0.1,-1,0.95};
	tooltip = "Fermeture"; //--- ToDo: Localize;
};
class DA3F_pix_backG: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.391875 * safezoneW;
	h = 0.33 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


/*
	Garage pour le retour bdd
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Pompote Le Despote, v1.063, #Rixagu)
////////////////////////////////////////////////////////

class DA3F_backG: RscText
{
	idc = 1000;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.391875 * safezoneW;
	h = 0.396 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.5};
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.264 * safezoneH;
};
class DA3F_btn_Valide: RscButtonMenu
{
	idc = 2400;
	text = "Valider"; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {-1,0.8,-1,1};
};
class RscControlsGroup_2300: RscControlsGroup
{
	idc = 2300;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.264 * safezoneH;
	class Controls
	{
	};
};
class Btn_close: RscButtonMenu
{
	idc = 2401;
	text = "X"; //--- ToDo: Localize;
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,-1,-1,1};
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.37125 * safezoneW;
	h = 0.352 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
