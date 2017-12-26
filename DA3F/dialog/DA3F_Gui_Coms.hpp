class Gui_Coms_Connex{
	idd = 1071217;
	name= "Gui_Coms_Connex";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_BackG: MCF_RscPicture
		{
			idc = 1200;
			text = "imgs\ComsDA3F.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.484 * safezoneH;
		};
	};

class controls {
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.429844 * safezoneW + safezoneX;
			y = 0.509148 * safezoneH + safezoneY;
			w = 0.136145 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,1};
			colorText[] = {-1,-1,-1,1};
			sizeEx = 0.05;
			font = "EtelkaMonospacePro";
			class Attributes {align = "center";};
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2400;
			x = 0.31953 * safezoneW + safezoneX;
			y = 0.637556 * safezoneH + safezoneY;
			w = 0.0339583 * safezoneW;
			h = 0.0559259 * safezoneH;
			onbuttonclick = "closedialog 0";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,0,0,0.4};
		};
		class DA3F_Btn_Co: MCF_RscButtonMenu
		{
			idc = 2401;
			x = 0.647916 * safezoneW + safezoneX;
			y = 0.637963 * safezoneH + safezoneY;
			w = 0.0339583 * safezoneW;
			h = 0.0559259 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_Coms_Connexion";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,1,0,0.4};
		};
	};
};



class Gui_Coms_inter{
	idd = 10712172;
	name= "Gui_Coms_inter";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_BackG: MCF_RscPicture
		{
			idc = 1200;
			text = "imgs\ComsmsgDA3F.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.484 * safezoneH;
		};
	};

class controls {
		class DA3F_ListUnit: MCF_RscCombo
		{
			idc = 2100;
			x = 0.398687 * safezoneW + safezoneX;
			y = 0.439148 * safezoneH + safezoneY;
			w = 0.208437 * safezoneW;
			h = 0.035 * safezoneH;
			font="EtelkaMonospacePro";
			colorBackground[] = {1,1,1,0.9};
			colorText[] = {-1,-1,-1,1};
			//onlbselchanged = "_this call DA3F_fnc_SC_showList";
			sizeEx= 0.04;
		};
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.368687 * safezoneW + safezoneX;
			y = 0.479148 * safezoneH + safezoneY;
			w = 0.258437 * safezoneW;
			h = 0.150 * safezoneH;
			colorBackground[] = {1,1,1,1};
			colorText[] = {-1,-1,-1,1};
			sizeEx = 0.05;			
			canModify = 1;
			linespacing = 1;
    		style = 0 + 16 + 0x200;
			font = "EtelkaMonospacePro";
		};
		class DA3F_Txt_Messages: MCF_RscStructuredText
		{
			idc = 1201;
			text = "Conversations";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_Txt_NewMsg: MCF_RscStructuredText
		{
			idc = 1202;
			text = "Écrire un message";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Txt_Close: MCF_RscStructuredText
		{
			idc = 1203;
			text = "";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_btn_back: MCF_RscButtonMenu
		{
			idc = 2400;
			x = 0.319063 * safezoneW + safezoneX;
			y = 0.639296 * safezoneH + safezoneY;
			w = 0.0329687 * safezoneW;
			h = 0.055 * safezoneH;
			onbuttonclick = "[0]call DA3F_fnc_Coms_switch;";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0.8,0.6,0.1,0.35};
		};
		class DA3F_btn_Next: MCF_RscButtonMenu
		{
			idc = 2401;
			x = 0.648437 * safezoneW + safezoneX;
			y = 0.638889 * safezoneH + safezoneY;
			w = 0.0329687 * safezoneW;
			h = 0.055 * safezoneH;
			onbuttonclick = "[1]call DA3F_fnc_Coms_switch;";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0.8,0.6,0.1,0.35};
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			onbuttonclick = "closedialog 0";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};
		class DA3F_CtrlGrp: MCF_RscControlsGroup
		{
			idc = 2300;
			text = "";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.308 * safezoneH;	
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
		                w = 0.63;
		                h = 4;
        				colorBackground[] = {1,1,1,0.3};
		        };
			};
		};
		class DA3F_Valide: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "Envoi";
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_Coms_Valide_Msg";
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {-1,0.85,-1,1};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			class Attributes {align = "center";};
		};
	};
};