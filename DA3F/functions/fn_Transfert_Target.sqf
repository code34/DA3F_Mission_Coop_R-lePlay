/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Transfert_Target.sqf
*		Utilisation des items virtuel
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
params[["_type","",[""]]];
_display        = (findDisplay 121217);
_datalist1      = ((_display)displayCtrl 1500);
_datalist1      = ((_display)displayCtrl 1501);
_index_inv      = lbCurSel 1500;
_data_inv       = compile (lbData[1500,lbCurSel 1500]);
_index_stock    = lbCurSel 1501;
_data_stock     = compile (lbData[1501,lbCurSel 1501]);
_val            = compile (ctrlText 1400);
_val            = call _val;
_data_inv       = call _data_inv;
_data_stock     = call _data_stock;
_exit           = false;

if (_type isEqualTo "") exitWith {};

_maxCapa    = (DA3F_TarObj getVariable "DA3F_ID_Veh")select 0;



// Player
_inventoryUnit = player getVariable "DA3F_InvVirt";
_Item = _data_inv select 0;
_Poids = _data_inv select 1;

_allItemsUnit =[];
_index_Unit = 0;
{
    _allItemsUnit pushBack (_x select 0);
    if ((_x select 0) isEqualTo _Item) then {
        _index_Unit = _index_Unit + _foreachindex;
    };
}forEach (_inventoryUnit select 0);

///////////

// Caisse/Stockage
_inventoryStock = DA3F_TarObj getVariable "DA3F_StockItems";
_ItemStock = _data_stock select 0;
_PoidsStock = _data_stock select 1;

_allItemsStock =[];
_index_Stock = 0;
{
    _allItemsStock pushBack (_x select 0);
    if ((_x select 0) isEqualTo _ItemStock) then {
        _index_Stock = _index_Stock + _foreachindex;
    };
}forEach (_inventoryStock select 0);

    switch (_type) do {
        // Player -> Stockage
        case "Env": {

                if (_item in _allItemsUnit) then [{
                    _ArrUnit = (_inventoryUnit select 0) select _index_Unit;
                    _nrb = _ArrUnit select 1;
                    if (_val > _nrb) exitWith {[1,"Tu ne dispose pas de cette quantité"]call DA3F_fnc_hint;};
                    _nrb = _nrb - _val;
                    _ArrUnit set [1,_nrb];
                },{
                _exit = true;
            }];

                    if (_exit) exitWith {};

                if (_item in _allItemsStock) then [{
                    _ArrStock = (_inventoryStock select 0) select _index_Stock;
                    _nrb = _ArrStock select 1;
                    _nrb = _nrb + _val;
                    _ArrStock set [1,_nrb];
                },{
                (_inventoryStock select 0) set [count(_inventoryStock select 0),[_item,_val]];
            }];
                    _itemPoids  = Items_Cfg(getNumber,_item,"poids");
                    _PoidsStock = _PoidsStock + (_itemPoids * _val);
                    _Poids = _Poids - (_itemPoids * _val);
        };

        // Stockage -> Player
        case "Rec": {
                if (_ItemStock in _allItemsStock) then [{
                    _ArrStock = (_inventoryStock select 0) select _index_Stock;
                    _nrb = _ArrStock select 1;
                    if (_val > _nrb) exitWith {[1,"Le stockage ne dispose pas de cette quantité"]call DA3F_fnc_hint;};
                    _nrb = _nrb - _val;
                    _ArrStock set [1,_nrb];
                },{
                _exit = true;
            }];

                    if (_exit) exitWith {};

                if (_ItemStock in _allItemsUnit) then [{
                    _ArrUnit = (_inventoryUnit select 0) select _index_Unit;
                    _nrb = _ArrUnit select 1;
                    _nrb = _nrb + _val;
                    _ArrStock set [1,_nrb];
                },{
                (_inventoryUnit select 0) set [count(_inventoryUnit select 0),[_item,_val]];
            }];
                    _itemPoids  = Items_Cfg(getNumber,_item,"poids");
                    _PoidsStock = _PoidsStock + (_itemPoids * _val);
                    _Poids = _Poids - (_itemPoids * _val);
        };

    };
closeDialog 0;