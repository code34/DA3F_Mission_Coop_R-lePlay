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
DA3F_TarObj = cursorObject;
_className 	= typeOf DA3F_TarObj;
_class		= (ClassVeh(_className));
if !(isNil {DA3F_TarObj getVariable "DA3F_StockItems"}) exitWith {
		[DA3F_TarObj,"DA3F_CoffreBase"]call DA3F_fnc_Consult_Stats_Box_Citernes;
		true;
	};
if ((_class in ["Car","Air","Tank","Ship"] && ((DA3F_TarObj distance player )< 8)) OR !(isNil {DA3F_TarObj getVariable "DA3F_InvVirtVeh"})) exitWith {
		call DA3F_fnc_ActionVeh;
	};

/*
if !(isNil{DA3F_TarObj getVariable "DA3F_isRestain"}) exitWith {
		if (DA3F_TarObj getVariable "DA3F_isRestain" && ((DA3F_TarObj distance player )< 8)) then {
			[]call DA3F_fnc_Escort_Call_Menu;
		};
	};
*/

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