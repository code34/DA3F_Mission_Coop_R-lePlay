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

/*
fnc_move_Mouse={
private ["_maxPoids_CiternePetrole","_MaxInv","_TypeCarbu"];
#include "..\..\DA3F_macros.hpp"
	disableSerialization;
	_index 	= lbCurSel 1500;
	_data 	= lbData [1500,_index];

	if (_index isEqualTo -1) exitWith {[1,"Séléctionne un véhicule"]call DA3F_fnc_hint};
		if (isNil "DA3F_Action") then {
			DA3F_Action = false;
		};

		if (DA3F_Action) exitWith {};
			DA3F_Action = true;

		_listVeh 	= nearestObjects[player,
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

		_cuve 		= nearestObjects [player,["Land_dp_smallTank_F"],80]select 0;
		_veh 		= _listVeh select _index;
		_NameVeh 	= Real_NameVeh(typeOf _veh);
		if (isNil{_veh getVariable "DA3F_ID_Veh"}) then [{
			_MaxInv 	= Veh_Cfg(getNumber,"Default","ItemVirtSpace");
			_TypeCarbu 	= Veh_Cfg(getText,"Default","Carburant");
		},{
			_MaxInv			= (_veh getVariable "DA3F_ID_Veh")select 0;
			_TypeCarbu		= (_veh getVariable "DA3F_ID_Veh")select 1;
		}];
		_display 	= (findDisplay 1040118);
		_progBar 	= _display displayCtrl 1900;
		_info 		= _display displayCtrl 1100;
		_info_veh	= _display displayCtrl 1101;
		//_invVeh 	= (((_veh getVariable "DA3F_InvVirtVeh")select 0)select 0)select 1;
		_invVeh		= (_veh getVariable "DA3F_InvVirtVeh")select 1;
		_invItemVeh	= (_veh getVariable "DA3F_InvVirtVeh");
		_stockage 	= (((_cuve getVariable "DA3F_StockPetrol")select 0)select 0)select 1;

			if (isNil "_stockage") exitWith {closeDialog 0; [1,"L'exploitation de carburant est à sec"]call DA3F_fnc_hint;DA3F_Action = false;};
			if (_invVeh isEqualTo _MaxInv) exitWith {closeDialog 0; [1,"Ce véhicule est plein"]call DA3F_fnc_hint;DA3F_Action = false;};
			if (_stockage isEqualTo 0) exitWith {closeDialog 0; [1,"L'exploitation de carburant est à sec"]call DA3F_fnc_hint;DA3F_Action = false;};

				if ((_invItemVeh select 0) isEqualTo []) then {
					(_invItemVeh select 0) pushBack ["Carbu_Brute",1];
				};

		_maxPoids_CiternePetrole = DA3F_Cfg(getNumber,"DA3F_InvCiternePetrol");
		_convert 	= linearConversion [0, _maxPoids_CiternePetrole, _stockage, 0, 10, true];
		_valUp		= (_invItemVeh select 0) select 1;
		_itemsPoid = Items_Cfg(getNumber,"Carbu_Brute","Poids");
		_stockage 	= _stockage - 1;
		_valUp 		= _valUp + 1;
		(_invItemVeh select 0) set [1,_valUp];
		(_invItemVeh) set [1,(_valUp * _valUp)];
		_progBar progressSetPosition _convert;
		_pos = progressPosition _progBar;

			_cP 	= 0.005;
			_cpRate = 0.0005;
		    _cP 	= _cP + _cpRate;
		    _pos 	= _pos + _cP;
		    _progBar progressSetPosition _pos;
		    _info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1'>Citerne : <t/><t color='#01A6D9' size='1'>%1/%2<t/>",_stockage,_maxPoids_CiternePetrole];
		(((_veh getVariable "DA3F_InvVirtVeh")select 0) select 0) set [1,_invVeh];
		(((_cuve getVariable "DA3F_StockPetrol")select 0) select 0) set [1,_stockage];
			_info_veh ctrlSetStructuredText parseText format ["<t color='#FEFEFE' align='left' size='1'>véhicule :<t/><t color='#01A6D9' size='1' align='right'>%1<t/><br/><t color='#FEFEFE' align='left' size='1'>Capacité :<t/><t color='#01A6D9' size='1' align='right'>%2/%3<t/>",_NameVeh,_invVeh,_MaxInv];
			sleep 0.3;
			DA3F_Action = false;
				if(_pos >= 1) exitWith {closeDialog 0};
};
*/
	_maxPoids_CiternePetrole = DA3F_Cfg(getNumber,"DA3F_InvCiternePetrol");

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
		_stockage 	= (_cuve getVariable "DA3F_StockPetrol")select 1;
		_convert 	= linearConversion [0, _maxPoids_CiternePetrole, _stockage, 0, 10, true];
	    _info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1'>Citerne : <t/><t color='#01A6D9' size='1'>%1/%2<t/>",_stockage,_maxPoids_CiternePetrole];
		_progBar progressSetPosition _convert;
sleep (0.5);
	};
};