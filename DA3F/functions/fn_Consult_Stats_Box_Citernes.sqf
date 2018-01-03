/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_WinKeysAction.sqf
*       Attribution des actions de la touche windows
*
*/
#include "..\..\DA3F_macros.hpp"
private ["_target","_Name_Var","_display","_showInfo","_contenu","_MaxCapa"];
disableSerialization;
if (dialog) exitWith {closeDialog 0};
if !(createDialog "Gui_Coms_Consult") exitWith {};
	_target		= (_this select 0);
	_Name_Var	= (_this select 1);
	_display 	= (findDisplay 121217);
	_showInfo 	= ((_display)displayCtrl 2010);
	_contenu 	= (_target getVariable "DA3F_StockItems")select 0;
	_MaxCapa 	= (_target getVariable "DA3F_MaxStock");
	_Side 		= (_target getVariable "DA3F_Side");
	_Btn_GoInv 	= ((_display)displayCtrl 2400);
	_Btn_GoStok = ((_display)displayCtrl 2401);
	_Btn_GoInv 	ctrladdEventHandler ["buttonclick",{[1] call DA3F_fnc_Transfert_Target_1}];
	_Btn_GoStok ctrladdEventHandler ["buttonclick",{[0] call DA3F_fnc_Transfert_Target_1}];
		    _arr = call DA3F_fnc_Cnt_Items_Spe;
            _Arr_items = (_arr select 1)select 0;

	{
		_item 	= _x select 0;
		_nrb 	= _x select 1;
		_menu 	= format ["%2 X %1", Items_Cfg(getText,_item,"displayname"),_nrb];
		_add 	= lbAdd[1500,_menu];
		lbSetData[1500,(lbSize 1500)-1,str[_item,_nrb]]
	} forEach _Arr_items;

	{
		_item 	= _x select 0;
		_nrb 	= _x select 1;
		_menu 	= format ["%2 X %1", Items_Cfg(getText,_item,"displayname"),_nrb];
		_add 	= lbAdd[1501,_menu];
		lbSetData[1501,(lbSize 1501)-1,str[_item,_nrb]]
	} forEach _contenu;