/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Buy_selectionStockage.sqf
*		...
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
lbClear 2101;

_PC		= nearestObjects [player,["Land_Laptop_device_F"],5]select 0; // no nearestObject (50m radius... pas besoin)
_class	= (_PC getVariable "DA3F_ClassParent");
_idc 	= ctrlIDC(_this select 0);
_index 	= _this select 1;
_type 	= lbText [_idc,_index];
_arr = switch (_type) do {
    case "Coffre": {
    	Bases_Cfg(getArray,_class,"Obj_Stock_Items")
    };
    case "Citerne": {
    	Bases_Cfg(getArray,_class,"Obj_Stock_Carbu")
    };
    case "Silo": {
    	Bases_Cfg(getArray,_class,"Obj_Stock_Silos")
    };
};

{
	_Realname = Real_NameVeh(_x select 0);
	_info = format ["%1 - %2", _Realname, _x select 1];
	_add=lbAdd[2101,_info]
} forEach _arr;