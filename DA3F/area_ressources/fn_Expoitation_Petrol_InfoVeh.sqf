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
#include "..\..\DA3F_macros.hpp"

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

	disableSerialization;
	_display 	= (findDisplay 1040118);
	_info 		= _display displayCtrl 1101;

_index 		= lbCurSel 1500;
_data		= lbData [1500,_index];
_arr		= call compile format ["%1", _data];
_veh 		= _listVeh select _index;
_plak 		= _arr select 0;
_invVeh 	= _arr select 1;
_items		= _invVeh select 0;
_TotalPoids	= _invVeh select 1;
_MaxInv 	= _arr select 2;
		_className 	= typeOf _veh;
		_NameVeh 	= Real_NameVeh(_className);
_cntItem = 0;
_NewTotal = 0;
{
	_item = _x select 0;
	_nrbItem = _x select 1;
	_poids = Items_Cfg(getNumber,_item,"poids");
	if (_item isEqualTo "Carbu_Brute") then {
		_cntItem = _cntItem + _nrbItem;
	};
	_NewTotal = _NewTotal + (_poids * _nrbItem);
} forEach _items;

//_info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' align='left' size='1'>véhicule :<t/><t color='#01A6D9' size='1' align='right'>%1<t/><br/><t color='#FEFEFE' align='left' size='1'>Capacité :<t/><t color='#01A6D9' size='1' align='right'>%2/%3<t/>",_NameVeh,_TotalPoids,_MaxInv];
_info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' align='left' size='1'>véhicule :<t/><t color='#01A6D9' size='1' align='right'>%1<t/><br/><t color='#FEFEFE' align='left' size='1'>Capacité :<t/><t color='#01A6D9' size='1' align='right'>%2/%3<t/><br/><t color='#FEFEFE' align='left' size='1'>Quantité :<t/><t color='#01A6D9' size='1' align='right'>%4<t/>",_NameVeh,_NewTotal,_MaxInv,_cntItem];