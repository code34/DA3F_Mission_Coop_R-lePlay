/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Stock_Open_Inv.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
    createDialog "Gui_ShopNew";
    _display = (findDisplay 120118);
    _stock = _display displayCtrl 1500;
    _inv = _display displayCtrl 1501;
    _all_Items = [];


    private _Inventory  = (DA3F_TarObj getVariable "DA3F_StockItems");
    private _contenu    = _Inventory select 0;
    private _Poidstockage   = _Inventory select 1;

    {_all_Items pushBack (_x select 0)} forEach _contenu;

{
    if (MNS_Gvar_Items(configName _x) > 0) then {
        _inv lbAdd format ["[x%1] %2",MNS_Gvar_Items(configName _x),(getText(_x >> "displayName"))];
        _inv lbSetData [(lbSize _inv)-1,str([(configName _x),MNS_Gvar_Items(configName _x)])];
        _icon = Items_Cfg(getText,(configName _x),"icon");
        if (!(_icon isEqualTo "")) then {
            _inv lbSetPicture [(lbSize _inv)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));


{
    _item = _x select 0;
    _Nrbitem = _x select 1;
    _NameItem = Items_Cfg(getText,_item,"displayName");
    _icon = Items_Cfg(getText,_item,"icon");
    _stock lbAdd format ["[x%1] %2",_Nrbitem,_NameItem];
    _stock lbSetData [(lbSize _stock)-1,str([_item,_Nrbitem])];
        if (!(_icon isEqualTo "")) then {
            _stock lbSetPicture [(lbSize _stock)-1,_icon];
        };
} forEach _contenu;
