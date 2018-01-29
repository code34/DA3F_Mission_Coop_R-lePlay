/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ActionVeh.sqf
*		Menu interaction (Windows) du véhicule
*
*/
#include "..\..\DA3F_macros.hpp"

disableSerialization;
if (dialog) exitWith {closeDialog 0};
if (cursorTarget isKindOf "Man") exitWith {};
if (isNull cursorTarget) exitWith {};
if (cursorTarget distance player > 8) exitWith {};

if !(createDialog "Gui_veh") exitWith {};
	_display = (findDisplay 251217);

{
	_add = lbAdd[1500,_x];
	lbSetData[1500,(lbSize 1500)-1,_x];
} forEach
	[
		"Identifier",
		"Coffre",
		"Réparation",
		"Sortir personne(s)"
	];


	_Txt_info 	= ((_display)displayCtrl 1100);

	_Txt_info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' align='left' size='.9' >%1<t/><br/><t color='#F44100' align='right' size='.9' >%2<t/>",Real_NameVeh(typeOf DA3F_TarObj),(DA3F_TarObj getVariable ["DA3F_VehInfo",[]])select 2];