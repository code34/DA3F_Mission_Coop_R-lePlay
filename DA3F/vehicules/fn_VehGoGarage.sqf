/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SaveVeh.sqf
*       Save des véhicules du joueurs (Mise au garage)
*		Action direct dans le fichier : _da3F = this call DA3F_fnc_VehGoGarage;
*		action sur obj Map : this addAction ["Ranger mon véhicule",DA3F_fnc_VehGoGarage,"",0,false,false,"","_this distance _target < 4"];
*
*/

private ["_veh","_name_mission","_My_Veh","_proprio","_Veh_In_garage"];
disableSerialization;
#include "..\..\DA3F_macros.hpp"
if ! (createDialog "DA3F_GarageVeh") exitWith {};
	_display = (findDisplay 161217);
	_list = nearestObjects [player,["car","air","ship","Tank"],100];
for "_a" from 0 to (count _list -1) do {
		_veh = (_list select _a);
		_Real_Name = Real_NameVeh(typeOf _veh);
		_dist	= round(player distance getPos _veh);
		if (((_veh getVariable ["DA3F_VehInfo",[]])select 0) isEqualTo (getPlayerUID player)) then {
			_add=lbAdd[1500,format ["%1 %2m", _Real_Name,_dist]];
			//lbSetData[1500,(lbSize 1500) -1,str(_var)];
		};
};

/*
if (isNil "_veh") exitWith {[1,"Aucun véhicule"]call DA3F_fnc_hint};
if (isNull _veh) exitWith {[1,"Aucun véhicule"]call DA3F_fnc_hint};

_name_mission = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
_MaxVehicle   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Max_save_Veh");
_My_Veh = [];
_proprio = (_veh getVariable ["DA3F_VehInfo",[]])select 0;
	_className 	= typeOf _veh;
	_Dmg_Veh 	= damage _veh;
	_fuel_Veh 	= fuel _veh;
	_plak 		= (_veh getVariable "DA3F_VehInfo")select 2;
if (_proprio isEqualTo (getPlayerUID player)) then [{
		if (isNil "DA3F_GarageUnit") then
			[{
				missionNamespace setVariable ["DA3F_GarageUnit",[[_className,_Dmg_Veh,_fuel_Veh,_plak]]];
			},{
			if (count DA3F_GarageUnit>= _MaxVehicle) exitWith {[1,"Vous avez trop de véhicule dans votre garage"]call DA3F_fnc_hint;};
				DA3F_GarageUnit pushBack [_className,_Dmg_Veh,_fuel_Veh,_plak];
				missionNamespace setVariable ["DA3F_GarageUnit",DA3F_GarageUnit];
			}];
		deleteVehicle _veh;
	[1,"Le véhicule a été ajouté dans votre garage"]call DA3F_fnc_hint;
	},{
	[1,"Le véhicule le plus proche ne vous appartient pas"]call DA3F_fnc_hint;
}];
*/