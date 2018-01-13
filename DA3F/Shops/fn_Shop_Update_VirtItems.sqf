/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Shop_Update_VirtItems.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
_shop = (_this select 3);
disableSerialization;
        _display        = (findDisplay 120118);
        _Arr_ItemsShop  = Shops_Items_Cfg(getArray,_shop,"items");
        lbClear 1500;
        lbClear 1501;
/*
*
*   Shop
*
*/
    {
        _item       = _x;
        _NameItem   = Items_Cfg(getText,_item,"displayname");
        _priceBuy   = Items_Cfg(getNumber,_item,"Price_Buy");
        _devise     = Items_Cfg(getText,_item,"devise");
        _icon       = Items_Cfg(getText,_item,"icon");
        _menu       = format ["%1 %2%3",_NameItem,[_priceBuy]call DA3F_fnc_numberText,_devise];
        _add        = lbAdd[1500,_menu];
        lbSetData[1500,(lbSize 1500)-1,str([_item,_shop])];
        lbSetPictureRight [1500,(lbSize 1500)-1,_icon];
    } forEach _Arr_ItemsShop;

/*
*
*   Inventaire (Joueur)
*
*/

    _inventoryUnit = player getVariable "DA3F_InvVirt";
    _Arr_ItemsUnit = _inventoryUnit select 0;
    if (_Arr_ItemsUnit isEqualTo []) then [{
            _add        = lbAdd[1501,"Inventaire Vide"];
    },{
        {
            _item       = _x select 0;
            _nrbItem    = _x select 1;
            _NameItem   = Items_Cfg(getText,_item,"displayname");
            _priceSell  = Items_Cfg(getNumber,_item,"Price_Sell");
            _devise     = Items_Cfg(getText,_item,"devise");
            _icon       = Items_Cfg(getText,_item,"icon");
            _menu       = format ["%2 X %1 %3%4",_NameItem,_nrbItem,[_priceSell]call DA3F_fnc_numberText,_devise];
            _add        = lbAdd[1501,_menu];
            lbSetData[1501,(lbSize 1501)-1,str([_item,_shop])];
            lbSetPictureRight [1501,(lbSize 1501)-1,_icon];
        } forEach _Arr_ItemsUnit;
    }];