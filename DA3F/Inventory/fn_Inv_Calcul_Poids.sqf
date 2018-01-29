/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Inv_Calcul_Poids.sqf
*		Calcule le poids inventaire du joueur
*/
#include "..\..\DA3F_macros.hpp"
private ["_Poids","_ret"];
	params[
		["_item","",[""]],
		["_value",-1,[0]],
		["_Poids_Actuel",-1,[0]],
		["_Poids_Max",-1,[0]]
	];

		if (_item isEqualTo "" || _value isEqualTo -1 || _Poids_Actuel isEqualTo -1 || _Poids_Max isEqualTo -1) exitWith {};

_poids = ([_item] call DA3F_fnc_Inv_Items_Poids) * _value;
_ret = _poids;
	if ((_Poids_Actuel + _poids) > _Poids_Max) then {
	    for "_i" from 0 to 1 step 0 do {
	        _ret = _ret - 1;
	        if (_ret < 1) exitWith {};
	        _poids = ([_item] call DA3F_fnc_Inv_Items_Poids) * _ret;
	        if ((_Poids_Actuel + _poids) <= _Poids_Max) exitWith {};
	    };
	};

_ret;