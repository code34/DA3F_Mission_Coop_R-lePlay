/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Transfert_Target.sqf
*		Utilisation des items virtuel
*
*/
/*
[[["Carbu_Brute",1],["Obj_water",2]],4] // model bdd
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
_display        = (findDisplay 121217);
_datalist1      = ((_display)displayCtrl 1500);
_datalist1      = ((_display)displayCtrl 1501);
_switch         = _this select 0;
_index_inv      = lbCurSel 1500;
_data_inv       = compile (lbData[1500,lbCurSel 1500]);
_index_stock    = lbCurSel 1501;
_data_stock     = compile (lbData[1501,lbCurSel 1501]);
_val            = compile (ctrlText 1400);
_val            = call _val;
_data_inv       = call _data_inv;
_data_stock     = call _data_stock;
_exit           = false;
//[0,format ["%1 - %2", _data_inv, _data_stock]]call DA3F_fnc_hint;
switch (_switch) do {
    case 0: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_StockItems"}) then {
            _contenu    = (DA3F_TarObj getVariable "DA3F_StockItems")select 0;
            _PoidsMax   = (DA3F_TarObj getVariable "DA3F_StockItems")select 1;
            _max        = (DA3F_TarObj getVariable "DA3F_MaxStock");
            _side       = (DA3F_TarObj getVariable "DA3F_Side");
            _NameClass  = (DA3F_TarObj getVariable "DA3F_ClassParent");
            _item       = _data_inv select 0;
            _itemNrb    = _data_inv select 1;
            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
            _arr        = call DA3F_fnc_Cnt_Items_Spe;
            _Arr_items  = _arr select 1;
            _cnt        = MNS_Gvar_Items(_item);
            _carbuStock=[];
            {_carbuStock pushBack (_x select 0)}foreach (Bases_Cfg(getArray,_NameClass,"Obj_Stock_Carbu"));
            if ((typeOf DA3F_TarObj) in _carbuStock) then
                [{
                    if !(_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                },{
                    if (_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                }];
                if (_exit) exitWith
                    {
                        [1,"Tu ne pas mettre cet item dans ce stockage"]call DA3F_fnc_hint;
                        _exit = false;
                    };
            if (_cnt < _val) exitWith {[1,"Tu ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                if ((_PoidsMax + (_itemPoids * _val)) > _max) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
        _all = [];
        {_itemInStock = _x select 0;_nrbItemsInStock = _x select 1;_all pushBack _itemInStock;} forEach _contenu;
                if (_item in _all) then [{
                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do {
                        _itemInStock        = _contenu select _a select 0;
                        _nrbItemsInStock    = _contenu select _a select 1;
                        if (_item isEqualTo _itemInStock) then
                        [{
                            _nrbItemsInStock = _nrbItemsInStock + _val;
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _val);
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                        },{
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _nrbItemsInStock);
                        }];
                    };

                    DA3F_TarObj setVariable ["DA3F_StockItems",[_newContenu,_newPoids],true];
                },{

                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do {
                        _itemInStock        = _contenu select _a select 0;
                        _nrbItemsInStock    = _contenu select _a select 1;
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _nrbItemsInStock);
                    };
                            _newContenu pushBack [_item,_val];
                            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _val);
                    DA3F_TarObj setVariable ["DA3F_StockItems",[_newContenu,_newPoids],true];
            }];
                //    DA3F_TarObj setVariable ["DA3F_StockItems",[(_contenu + _val),_max,_type],true];
            [_item,_val,"del"]call DA3F_fnc_Add_Ret_Items;
            /*
            MNS_Svar_Items(_item,(_cnt-_val));
            DA3F_Items_Inv = DA3F_Items_Inv - (_itemPoids * _val);
                if (DA3F_Items_Inv < 0) then
                    {
                        DA3F_Items_Inv = 0;
                    };*/
        };
        closeDialog 0;
    };

    case 1: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_StockItems"}) then {
            _contenu    = (DA3F_TarObj getVariable "DA3F_StockItems")select 0;
            _PoidsMax   = (DA3F_TarObj getVariable "DA3F_StockItems")select 1;
            _max        = (DA3F_TarObj getVariable "DA3F_MaxStock");
            _side       = (DA3F_TarObj getVariable "DA3F_Side");
            _NameClass  = (DA3F_TarObj getVariable "DA3F_ClassParent");
            _item       = _data_stock select 0;
            _itemNrb    = _data_stock select 1;
            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
            _arr        = call DA3F_fnc_Cnt_Items_Spe;
            _Arr_items  = _arr select 1;
            _cnt        = MNS_Gvar_Items(_item);
            _inv        = DA3F_Items_Inv;
            _inv = _inv + (_itemPoids * _val);
            /*
            if ((typeOf DA3F_TarObj) in (Bases_Cfg(getArray,_NameClass,"Obj_Stock_Carbu"))) then
                [{
                    if !(_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                },{
                    if (_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                }];
                if (_exit) exitWith {[1,"Tu ne pas mettre cette item dans ce stockage"]call DA3F_fnc_hint};
            */
            if (_itemNrb < _val) exitWith {[1,"quantité indisponible"]call DA3F_fnc_hint};
                if (_inv >= DA3F_Max_Items_Inv) exitWith {[1,"Tu n'as pas assez de place"]call DA3F_fnc_hint};

                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do
                    {
                    _itemInStock        = _contenu select _a select 0;
                    _nrbItemsInStock    = _contenu select _a select 1;
                        if (_item isEqualTo _itemInStock) then
                        [{
                            _nrbItemsInStock    = _nrbItemsInStock - _val;
                            _itemPoids          = Items_Cfg(getNumber,_item,"poids");
                            _newPoids           = _newPoids - (_itemPoids * _val);
                            if (_nrbItemsInStock > 0) then {
                                _newContenu pushBack [_item,_nrbItemsInStock];
                            };
                        },{
                                _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                                _itemPoids          = Items_Cfg(getNumber,_itemInStock,"poids");
                                _newPoids           = _newPoids + (_itemPoids * _nrbItemsInStock);
                        }];
                    };

                    DA3F_TarObj setVariable ["DA3F_StockItems",[_newContenu,_newPoids],true];
                //    DA3F_TarObj setVariable ["DA3F_StockItems",[(_contenu + _val),_max,_type],true];

            [_item,_val,"add"]call DA3F_fnc_Add_Ret_Items;
            /*
            MNS_Svar_Items(_item,(_cnt+_val));
            DA3F_Items_Inv = DA3F_Items_Inv + (_itemPoids * _val);
                if (DA3F_Items_Inv < 0) then
                    {
                        DA3F_Items_Inv = 0;
                    };*/
        };
        closeDialog 0;
    };

