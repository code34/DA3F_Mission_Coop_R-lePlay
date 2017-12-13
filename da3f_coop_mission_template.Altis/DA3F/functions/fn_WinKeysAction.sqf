/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_WinKeysAction.sqf
*       Attribution des actions de la touche windows
*
*/
//private [""];
DA3F_TarObj = cursorTarget;
if ((typeOf DA3F_TarObj) in DA3F_Arr_Coffre) exitWith {
	[DA3F_TarObj,"DA3F_CoffreBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
	true;
};

if ((typeOf DA3F_TarObj) in DA3F_Arr_Citerne) exitWith {
	[DA3F_TarObj,"DA3F_CiterneBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
	true;
};