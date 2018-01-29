/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_All_titles.hpp
*       Initialisation des variables des joueurs
*
*/
#define ST_LEFT 0x01
    class Default
       {
	       idd = -1;
	       fadein = 0;
	       fadeout = 2;
	       duration = 0;
       };

class MCFStatusBar {
	idd = 50584;
	onLoad = "uiNamespace setVariable ['MCFStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['MCFStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['MCFStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 1.9;
			y = safezoneY + safezoneH - 0.06;
			w = 1.3;
			h = 1.3;
			shadow = 1;
			colorBackground[] = { 1, 0.3, 0, 0 };
			font = "EtelkaMonospacePro";
			size = 0.033;
			type = 13;
			style = 1;
			text="DA3F Barre d'info. Merci de patientez...";
			class Attributes {
				align="left";
				color = "#03EE00";
			};
		};
	};
};

class DA3F_progress_Target
{
    name = "DA3F_progress_Target";
    idd = 3138202;
    fadein=0;
    duration = 99999999999;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['DA3F_progress',_this select 0]";
    objects[]={};

    class controlsBackground
    {
        class background : MCF_RscText
        {
            idc = 545465;
            colorBackground[] = {0,0,0.3,0.4};
            x = 0.48140 * safezoneW + safezoneX;
            y = 0.79 * safezoneH + safezoneY;
            w = 0.35; h = 0.039;
        };
        class ProgressBar : MCF_RscProgress
        {
            idc = 3138201;
            colorBackground[] = {0,0,0.5,0.3};
            colorBar[] = {0,0.6,0.9,0.85};
            x = 0.48140 * safezoneW + safezoneX;
            y = 0.79 * safezoneH + safezoneY;
            w = 0.35; 
            h = 0.039;
        };

        class ProgressText : MCF_RscStructuredText
        {
            idc = 3138202;
            text = "DA3F Erreur de chargement...";
            x = 0.53 * safezoneW + safezoneX;
            y = 0.7882 * safezoneH + safezoneY;
            w = 0.35; h = (1 / 25);
        };
    };
};


class DA3F_progress
{
    name = "DA3F_progress";
    idd = 3138200;
    fadein=0;
    duration = 99999999999;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['DA3F_progress',_this select 0]";
    objects[]={};

    class controlsBackground
    {
        class background : MCF_RscText
        {
            idc = -1;
            colorBackground[] = {0,0,0.3,0.4};
            x = 0.48140 * safezoneW + safezoneX;
            y = 0.79 * safezoneH + safezoneY;
            w = 0.48; h = 0.039;
        };
        class ProgressBar : MCF_RscProgress
        {
            idc = 3138201;
            colorBackground[] = {0,0,0.5,0.3};
            x = 0.48140 * safezoneW + safezoneX;
            y = 0.79 * safezoneH + safezoneY;
            w = 0.48; h = 0.039;
        };

        class ProgressText : MCF_RscStructuredText
        {
            idc = 3138202;
            text = "DA3F Erreur de chargement...";
            x = 0.53 * safezoneW + safezoneX;
            y = 0.7882 * safezoneH + safezoneY;
            w = 0.48; h = (1 / 25);
        };
    };
};


class MCF_HUD_Kill
    {
        idd = 1000000;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  5;
        fadein       =  0;
        fadeout      =  3;
        name = "MCF_HUD_Kill";
        onLoad = "with uiNameSpace do { MCF_HUD_Kill = _this select 0 }";
    class controls
        {
            class structuredText
            {
                access = 0;
                type = 13;
                idc = 3123500;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX+safeZoneW-0.65;
                y = safeZoneY+safeZoneH-1.358;
                w = 0.555 * safezoneW;
                h = 0.1880106 * safezoneH;
                size = 0.040;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,0,0,1};
                text = "";
                font = "PuristaSemiBold";
                    class Attributes
                {
                        font = "PuristaSemiBold";
                        color = "#DE0101";
                        align = "Left";
                        valign = "top";
                        shadow = 5;
                        shadowColor = "#FEF600";
                        underline = false;
                        size = "3";
                };
            };
        };
    };