/*
*
*   Vehicule stockage
*
*/

    case 2: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_InvVirtVeh"}) then {
            _contenu    = (DA3F_TarObj getVariable "DA3F_InvVirtVeh")select 0;
            _PoidsMax   = (DA3F_TarObj getVariable "DA3F_InvVirtVeh")select 1;
            _max        = (DA3F_TarObj getVariable "DA3F_ID_Veh")select 0;
            _item       = _data_inv select 0;
            _itemNrb    = _data_inv select 1;
            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
            _arr        = call DA3F_fnc_Cnt_Items_Spe;
            _Arr_items  = _arr select 1;
            _cnt        = MNS_Gvar_Items(_item);
            _carbuStock=["B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_T_Truck_03_fuel_ghex_F","O_G_Van_01_fuel_F","B_G_Van_01_fuel_F","I_Truck_02_fuel_F","I_G_Van_01_fuel_F","C_Van_01_fuel_F","C_IDAP_Truck_02_water_F"];
            if ((typeOf DA3F_TarObj) in _carbuStock) then
                [{
                    if !(_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                },{
                    if (_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                }];
                if (_exit) exitWith
                    {
                        [1,"Tu ne pas mettre cet item dans ce véhicule.<br/>seul les véhicules citerne sont aptes à transporter le carburant"]call DA3F_fnc_hint;
                        _exit = false;
                    };
            if (_cnt < _val) exitWith {[1,"Tu ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                if ((_PoidsMax + (_itemPoids * _val)) > _max) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
        _all = [];
        {_itemInStock = _x select 0;_nrbItemsInStock = _x select 1;_all pushBack _itemInStock;} forEach _contenu;
                if (_item in _all) then [{
                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do {
                        _itemInStock        = _contenu select _a select 0;
                        _nrbItemsInStock    = _contenu select _a select 1;
                        if (_item isEqualTo _itemInStock) then
                        [{
                            _nrbItemsInStock = _nrbItemsInStock + _val;
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _val);
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                        },{
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _nrbItemsInStock);
                        }];
                    };

                    DA3F_TarObj setVariable ["DA3F_InvVirtVeh",[_newContenu,_newPoids],true];
                },{

                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do {
                        _itemInStock        = _contenu select _a select 0;
                        _nrbItemsInStock    = _contenu select _a select 1;
                            _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                            _itemPoids  = Items_Cfg(getNumber,_itemInStock,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _nrbItemsInStock);
                    };
                            _newContenu pushBack [_item,_val];
                            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
                            _newPoids   = _newPoids + (_itemPoids * _val);
                    DA3F_TarObj setVariable ["DA3F_InvVirtVeh",[_newContenu,_newPoids],true];
            }];
                //    DA3F_TarObj setVariable ["DA3F_StockItems",[(_contenu + _val),_max,_type],true];
           // MNS_Svar_Items(_item,(_cnt-_val));
            [_item,_val,"del"]call DA3F_fnc_Add_Ret_Items;
            lbClear 1500;
            lbClear 1501;
_inv        = DA3F_TarObj getVariable "DA3F_InvVirtVeh";
_invUnit    = player getVariable "DA3F_InvVirt";

    _ArrItemVeh     = _inv select 0;
    _MaxPoidsIV     = _inv select 1;
    _ArrItem        = _invUnit select 0;
    _MaxPoids       = _invUnit select 1;
                {
                    _item   = _x select 0;
                    _nrb    = _x select 1;
                    _menu   = format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"displayname")];
                    _add    = lbAdd[1500,_menu];
                    lbSetData [1500,(lbSize 1500)-1,str[_item,_nrb]];
                } forEach _ArrItem;

                {
                    _item   = _x select 0;
                    _nrb    = _x select 1;
                    _menu   = format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"DisplayName")];
                    _add    = lbAdd[1501,_menu];
                    lbSetData [1501,(lbSize 1501)-1,str[_item,_nrb]];
                } forEach _ArrItemVeh;
        };
    };

    case 3: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_InvVirtVeh"}) then {
            _contenu    = (DA3F_TarObj getVariable "DA3F_InvVirtVeh")select 0;
            _PoidsMax   = (DA3F_TarObj getVariable "DA3F_InvVirtVeh")select 1;
            _max        = (DA3F_TarObj getVariable "DA3F_ID_Veh")select 0;
            _item       = _data_stock select 0;
            _itemNrb    = _data_stock select 1;
            _itemPoids  = Items_Cfg(getNumber,_item,"poids");
            _arr        = call DA3F_fnc_Cnt_Items_Spe;
            _Arr_items  = _arr select 1;
            _cnt        = MNS_Gvar_Items(_item);
            _inv        = DA3F_Items_Inv;
            _inv = _inv + (_itemPoids * _val);
            /*
            if ((typeOf DA3F_TarObj) in (Bases_Cfg(getArray,_NameClass,"Obj_Stock_Carbu"))) then
                [{
                    if !(_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                },{
                    if (_item isEqualTo "Carbu_Brute") then {
                        _exit = true;
                    };
                }];
                if (_exit) exitWith {[1,"Tu ne pas mettre cette item dans ce stockage"]call DA3F_fnc_hint};
            */
            if (_itemNrb < _val) exitWith {[1,"quantité indisponible"]call DA3F_fnc_hint};
                if (_inv >= DA3F_Max_Items_Inv) exitWith {[1,"Tu n'as pas assez de place"]call DA3F_fnc_hint};

                _newContenu = [];
                _newPoids   = 0;
                    for "_a" from 0 to (count _contenu -1) do
                    {
                    _itemInStock        = _contenu select _a select 0;
                    _nrbItemsInStock    = _contenu select _a select 1;
                        if (_item isEqualTo _itemInStock) then
                        [{
                            _nrbItemsInStock    = _nrbItemsInStock - _val;
                            _itemPoids          = Items_Cfg(getNumber,_item,"poids");
                            _newPoids           = _newPoids - (_itemPoids * _val);
                            if (_nrbItemsInStock > 0) then {
                                _newContenu pushBack [_item,_nrbItemsInStock];
                            };
                        },{
                                _newContenu pushBack [_itemInStock,_nrbItemsInStock];
                                _itemPoids          = Items_Cfg(getNumber,_itemInStock,"poids");
                                _newPoids           = _newPoids + (_itemPoids * _nrbItemsInStock);
                        }];
                    };

                    DA3F_TarObj setVariable ["DA3F_InvVirtVeh",[_newContenu,_newPoids],true];
                //    DA3F_TarObj setVariable ["DA3F_StockItems",[(_contenu + _val),_max,_type],true];
            [_item,_val,"add"]call DA3F_fnc_Add_Ret_Items;
            lbClear 1500;
            lbClear 1501;
_inv        = DA3F_TarObj getVariable "DA3F_InvVirtVeh";
_invUnit    = player getVariable "DA3F_InvVirt";

    _ArrItemVeh     = _inv select 0;
    _MaxPoidsIV     = _inv select 1;
    _ArrItem        = _invUnit select 0;
    _MaxPoids       = _invUnit select 1;
                {
                    _item   = _x select 0;
                    _nrb    = _x select 1;
                    _menu   = format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"displayname")];
                    _add    = lbAdd[1500,_menu];
                    lbSetData [1500,(lbSize 1500)-1,str[_item,_nrb]];
                } forEach _ArrItem;

                {
                    _item   = _x select 0;
                    _nrb    = _x select 1;
                    _menu   = format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"DisplayName")];
                    _add    = lbAdd[1501,_menu];
                    lbSetData [1501,(lbSize 1501)-1,str[_item,_nrb]];
                } forEach _ArrItemVeh;
        };
    };
};