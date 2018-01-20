/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_VehicleInGarage.sqf
*		Mise au garage du véhicule (envoi info serv/delete vehicle)
*
*/
/*
// Verfier le propriétaire d'un véhicule
_proprio = (cursorTarget getVariable ["DA3F_VehInfo",[]])select 1; hint str _proprio;

// Verfier la plaque d'un véhicule
_plak = (cursorTarget getVariable ["DA3F_VehInfo",[]])select 2; hint str _plak;
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
_selectveh 		= lbCurSel 1500;
_Data       	= (lbData[1500,_selectveh]);
_list 			= nearestObjects [player,["car","air","ship","Tank"],100];
_veh 			= _list select _selectveh;
_uid 			= (_veh getVariable ["DA3F_VehInfo",[]])select 0;
_plak 			= (_veh getVariable ["DA3F_VehInfo",[]])select 2;
if (_uid isEqualTo (getPlayerUID player)) then {
	_dmg = (getAllHitPointsDamage _veh)select 2;
	_invVir = _veh getVariable "DA3F_InvVirtVeh";
	[(getPlayerUID player),_dmg,fuel _veh,_plak,_invVir] remoteExecCall ["DB_fnc_UpdateVehicle",2];
	_veh spawn{
	closeDialog 0;
	_wait = ["Parking",0.025]spawn DA3F_fnc_progresse;
	waitUntil {sleep .3; scriptDone _wait};
	[1,"Ton véhicule est au garage"]call DA3F_fnc_hint;
	deleteVehicle _this;
	closeDialog 0;
	};
};
/*
if ((getPlayerUID player) isEqualTo _uid) then {

	deleteVehicle _veh;
};
*/
