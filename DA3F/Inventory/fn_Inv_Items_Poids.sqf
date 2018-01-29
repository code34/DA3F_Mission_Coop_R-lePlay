/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Inv_Items_Poids.sqf
*		Retourne le poids d'un item
*		Pourquoi faire un fichier ?
*		Cela facilite le calcule pour la gestion des inventaires.
*
*/
#include "..\..\DA3F_macros.hpp"
params[["_item","",[""]]];

	if (_item isEqualTo "") exitWith {};

_item_Poids = Items_Cfg(getNumber,_item,"Poids");
_item_Poids;