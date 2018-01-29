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
params[
["_bool",false,[false]],
["_target",objNull,[objNull]],
["_item","",[""]],
["_value",-1,[0]]
];
_return      = false;
_exit        = false;
_all        = [];
if (_item isEqualTo "" || _value isEqualTo -1) exitWith {false};


    private _Inventory      = (_target getVariable "DA3F_StockItems");
    private _contenu        = _Inventory select 0;
    private _Poidstockage   = _Inventory select 1;
    if (isNil "_Inventory") exitWith {};

if (_bool) then [{
        {_all pushBack (_x select 0)} forEach _contenu;
        if (_item in _all) then [{
            {
                _item_Stock = (_x select 0);
                _Nrbitem    = (_x select 1);
                if (_item_Stock isEqualTo _item) then {
                    _Nrbitem = _Nrbitem  + _value;
                    _poids = ([_item_Stock] call DA3F_fnc_Inv_Items_Poids) * _value;
                    _Poidstockage = _Poidstockage + _poids;
                    if (_Poidstockage > DA3F_Max_Stock_Inv) exitWith {_exit = true};
                        _x set [1,_Nrbitem];
                        _Inventory set [1,_Poidstockage];
                };
            } forEach _contenu;
            if (_exit) exitWith {
                [1,"Le stockage ne peut pas contenir autant"]call DA3F_fnc_hint;
            _return      = false;
            };
        },{
        _poids = ([_item] call DA3F_fnc_Inv_Items_Poids) * _value;
        _Poidstockage = _Poidstockage + _poids;
        if (_Poidstockage > DA3F_Max_Stock_Inv) exitWith {_exit = true};

                _contenu set [count _contenu,[_item,_value]];
                _Inventory set [1,_Poidstockage];
    }];
            if (_exit) exitWith {
                [1,"Le stockage ne peut pas contenir autant"]call DA3F_fnc_hint;
            _return      = false;
            };
    },{

        {_all pushBack (_x select 0)} forEach _contenu;

            {
                _item_Stock = (_x select 0);
                _Nrbitem    = (_x select 1);
                if (_value > _Nrbitem) then {_value = _Nrbitem};
                if (_item_Stock isEqualTo _item) then {
                    _Nrbitem = _Nrbitem  - _value;
                    _poids = ([_item_Stock] call DA3F_fnc_Inv_Items_Poids) * _value;

               // if !([false,_item_Stock,_quantit]call DA3F_fnc_Inv_UpDown_Items)then {_exit = true};

                    _Poidstockage = _Poidstockage - _poids;
                        if (_Nrbitem <= 0) then [{
                            _Nrbitem = 0;
                        _contenu deleteAt _foreachindex;
                        },{
                            _x set [1,_Nrbitem];
                    }];
                        _Inventory set [1,_Poidstockage];
                        _return      = true;
                };
            } forEach _contenu;

            if (_exit) exitWith {
                [1,"Tu manque de place mec !"]call DA3F_fnc_hint;
                _return      = false;
            };
}];
_return;