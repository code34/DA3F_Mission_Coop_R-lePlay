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
*       	[true,_item,_value]call DA3F_fnc_Inv_UpDown_Items; // add
*       	[true,"Carbu_brute",2]call DA3F_fnc_Inv_UpDown_Items; // add
*
*       	[false,_item,_value]call DA3F_fnc_Inv_UpDown_Items; // del
*       	[false,"Carbu_brute",2]call DA3F_fnc_Inv_UpDown_Items; // del
*
*/

#include "..\..\DA3F_macros.hpp"
params[
["_bool",false,[false]],
["_item","",[""]],
["_value",-1,[0]]
];
private ["_Poids","_NumItemsUnit","_return","_diff"];
_exit = false;
_return = "";
//systemChat format ["%1",str _bool,_item,_value];
if (_item isEqualTo "" || _value isEqualTo -1) exitWith {false};

if (_bool) then {
    _diff = [_item,_value,DA3F_Items_Inv,DA3F_Max_Items_Inv]call DA3F_fnc_Inv_Calcul_Poids;
//    systemChat str _diff;
//    _value = _diff;
    if (_diff <= 0) exitWith {systemChat "Je passe par la connard !"; false};
};

_poids = ([_item] call DA3F_fnc_Inv_Items_Poids) * _value;
_NumItemsUnit = MNS_Gvar_Items(_item);

if (_bool) then [{
    if ((DA3F_Items_Inv + _poids) <= DA3F_Max_Items_Inv) then [{
    	MNS_Svar_Items(_item,(_NumItemsUnit + _value));

        if ((MNS_Gvar_Items(_item)) > _NumItemsUnit) then [{
                    DA3F_Items_Inv = DA3F_Items_Inv + _poids;
                    _return = true;
                } , {
                    _return = false;
                }];
    },{
        _return = false;
    }];

} , {

    //Lets SUB!
    if ((_NumItemsUnit - _value) < 0) then [{ _return = false;} , {
            MNS_Svar_Items(_item,(_NumItemsUnit - _value));

            if ((MNS_Gvar_Items(_item)) < _NumItemsUnit) then [{
                            DA3F_Items_Inv = DA3F_Items_Inv - _poids;
                            _return = true;
                    } , {
                        _return = false;
                    }];
        }];
}];

_return;