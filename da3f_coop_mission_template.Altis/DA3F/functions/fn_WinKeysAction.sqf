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
#include "..\..\DA3F_macros.hpp"
DA3F_TarObj = cursorTarget;
_className 	= typeOf DA3F_TarObj;
_class		= (ClassVeh(_className));
if !(isNil {DA3F_TarObj getVariable "DA3F_StockItems"}) exitWith {
		[DA3F_TarObj,"DA3F_CoffreBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
		true;
	};
if (_class in ["Car","Air","Tank","Ship"] && ((DA3F_TarObj distance player )< 5)) exitWith {
		call DA3F_fnc_ActionVeh;
	};
/*
if !(isNil {DA3F_TarObj getVariable "DA3F_CiterneBase"}) then {
	if ((typeOf DA3F_TarObj) in DA3F_Arr_Citerne) exitWith {
		[DA3F_TarObj,"DA3F_CiterneBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
		true;
	};
};

if !(isNil {DA3F_TarObj getVariable "DA3F_SiloBase"}) then {
	if ((typeOf DA3F_TarObj) in DA3F_Arr_Silo) exitWith {
		[DA3F_TarObj,"DA3F_SiloBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
		true;
	};
};*/