/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Expoitation_Petrol_Veh.sqf
*		Gère le remplissage de la cuve (véhicule)
*		this addAction ["Exploitation",DA3F_fnc_Expoitation_Petrol_Veh];
*
*/

/*
	Refaire l'ajout d'item dans le véhicule (Flemme et fatigue cumulé ne font pas bon ménage...)
*/

#include "..\..\DA3F_macros.hpp"
_this spawn {
private ["_maxPoids_CiternePetrole","_MaxInv","_TypeCarbu"];
	disableSerialization;
	if !(createDialog "Gui_ExploitPetrol") exitWith {};

	_maxPoids_CiternePetrole = DA3F_Cfg(getNumber,"DA3F_InvCiternePetrol");
	player setVariable ["DA3F_Pc_Petrol",(_this select 0),false];
	_listVeh = nearestObjects[player,
	[
		"B_Truck_01_fuel_F",
		"O_Truck_02_fuel_F",
		"O_Truck_03_fuel_F",
		"O_T_Truck_03_fuel_ghex_F",
		"O_G_Van_01_fuel_F",
		"B_G_Van_01_fuel_F",
		"I_Truck_02_fuel_F",
		"I_G_Van_01_fuel_F",
		"C_Van_01_fuel_F",
		"C_IDAP_Truck_02_water_F"
	],35];

	{
		_veh 			= _x;
		_className 		= typeOf _veh;
		_PoidsmaxInv 	= (_veh getVariable "DA3F_InvVirtVeh")select 1;
		if (isNil{_veh getVariable "DA3F_ID_Veh"}) then [{
			_MaxInv 	= Veh_Cfg(getNumber,"Default","ItemVirtSpace");
			_TypeCarbu 	= Veh_Cfg(getText,"Default","Carburant");
		},{
		_MaxInv			= (_veh getVariable "DA3F_ID_Veh")select 0;
		_TypeCarbu		= (_veh getVariable "DA3F_ID_Veh")select 1;
	}];
		_NameVeh 		= Real_NameVeh(_className);
		_invVeh 		= (_veh getVariable "DA3F_InvVirtVeh");
		_plak 			= (_veh getVariable ["DA3F_VehInfo",[]])select 2;
		_menu 			= format ["%1 %2",_NameVeh,_plak];
		_add 			= lbAdd [1500,_menu];
		lbSetData[1500,(lbSize 1500)-1,str([_plak,_invVeh,_MaxInv])];
	} forEach _listVeh;

	_display 	= (findDisplay 1040118);
	_progBar 	= _display displayCtrl 1900;
	_area 		= _display displayCtrl 1002;
	_progBar progressSetPosition 0.01;

	while {!(isNull (findDisplay 1040118))} do {
		_info 		= _display displayCtrl 1100;
		_cuve 		= nearestObjects [player,["Land_dp_smallTank_F"],50]select 0;
		_stockage 	= ((_this select 0) getVariable "DA3F_StockPetrol")select 1;
		if (isNil "_stockage") then {
			_stockage = 0;
		};
		_convert 	= linearConversion [0, _maxPoids_CiternePetrole, _stockage, 0, 10, true];
	    _info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1'>Citerne : <t/><t color='#01A6D9' size='1'>%1/%2<t/>",_stockage,_maxPoids_CiternePetrole];
		_progBar progressSetPosition _convert;
sleep (0.5);
	};
};