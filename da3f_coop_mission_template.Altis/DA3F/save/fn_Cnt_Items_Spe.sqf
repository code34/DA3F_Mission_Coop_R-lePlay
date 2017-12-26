/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Cnt_Items_Spe.sqf
*       Compte les items du joueur et check spécialisation
*
*/
#include "..\..\DA3F_macros.hpp"
_items 	= [];
_Spe 	= [];
{
    _varName = getText(_x >> "var");
    _check_Spe = missionNamespace getVariable format ["DA3F_Sp_%1",_varName];
    if (_check_Spe) then {
    	_Spe pushBack _varName;
    };
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Spe"));
_poidsTotal=0;
{
    _check_Items	= MNS_Gvar_Items(configName _x);
    _itemPoids 		= Items_Cfg(getNumber,(configName _x),"poids");
    _calcul 		= (_itemPoids * _check_Items);
    _poidsTotal 	= _poidsTotal + _calcul;
//    _check_Items = missionNamespace getVariable format ["DA3F_Item_%1",(configName _x)];
    if (_check_Items > 0) then {
    	_items pushBack [(configName _x),_check_Items];
    };
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));
if (str _items isEqualTo '[]') then
    [{
    _items =  [[],0];
    },{
    _items =  [_items,_poidsTotal];
    }];

[_Spe,_items]