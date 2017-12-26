/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_showInventory.sqf
*		inventaire des stockages des bases
*
*/
disableSerialization;
#include "..\..\DA3F_macros.hpp"
_idc		= ctrlIDC (_this select 0);
_index		= (_this select 1);
_Data_Exped = compile(lbData[2102,lbCurSel 2102]);
_Data_Exped = call _Data_Exped;
_arrExp 	= _Data_Exped select 0;
_PoidMaxExp	= _Data_Exped select 1;
_Data_Desti = compile(lbData[2103,lbCurSel 2103]);
_Data_Desti = call _Data_Desti;
_arrDes 	= _Data_Desti select 0;
_PoidMaxDes	= _Data_Desti select 1;

//	[0,format ["%1 - %2", _Data_Exped,_Data_Desti]]call DA3F_fnc_hint;

switch (_idc) do {
    case 2102: {
   		lbClear 1500;
    	{
			_items 	= _x select 0;
			_Nrb 	= _x select 1;
			_nameItem = Items_Cfg(getText,_items,"displayname");
			_menu 	= format ["%2 X %1",_nameItem,_Nrb];
			_add 	= lbAdd[1500,_menu];
			lbSetData[1500,(lbSize 1500)-1,str[_items,_Nrb]];
		} forEach _arrExp;
    };

    case 2103: {
   		lbClear 1501;
    	{
			_items 	= _x select 0;
			_Nrb 	= _x select 1;
			_nameItem = Items_Cfg(getText,_items,"displayname");
			_menu 	= format ["%2 X %1",_nameItem,_Nrb];
			_add 	= lbAdd[1501,_menu];
			lbSetData[1501,(lbSize 1501)-1,str[_items,_Nrb]];
		} forEach _arrDes;
    };
};