/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_UseItems.sqf
*		Utilisation des items virtuel
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
_index = lbCurSel 1501;
if (_index isEqualTo -1) exitWith {};
_item = DA3F_Items_Inv_Unit select _index;
switch (true) do {
    case (_item in ["Obj_water","Obj_burger"]): {
        Items_Cfg("DA3F_Cfg_Items_virt",_item,"Stats");
		_cnt    = MNS_Gvar_Items(_item);
    	if (_item isEqualTo "Obj_water") then [{
     	[1,"Tu viens de boire"]call DA3F_fnc_hint;
			DA3F_Soif = DA3F_Soif + _value;
			if (DA3F_Soif > 100) then {DA3F_Soif = 100};
    	},{
     	[1,"Tu viens de manger"]call DA3F_fnc_hint;
    		DA3F_Faim = DA3F_Faim + _value;
			if (DA3F_Faim > 100) then {DA3F_Faim = 100};
    	}];
    	_cnt = _cnt - 1;
        MNS_Svar_Items(_item,_cnt)
    	//missionNamespace setVariable [format ["DA3F_Item_%1",_item],_cnt];
    	closeDialog 0;
    };

    default {
     	[1,"Tu ne peux pas utiliser cet item"]call DA3F_fnc_hint;
    };
};