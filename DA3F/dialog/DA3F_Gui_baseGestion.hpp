/*
	class DA3F_MenuBaseGestion {
	 idd = 131217;
	 name= "DA3F_MenuBaseGestion";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class RscPicture_1200: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
	 };

class controls {
		class DA3F_txt_head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Gestion de la base"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
			class Attributes {align = "center";};			
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};
		class DA3F_txt_cmd_box: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Commander"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscCombo_2100: MCF_RscCombo
		{
			idc = 2100;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[]={-1,-1,-1,0.4};
			onlbselchanged = "_this call DA3F_fnc_Buy_selectionStockage";
		};
		class DA3F_txt_cmd_model: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Type de materiel :"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscCombo_2101: MCF_RscCombo
		{
			idc = 2101;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[]={-1,-1,-1,0.4};
		};
		class DA3F_Btn_cmd: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "commander"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.4,0.1,-1,1};
			onbuttonclick = "hint 'à venir...' ";
		};
		class DA3F_txt_Transfert: MCF_RscStructuredText
		{
			idc = 1103;
			text = "Transfert"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_txt_DE: MCF_RscStructuredText
		{
			idc = 1104;
			text = "DE :"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_txt_Inbox: MCF_RscStructuredText
		{
			idc = 1105;
			text = "A :"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_liste_Box_1: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.143 * safezoneH;
			sizeEx = 0.04;
			colorBackground[]={-1,-1,-1,0.4};
		};
		class DA3F_liste_Box_2: MCF_RscListbox
		{
			idc = 1501;
			text = ".."; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.143 * safezoneH;
			sizeEx = 0.04;
			colorBackground[]={-1,-1,-1,0.4};
		};
		class Edit_Transfert: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.526 * safezoneH + safezoneY;
			w = 0.104062 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.04;
			colorBackground[]={-1,-1,-1,0.4};
			onbuttonclick = "hint 'Edit...' ";
		};
		class btn_transfert: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Transfert"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.3,-1,1};
			onbuttonclick = "_this call DA3F_fnc_TransfertValide";
		};
		class DA3F_ctrlGrpStates: MCF_RscControlsGroup
		{
			idc = 2300;
			x = 0.304063 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
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
						w = 0.175625 * safezoneW;
		                h = 2;
        				colorBackground[] = {0,0,0,0};
		        };
			};
		};
		class DA3F_txt_state: MCF_RscStructuredText
		{
			idc = 1106;
			text = "States de la base"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.011823 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.15,-1,1};
			onbuttonclick = "closedialog 0";
		};
	};
};


*/



/*
*
*
*			NEW
*
*
*/






	class DA3F_MenuBaseGestion {
	 idd = 131217;
	 name= "DA3F_MenuBaseGestion";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class backG: MCF_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Pix_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
	 };

class controls {

		class DA3F_txt_Head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Gestion de la base"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes {align = "center";};	
		};

		class CtrlGrp_InfoGen: MCF_RscControlsGroup
		{
			idc = 2300;
			text = ".."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
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
						w = 0.155 * safezoneW;
		                h = 2;
        				colorBackground[] = {0,0,0,0};
		        };
			};
		};

		class txt_statesBaseGen: MCF_RscStructuredText
		{
			idc = 1101;
			text = "States de la base"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class txt_cmd: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Passer commande"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class listTypeCmd: MCF_RscCombo
		{
			idc = 2100;
			text = ".."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			onlbselchanged = "_this call DA3F_fnc_Buy_selectionStockage";
		};
		class txt_typecmd: MCF_RscStructuredText
		{
			idc = 1103;
			text = "Type de materiel :"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class txt_model: MCF_RscStructuredText
		{
			idc = 1104;
			text = "Modeles :"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class list_model: MCF_RscCombo
		{
			idc = 2101;
			text = ".."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class btn_cmd: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Commander"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,0.3,0.1,1};
			onbuttonclick = "[1,""Fonctionnalité en cours de MAJ... Bientôt disponible""]call DA3F_fnc_hint";
		};
		class listeBox_1: MCF_RscCombo
		{
			idc = 2102;
			text = ".."; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			onlbselchanged = "_this call DA3F_fnc_showInventory";
		};
		class txt_select_box_1: MCF_RscStructuredText
		{
			idc = 1105;
			text = "Choisissez un stockage"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class txt_transfert: MCF_RscStructuredText
		{
			idc = 1106;
			text = "Transferts"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscListbox_1500: MCF_RscListbox
		{
			idc = 1500;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = 0.04;
		};
		class txt_box_2: MCF_RscStructuredText
		{
			idc = 1107;
			text = "Choisissez un stockage"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class combo_box_2: MCF_RscCombo
		{
			idc = 2103;
			text = ".."; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			onlbselchanged = "_this call DA3F_fnc_showInventory";
		};
		class list_Box_2: MCF_RscListbox
		{
			idc = 1501;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = 0.04;
		};
		class btn_transfert: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Transferer"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.3,0.1,1};
		//	onbuttonclick = "_this call DA3F_fnc_TransfertValide";
			onbuttonclick = "[1,""Fonctionnalité en cours de MAJ... Bientôt disponible""]call DA3F_fnc_hint";
		};
		class edit_valTransfert: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,0.75};
		};
		class close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.9,0.1,0.1,1};
			onbuttonclick = "closedialog 0";
		};
	};
};