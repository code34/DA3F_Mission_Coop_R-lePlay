/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Shop_New_VirtItems.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
private _shop = (_this select 3);
disableSerialization;
    if !(createDialog "Gui_ShopNew") exitWith {};
    if (!isClass(missionConfigFile >> "DA3F_Cfg_Shop_virt" >> _shop)) exitWith {closeDialog 0; hint "Config shop inexistant";};
        _display        = (findDisplay 120118);
        _Arr_ItemsShop  = Shops_Items_Cfg(getArray,_shop,"items");
        _Arr_Side       = Shops_Items_Cfg(getArray,_shop,"side");
private _conditions     = Shops_Items_Cfg(getText,_shop,"conditions");
        if !(_conditions isEqualTo "") then {
            _conditions     = call compile format ["%1",Shops_Items_Cfg(getText,_shop,"conditions")];
            if !(_conditions) exitWith {[1,"Vous n'êtes pas autorisé à utiliser ce shop<br/>(Conditions restriction)"]call DA3F_fnc_hint;closeDialog 0};
        };
        if (!(str(playerSide) in _Arr_Side) && !(_Arr_Side isEqualTo [])) exitWith {[1,"Vous n'êtes pas autorisé à utiliser ce shop<br/>(Side restriction)"]call DA3F_fnc_hint;closeDialog 0};
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
        if (_devise isEqualTo "K") then {_devise = "Klix"};
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
            if (_devise isEqualTo "K") then {_devise = "Klix"};
            _menu       = format ["%2 X %1 %3%4",_NameItem,_nrbItem,[_priceSell]call DA3F_fnc_numberText,_devise];
            _add        = lbAdd[1501,_menu];
            lbSetData[1501,(lbSize 1501)-1,str([_item,_shop])];
            lbSetPictureRight [1501,(lbSize 1501)-1,_icon];
        } forEach _Arr_ItemsUnit;
    }];