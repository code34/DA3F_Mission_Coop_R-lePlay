/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_InventoryVirtVeh.sqf
*		Identification du véhicule
*
*/
#include "..\..\DA3F_macros.hpp"
_veh 		= vehicle DA3F_TarObj;
_inv 		= _veh getVariable "DA3F_InvVirtVeh";
_invUnit 	= player getVariable "DA3F_InvVirt";
_dial = (createDialog "Gui_Coms_Consult");
if ! _dial exitWith {};
	_display 		= (findDisplay 121217);
	_ArrItemVeh 	= _inv select 0;
	_MaxPoidsIV		= _inv select 1;
	_ArrItem 		= _invUnit select 0;
	_MaxPoids		= _invUnit select 1;

	_Btn_GoInv 	= ((_display)displayCtrl 2400);
	_Btn_GoStok = ((_display)displayCtrl 2401);
	/*
	_Btn_GoInv 	ctrladdEventHandler ["buttonclick",{["Rec"] call DA3F_fnc_Transfert_Target}];
	_Btn_GoStok ctrladdEventHandler ["buttonclick",{["Env"] call DA3F_fnc_Transfert_Target}];
	*/

	_Btn_GoInv 	ctrladdEventHandler ["buttonclick",{[3] call DA3F_fnc_Transfert_Target_1}];
	_Btn_GoStok ctrladdEventHandler ["buttonclick",{[2] call DA3F_fnc_Transfert_Target_1}];

	{
		_item 	= _x select 0;
		_nrb 	= _x select 1;
		_menu	= format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"displayname")];
		_add 	= lbAdd[1500,_menu];
		lbSetData [1500,(lbSize 1500)-1,str[_item,_nrb]];
	} forEach _ArrItem;

	{
		_item 	= _x select 0;
		_nrb 	= _x select 1;
		_menu	= format ["%1 X %2", _nrb,Items_Cfg(getText,_item,"DisplayName")];
		_add 	= lbAdd[1501,_menu];
		lbSetData [1501,(lbSize 1501)-1,str[_item,_nrb]];
	} forEach _ArrItemVeh;
