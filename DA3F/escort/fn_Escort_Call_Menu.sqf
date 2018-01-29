/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escort_Call_Menu.sqf
*
*/

disableSerialization;

if !(createDialog "DA3F_escortMenu") exitWith {};
	_display = findDisplay 280118;
	_timeComit			 = 0.65;
	_Btn_escort			 = _display displayCtrl 2400;
	_Btn_Go_Veh			 = _display displayCtrl 2401;
	_Btn_stop_escorte	 = _display displayCtrl 2402;
	_Btn_freedom		 = _display displayCtrl 2403;

		_Btn_escort ctrlSetPosition [0.10625 * safezoneW + safezoneX,0.402 * safezoneH + safezoneY,0.223125 * safezoneW,0.07 * safezoneH];
		_Btn_Go_Veh ctrlSetPosition [0.10625 * safezoneW + safezoneX,0.486 * safezoneH + safezoneY,0.223125 * safezoneW,0.07 * safezoneH];
		_Btn_stop_escorte ctrlSetPosition [0.10625 * safezoneW + safezoneX,0.57 * safezoneH + safezoneY,0.223125 * safezoneW,0.07 * safezoneH];
		_Btn_freedom ctrlSetPosition [0.10625 * safezoneW + safezoneX,0.654 * safezoneH + safezoneY,0.223125 * safezoneW,0.07 * safezoneH];

		_Txt_Btn_escort = ctrlText _Btn_escort;
		_Txt_Btn_Go_Veh = ctrlText _Btn_Go_Veh;
		_Txt_Btn_stop_escorte = ctrlText _Btn_stop_escorte;
		_Txt_Btn_freedom = ctrlText _Btn_freedom;
		_Btn_escort ctrlSetText "*****";
		_Btn_Go_Veh ctrlSetText "*****";
		_Btn_stop_escorte ctrlSetText "*****";
		_Btn_freedom ctrlSetText "*****";
		_Btn_escort ctrlCommit _timeComit;
		_Btn_Go_Veh ctrlCommit _timeComit;
		_Btn_stop_escorte ctrlCommit _timeComit;
		_Btn_freedom ctrlCommit _timeComit;
		waitUntil {ctrlCommitted _Btn_escort};
		_Btn_escort ctrlSetText format ["%1", _Txt_Btn_escort];
		_Btn_Go_Veh ctrlSetText format ["%1", _Txt_Btn_Go_Veh];
		_Btn_stop_escorte ctrlSetText format ["%1", _Txt_Btn_stop_escorte];
		_Btn_freedom ctrlSetText format ["%1", _Txt_Btn_freedom];
