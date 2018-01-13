/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Show_infos_VirtItems.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
//_shop = (_this select 3);
disableSerialization;
    _display = (findDisplay 120118);
    _showInfos = _display displayCtrl 2301;
        _data       = call compile format["%1",lbData [ctrlIDC (_this select 0),(_this select 1)]];
        _item       = _data select 0;
        _NameItem   = Items_Cfg(getText,_item,"displayname");
        _priceBuy   = Items_Cfg(getNumber,_item,"Price_Buy");
        _priceSell  = Items_Cfg(getNumber,_item,"Price_Sell");
        _poids      = Items_Cfg(getNumber,_item,"poids");
        _devise     = Items_Cfg(getText,_item,"devise");
        _icon       = Items_Cfg(getText,_item,"icon");
        _path_Klix  = format["<img size='0.65' image='%1' />",DA3F_Cfg(getText,"DA3F_IconCustomDevise")];
        _showDevise = switch (_devise) do {case "€": {"€"};case "K": {_path_Klix};};
        _showInfos ctrlSetStructuredText parseText format ["<t color='#059DD0' size='0.9' align='center' >%1<t/><br/><img size='0.65' image='%6'/><br/><t color='#01A6D9' size='0.9' align='left' >Prix achat :<t/><t color='#01A6D9' size='0.9' align='right' >%2%5<t/><br/><t color='#FEFEFE' size='0.9' align='left' >Prix vente :<t/><t color='#01A6D9' size='0.9' align='right' >%3%5<t/><br/><t color='#FEFEFE' size='0.9' align='left' >Poids :<t/><t color='#01A6D9' size='0.9' align='right' >%4<t/><br/>",_NameItem,[_priceBuy]call DA3F_fnc_numberText,[_priceSell]call DA3F_fnc_numberText,_poids,_showDevise,_icon];