	class DA3F_MenuStartSpawn {
	 idd = 221117;
	 name= "DA3F_MenuStartSpawn";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_Pix: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.2};
		};

		class DA3F_MapView: MCF_RscMapControl
		 {
		 idc = 31400;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.385 * safezoneH;
		 maxSatelliteAlpha = 0.75;
		 alphaFadeStartScale = 1.15;
		 alphaFadeEndScale = 1.29;
		 };
		class DA3F_txt_head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "mission blablabal"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.121 * safezoneH;
		};
	 };

class controls {

		class DA3F_Combo_1: MCF_RscCombo
		{
			idc = 2100;
			text = ".."; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class DA3F_Combo_2: MCF_RscCombo
		{
			idc = 2101;
			text = ".."; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
/*
		class DA3F_combo_3: RscCombo
		{
			idc = 2102;
			text = ".."; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
*/

		class DA3F_List_Spawn: MCF_RscListNBox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.088 * safezoneH;
            coloumns[] = {0,0,0.9};
            drawSideArrows = 0;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.050;
			sizeEx = 0.05;
			ColorText[] = {0,0.9,-1,1};
			colorBackground2[] = {0.6,0.3,0,0.5};
            colorSelectBackground[] = {-1,-1,-1,0.8};
            colorSelectBackground2[] = {0.8,0.2,-1,1};
			onlbselchanged="[_this,1] call DA3F_fnc_SelectSpawnMap";
		};
		/*
		class DA3F_List_Spawn: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.088 * safezoneH;
			sizeEx = 0.05;
			ColorText[] = {0,0.9,-1,1};
			colorBackground2[] = {0.6,0.3,0,0.5};
            colorSelectBackground[] = {-1,-1,-1,0.8};
            colorSelectBackground2[] = {0.8,0.2,-1,1};
			onlbselchanged="[_this,1] call DA3F_fnc_SelectSpawnMap";
		};
		*/
		class DA3F_btn_spawn: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.785074 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,0.2,-1,1};
			colorSelectBackground2[] = {-1,1,-1,0.5};
			onbuttonclick = "call DA3F_fnc_SpawnStartValide";
			lineSpacing = 0;
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
		};

		class DA3F_btn_lobby: MCF_RscButtonMenu
		{
			idc = 2401;
			x = 0.721198 * safezoneW + safezoneX;
			y = 0.280926 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.396 * safezoneH;
			tooltip	= "Retour au lobby";
			TooltipColorBox[] = {0.9,-1,-1,1};
			TooltipColorShade[] = {-1,-1,-1,1};
			TooltipColorText[] = {0.9,-1,-1,1};
			tooltipColor[] = {0.9,-1,-1,1};
			colorBackground[] = {0.9,-1,-1,1};
			colorBackground2[] = {0.8,0.2,-1,1};
            colorSelectBackground2[] = {0.8,0.2,-1,1};
			onbuttonclick = "closedialog 0; endMission 'BackLobby';";
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";color="#0000FF";
				};
		};
	};
};



