class Gui_Shop_Items_Virt{
	idd = 1081217;
	name= "Gui_Shop_Items_Virt";
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
			h = 0.462 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class pix_backG: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.396 * safezoneH;
		};
	};

class controls {
		class DA3F_list_Items: MCF_RscListbox
		{
			idc = 1500;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.154 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
		};
		class DA3F_list_Items_Inv: MCF_RscListbox
		{
			idc = 1501;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.154 * safezoneH;
			colorText[] = {0.8,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0.4};
			sizeEx = 0.04;
		};
		class DA3F_txt_head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "DA3F Shop"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class txt_listitems: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Liste des items à vendre"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.142708 * safezoneW;
			h = 0.0283703 * safezoneH;
		};
		class txt_listitems_inv: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Votre inventaire"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.142708 * safezoneW;
			h = 0.0283703 * safezoneH;
		};
		class DA3F_btn_sell: MCF_RscButtonMenu
		{
			idc = 2400;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.5,-1,1};
			onbuttonclick = "[_this,1] call DA3F_fnc_ShopItems_BuySell";
		};
		class DA3F_btn_buy: MCF_RscButtonMenu
		{
			idc = 2401;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.5,-1,1};
			onbuttonclick = "[_this,0] call DA3F_fnc_ShopItems_BuySell";
		};
		class DA3F_edit_sell: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
		};
		class DA3F_edit_buy: MCF_RscEdit
		{
			idc = 1401;
			text = "1"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.011823 * safezoneW;
			h = 0.020037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0,-1,1};
			onbuttonclick = "closedialog 0";
		};
	};
};



