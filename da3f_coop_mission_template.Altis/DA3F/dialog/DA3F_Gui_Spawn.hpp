	class DA3F_SpawnMenu {
	 idd = 181117;
	 name= "DA3F_SpawnMenu";
	 movingEnable = true;
	 enableSimulation = true;

	 class controlsBackground {
		class DA3F_Pix: MCF_RscPicture
		{
			idc = 1200;
			text = "satellite.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.627 * safezoneH;
		};
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.2};
		};

		class DA3F_MapView: MCF_RscMapControl
		 {
		 idc = 31400;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.275 * safezoneH;
		 maxSatelliteAlpha = 0.75;
		 alphaFadeStartScale = 1.15;
		 alphaFadeEndScale = 1.29;
		 };
	 };

	 class controls {
		class DA3F_ListSp: MCF_RscListbox
		{
			idc = 1500;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.121 * safezoneH;
			sizeEx = 0.04;
			colorText[]={0.3,0.7,0.1,0.9};
			colorBackground[] = {-1,-1,-1,0.3};
			onlbselchanged="[_this,0] call DA3F_fnc_SelectSpawnMap";
		};
		class DA3F_btn_Valid: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Valide"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			onbuttonclick="_this call DA3F_fnc_SpawnValide";
			colorBackground[] = {0,0.8,0.1,0.9};
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
		};
		class DA3F_btn_Close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			onbuttonclick="closedialog 0";
			colorBackground[] = {0.9,-1,0.1,0.9};
			class Attributes 
				{
					align = "center";
					valign = "top";
					sizeEx= 0.04;
					font="EtelkaMonospacePro";
				};
		};
		/*
		class DA3F_Box_1: MCF_RscCheckbox
		{
			idc = 2800;
            type = 7; // CT_CHECKBOXES
            style = 2; // ST_CENTER
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH; 
        
            colorText = {0, 1, 0, 1}; // checkbox unchecked color
            colorTextSelect = {1, 0, 0, 1}; // checkbox checked color
        
            colorBackground = {-1,-1,0.2,0.8};		};
		class DA3F_Box_2: MCF_RscCheckbox
		{
			idc = 2801;
            type = 7; // CT_CHECKBOXES
            style = 2; // ST_CENTER
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
        
            colorText = {0, 1, 0, 1}; // checkbox unchecked color
            colorTextSelect = {1, 0, 0, 1}; // checkbox checked color
        
            colorBackground = {-1,-1,0.2,0.8};
        
		};
		class DA3F_txt_Box_1: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Spawn aérien"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DA3F_txt_Box_2: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Spawn sans armes"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DA3F_Txt_box_3: MCF_RscStructuredText
		{
			idc = 1102;
			text = "..."; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DA3F_box_3: MCF_RscCheckbox
		{
			idc = 2802;
            type = 7; // CT_CHECKBOXES
            style = 2; // ST_CENTER
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
            colorText = {0, 1, 0, 1}; // checkbox unchecked color
            colorTextSelect = {1, 0, 0, 1}; // checkbox checked color
        
            colorBackground = {-1,-1,0.2,0.8};
        
		};
		class DA3F_Txt_box_4: MCF_RscStructuredText
		{
			idc = 1103;
			text = "..."; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DA3F_box_4: MCF_RscCheckbox
		{
			idc = 2803; 
            type = 7; // CT_CHECKBOXES
            style = 2; // ST_CENTER
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;       
        
            colorText = {0, 1, 0, 1}; // checkbox unchecked color
            colorTextSelect = {1, 0, 0, 1}; // checkbox checked color
        
            colorBackground = {-1,-1,0.2,0.8};
        
            columns = 1;
            rows = 1;
		};
		*/
	};
};