////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Tomie Lobo, v1.063, #Boliwu)
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////


	class DA3F_NewStartMenu {
	 idd = 1091217;
	 name= "DA3F_NewStartMenu";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {

		class DA3F_Pix: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.242188 * safezoneW + safezoneX;
			y = 0.00499995 * safezoneH + safezoneY;
			w = 0.752813 * safezoneW;
			h = 0.99 * safezoneH;
		};

		class DA3F_BACKG_Liste: MCF_RscText
		{
			idc = 1000;
			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 1.001 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
/*
class DA3F_ShowMap: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.314531 * safezoneW;
	h = 0.396 * safezoneH;
};
*/
		class DA3F_MapView: MCF_RscMapControl
		 {
			idc = 31400;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.396 * safezoneH;
			 maxSatelliteAlpha = 0.75;
			 alphaFadeStartScale = 1.15;
			 alphaFadeEndScale = 1.29;
		 };

		class DA3F_ShowCam: MCF_RscPicture
		{
			idc = 1201;
			text = "imgs\404error.jpg";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.396 * safezoneH;
		};
	 };

class controls {
		class DA3F_txt_head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "mission blablabal"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class DA3F_List_Sp: MCF_RscListbox
		{
			idc = 1500;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.363 * safezoneH;
			sizeEx = 0.045;
			ColorText[] = {0.1,0.2,0.8,1};
			colorBackground2[] = {0.6,0.3,0,0.5};
            colorSelectBackground[] = {-1,-1,-1,0.8};
            colorSelectBackground2[] = {0.8,0.2,-1,1};
			onlbselchanged="[_this,2] call DA3F_fnc_SelectSpawnMap";
		};
		class DA3F_btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.9,0.3,-1,1};
			onbuttonclick = "call DA3F_fnc_SpawnStartValide";
			class Attributes {align = "center";valign="middle";
					font="EtelkaMonospacePro";color="#0000FF";};
		};
		class DA3F_btn_backLobby: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Retour lobby"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.815 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.9,0.1,-1,1};
			class Attributes {align = "center";valign="middle";
					font="EtelkaMonospacePro";color="#0000FF";};
			onbuttonclick = "closedialog 0; endMission 'BackLobby';";
		};		
		class DA3F_CtrlGrp: MCF_RscControlsGroup
		{
			idc = 2300;
			text = "";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.209 * safezoneH;
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
		                w = 0.219875 * safezoneW;
		                h = 1.25;
        				colorBackground[] = {0,0,0,0};
		        };
			};
		};
		class DA3F_Combo_Sol_Air: MCF_RscCombo
		{
			idc = 2100;
			text = "."; //--- ToDo: Localize;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_Combo_Alti: MCF_RscCombo
		{
			idc = 2101;
			text = "."; //--- ToDo: Localize;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		/*
		class btn_dezoom: MCF_RscButtonMenu
		{
			idc = 2404;
			text = "< < <"; //--- ToDo: Localize;
			x = 0.95375 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.0341145 * safezoneW;
			h = 0.0255926 * safezoneH;
			colorBackground[] = {0.9,0.2,-1,1};
		};
		*/
		class Btn_ShowMap: MCF_RscButtonMenu
		{
			idc = 2402;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.396 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_Spawn_ResizePix";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};
		class btn_showCam: MCF_RscButtonMenu
		{
			idc = 2403;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.396 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_Spawn_ResizePix";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




/*
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Tomie Lobo, v1.063, #Relagy)
////////////////////////////////////////////////////////

class DA3F_BACKG_Liste: RscText
{
	idc = 1000;
	x = -0.000156274 * safezoneW + safezoneX;
	y = -0.00599999 * safezoneH + safezoneY;
	w = 0.242344 * safezoneW;
	h = 1.001 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.4};
};
class DA3F_List_Sp: RscListbox
{
	idc = 1500;
	x = 0.00499997 * safezoneW + safezoneX;
	y = 0.00500001 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.363 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.6};
};
class DA3F_Show_Map: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,0.3)";
	x = 0.242188 * safezoneW + safezoneX;
	y = 0.00499995 * safezoneH + safezoneY;
	w = 0.752813 * safezoneW;
	h = 0.99 * safezoneH;
};
class DA3F_ShowCam: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.314531 * safezoneW;
	h = 0.396 * safezoneH;
};
class DA3F_btn_Valide: RscButtonMenu
{
	idc = 2400;
	text = "Spawn"; //--- ToDo: Localize;
	x = 0.0153125 * safezoneW + safezoneX;
	y = 0.797 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {-1,-1,-1,1};
	colorBackground[] = {0.9,0.3,-1,1};
};
class DA3F_btn_backLobby: RscButtonMenu
{
	idc = 2401;
	text = "Retour lobby"; //--- ToDo: Localize;
	x = 0.0153125 * safezoneW + safezoneX;
	y = 0.874 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {-1,-1,-1,1};
	colorBackground[] = {0.9,0.1,-1,1};
};
class DA3F_DescripSp: RscControlsGroup
{
	idc = 2300;
	text = "..."; //--- ToDo: Localize;
	x = 0.00499997 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.226875 * safezoneW;
	h = 0.209 * safezoneH;
	class Controls
	{
	};
};
class DA3F_Combo_Sol_Air: RscCombo
{
	idc = 2100;
	text = "."; //--- ToDo: Localize;
	x = 0.025625 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.180469 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {-1,-1,-1,1};
};
class DA3F_Combo_Alti: RscCombo
{
	idc = 2101;
	text = "."; //--- ToDo: Localize;
	x = 0.025625 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.180469 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {-1,-1,-1,1};
};
class DA3F_ShowMap: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.314531 * safezoneW;
	h = 0.396 * safezoneH;
};
class Btn_ShowMap: RscButtonMenu
{
	idc = 2402;
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.314531 * safezoneW;
	h = 0.396 * safezoneH;
};
class btn_showCam: RscButtonMenu
{
	idc = 2403;
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.314531 * safezoneW;
	h = 0.396 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


*/