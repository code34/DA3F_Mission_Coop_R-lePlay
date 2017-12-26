/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_GetMyVehGarage.sqf
*		...
*
*/
#include "..\..\DA3F_macros.hpp"
if !(createDialog "DA3F_menu_MyVeh") exitWith {};
	_display=(findDisplay 1612172);

_arr = _this select 0;
_mrk = _this select 1;
{/*
	params[
		["_veh",objNull,[objNull]],
		["_plak",0,[0]],
		["_fuel",0,[0]],
		["_dmg",[],[""]]
	];*/

	_veh 	= _x select 0;
	_plak 	= _x select 1;
	_fuel 	= _x select 2;
	_dmg 	= _x select 3;
	_invV 	= _x select 4;

	_info 	= format ["%1 - %2",Real_NameVeh(_veh), _plak];
	_add	= lbAdd[1500,_info];
	lbSetData[1500,(lbSize 1500)-1,str[_veh,_plak,_fuel,_mrk,_dmg,_invV]];
} forEach _arr;
//hintSilent format ["Retour garage : \n\n%1", _this];
((findDisplay 1612172)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1.1' align='left'>Attente des informations...<t/>", Real_NameVeh(_classN),_plak];