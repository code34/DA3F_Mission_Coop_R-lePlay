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
params[["_item", "", [""]]];

if (_item isEqualTo "") exitWith {};

switch (true) do {
    case (_item in ["Obj_water","Obj_Ration"]):
    {
        _value  = Items_Cfg(getNumber,_item,"Stats");
    	if (_item isEqualTo "Obj_water") then
            [{
             	[1,"Tu viens de boire"]call DA3F_fnc_hint;
			     DA3F_Soif = DA3F_Soif + _value;
			         if (DA3F_Soif > 100) then {DA3F_Soif = 100};
    	   },{
     	      [1,"Tu viens de manger"]call DA3F_fnc_hint;
    		  DA3F_Faim = DA3F_Faim + _value;
			     if (DA3F_Faim > 100) then {DA3F_Faim = 100};
    	   }];
           []spawn {
           for "_a" from 0 to 3 do {
            player setDamage ((damage player)- 0.05);
            sleep (3 + random 2);
           };
       };
        [_item,1,"del"]call DA3F_fnc_Add_Ret_Items;
    	closeDialog 0;
    };
    /*
    case (_item isEqualTo "NameItem"): {

    };
*/
    default {
     	[1,format["Tu ne peux pas utiliser cet item<br/>%1",_item]]call DA3F_fnc_hint;
    };
};
