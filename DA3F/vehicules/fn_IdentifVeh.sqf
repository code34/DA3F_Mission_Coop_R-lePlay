/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_IdentifVeh.sqf
*		Identification du véhicule
*
*/
_veh = vehicle cursorTarget;
_plak = (_veh getVariable ["DA3F_VehInfo",[]])select 2;
if (isNil "_plak") then {
	_plak = "???";
};
closeDialog 0;
_wait = ["Identification",0.1]spawn DA3F_fnc_progresse;
waitUntil {sleep .3; scriptDone _wait};
[1,format ["Plaque d'immatriculation :<br/>%1",_plak]]call DA3F_fnc_hint;