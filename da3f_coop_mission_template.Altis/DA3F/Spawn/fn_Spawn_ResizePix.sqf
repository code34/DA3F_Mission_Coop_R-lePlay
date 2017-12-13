/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SelectSpawnMap.sqf
*       Sélection du spawn
*		_this call DA3F_fnc_Spawn_ResizePix;
*
*/

_this spawn {
disableSerialization;
//_type = _this select 1;
_display 	= (findDisplay 1091217);
if (DA3F_Cam_IsActive) exitWith {};
DA3F_Cam_IsActive = true;
//_info_IDC = (_this select 0);
_info_IDC = _this;
_select_IDC = _info_IDC select 1;
_IDC = ctrlIDC (_info_IDC select 0); // 2402 Map | 2403 Cam
_img = switch (_IDC) do {
    case 2402: {31400};
    case 2403: {1201};
};
_Pix = ((_display)displayCtrl _img);

switch (_img) do {
    case 31400: {
    	((_display)displayCtrl 1201) ctrlShow false;
    };

    case 1201: {
    	((_display)displayCtrl 31400) ctrlShow false;
    };
};
_Pos_FullScreen = [0.242188 * safezoneW + safezoneX,0.00499995 * safezoneH + safezoneY,0.752813 * safezoneW,0.99 * safezoneH];
_Initial_pos = ctrlPosition _Pix;
_Pix ctrlSetPosition _Pos_FullScreen;
sleep 1;
_Pix ctrlCommit 1;
sleep 4;
_Pix ctrlSetPosition _Initial_pos;
sleep 1;
_Pix ctrlCommit 1;
sleep 1;
	switch (_img) do {
	    case 31400: {
	    	((_display)displayCtrl 1201) ctrlShow true;
	    };

	    case 1201: {
	    	((_display)displayCtrl 31400) ctrlShow true;
	    };
	};
	DA3F_Cam_IsActive = false;
};