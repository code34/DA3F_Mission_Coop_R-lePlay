/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Inv_UpDown_Items.sqf
*		Ajout / retrait d'item
*
*		Arguments :
*			0 : boolean  	: true = add / false = del
*			1 : string  	: name item
*			0 : scalar  	: value
*
*		Exemple :
*           DA3F_TarObj = global var cursorObject
*       	[true,cursorObject,_item,_value]call DA3F_fnc_Stock_UpDown_Items; // add
*       	[true,DA3F_TarObj,"Carbu_brute",2]call DA3F_fnc_Inv_UpDown_Items; // add
*
*       	[false,cursorObject,_item,_value]call DA3F_fnc_Inv_UpDown_Items; // del
*       	[false,DA3F_TarObj,"Carbu_brute",2]call DA3F_fnc_Inv_UpDown_Items; // del
*
*/

#include "..\..\DA3F_macros.hpp"
    disableSerialization;
private _idc        = ctrlIDC (_this select 0);
private _quantit    = call compile format["%1",ctrlText 1400];
private _exit       = false;
//private _Target     = [_this, 1, objNull, [objNull]] call bis_fnc_param;

    if (_quantit isEqualTo 0 || _quantit isEqualTo "") exitWith {[1,"Tu ne peux pas avoir une valeur null ou à 0"]call DA3F_fnc_hint};
    if (isNull _Target) exitWith {[1,"Tu n'as pas de stockage face à toi"]call DA3F_fnc_hint};
//        DA3F_TarObj = _Target;

    switch (_idc) do {
        // Prendre
        case 2404:
        {
            private _index_Stock    = lbCurSel 1502;
                if (_index_Stock isEqualTo - 1) exitWith {
                    [1,"sélectionne un item dans la bonne liste<br/>stockage liste du haut<br/>ton inventaire liste du bas"]call DA3F_fnc_hint
                };
            private _data_stock     = call compile format ["%1",lbData [1502,_index_Stock]];
            private _itemStock      = _data_stock select 0;

                if !([true,_itemStock,_quantit]call DA3F_fnc_Inv_UpDown_Items)exitWith {
                 //   systemChat format ["DA3F info : Vous ne disposez pas de la place nécessaire",nil];
                [1,format ["DA3F info : Vous ne disposez pas de la place nécessaire",nil]]call DA3F_fnc_hint;
                    _exit = true;
                };

            if !(_exit)then {
                if ([false,DA3F_TarObj,_itemStock,_quantit]call DA3F_fnc_stock_UpDown_Items)exitWith {
                        systemChat format["DA3F info : #1 retrait : [x%2] %1",Items_Cfg(getText,_itemStock,"displayname"),_quantit];
                    };
            };
        };

        // Déposer
        case 2405:
        {
        private _index_unit     = lbCurSel 1500;
            if (_index_unit isEqualTo - 1) exitWith {
                [1,"sélectionne un item dans la bonne liste<br/>stockage liste du haut<br/>ton inventaire liste du bas"]call DA3F_fnc_hint;
            };

        private _data_unit      = call compile format ["%1",lbData [1500,_index_unit]];
        private _item_Unit      = _data_unit select 0;
/*
_verif_box = [true,cursorObject,_item_Unit,_quantit]call DA3F_fnc_stock_UpDown_Items;
_verif_inv = [false,_item_Unit,_quantit]call DA3F_fnc_Inv_UpDown_Items;
*/
systemChat format ["box : %1 |-| inv : %2",str _verif_box,str _verif_inv];

            if ([true,DA3F_TarObj,_item_Unit,_quantit]call DA3F_fnc_stock_UpDown_Items)exitWith {
                [1,format ["DA3F info : Le stockage ne dispose pas de la place nécessaire",nil]]call DA3F_fnc_hint;
                        _exit = true;
                    };

            if !(_exit)then {
                        if  ([false,_item_Unit,_quantit]call DA3F_fnc_Inv_UpDown_Items) exitWith {
                            systemChat format ["DA3F info : SUCCÈS items retrait: [x%2] %1", Items_Cfg(getText,_item_Unit,"displayname"),_quantit];
                        };
                    };

        };
    };
    if (_exit) exitWith {systemChat "DA3F info : Transaction annulé !";};
        lbClear 1500;
        lbClear 1502;
_ListeItem      = ((findDisplay 602) displayCtrl 1500);
_list_Coffre    = ((findDisplay 602) displayCtrl 1502);

{
    if (MNS_Gvar_Items(configName _x) > 0) then {
        _ListeItem lbAdd format ["[x%1] %2",MNS_Gvar_Items(configName _x),(getText(_x >> "displayName"))];
        _ListeItem lbSetData [(lbSize _ListeItem)-1,str([(configName _x),MNS_Gvar_Items(configName _x)])];
        _icon = Items_Cfg(getText,configName _x,"icon");
        if (!(_icon isEqualTo "")) then {
            _ListeItem lbSetPicture [(lbSize _ListeItem)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));

    _obj = nearestObjects [player,["B_Slingload_01_Cargo_F","Land_cmp_Tower_F","Land_Tank_rust_F","Land_dp_bigTank_F","Land_LuggageHeap_02_F","Land_cmp_Tower_F"],6]select 0;
    if (isNil "_obj") exitWith {};
    if (isNull _obj) exitWith {};
    if (isNull cursorObject) exitWith {};
        DA3F_TarObj = cursorObject;
    private _invVirtObj = _obj getVariable "DA3F_StockItems";
//    DA3F_TarObj = _obj;
    if (isnil "_invVirtObj") then [{
        _add        = _list_Coffre lbAdd format ["Aucun inventaire",nil];
    },{
    _arrItems       = _invVirtObj select 0;
    {
        _item       = _x select 0;
        _Nrbitem    = _x select 1;
        _nameItem   = Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
        _add        = _list_Coffre lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _list_Coffre    lbSetPictureRight [(lbSize _list_Coffre)-1,_icon];
        lbSetData [1502,(lbSize 1502)-1,str(_x)];
    } forEach _arrItems;
}];