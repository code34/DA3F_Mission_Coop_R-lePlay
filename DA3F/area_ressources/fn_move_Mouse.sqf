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

private ["_invVeh","_veh","_cuve","_MaxInv","_TypeCarbu","_InventoryUsine","_maxPoids_CiternePetrole"];

#include "..\..\DA3F_macros.hpp"

	disableSerialization;

	_display 	= (findDisplay 1040118);
	_progBar 	= _display displayCtrl 1900;
	_info 		= _display displayCtrl 1100;
	_info_veh	= _display displayCtrl 1101;

	_index		= lbCurSel 1500;
	_cuve 		= player getVariable "DA3F_Pc_Petrol";
//	_cuve 		= nearestObjects [player,["Land_dp_smallTank_F"],80]select 0;
	_InventoryUsine 		= (_cuve getVariable "DA3F_StockPetrol");
	_maxQuantCit= DA3F_Cfg(getNumber,"DA3F_InvCiternePetrol");
	_exit		= false;

	if (DA3F_IsAction) exitWith {[1,"Transfert en cours..."]call DA3F_fnc_hint;};
	DA3F_IsAction = true;

		if (_index isEqualTo -1) exitWith {[1,"Séléctionne un véhicule"]call DA3F_fnc_hint; DA3F_IsAction = false;};

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

	_veh 			= _listVeh select _index;
	_NameVeh 		= Real_NameVeh(typeOf _veh);
	_inventoryVeh	= (_veh getVariable "DA3F_InvVirtVeh");

		if (isNil{_veh getVariable "DA3F_ID_Veh"}) then [{
			_MaxInv 	= Veh_Cfg(getNumber,"Default","ItemVirtSpace");
			_TypeCarbu 	= Veh_Cfg(getText,"Default","Carburant");
		},{
			_MaxInv			= (_veh getVariable "DA3F_ID_Veh")select 0;
			_TypeCarbu		= (_veh getVariable "DA3F_ID_Veh")select 1;
	}];

_arrItemsUsine 	= _InventoryUsine select 0;
_TotalPoidsUsi	= _InventoryUsine select 1;
_arrItemsVeh 	= _inventoryVeh select 0;
_TotalPoidsVeh	= _inventoryVeh select 1;

_NewItemsUsine 	= [];
_NewItemsVeh 	= [];
_NewPoidsUsi	= 0;
_NewPoidsVeh	= 0;

if (_TotalPoidsVeh >= _MaxInv) exitWith {[1,["Véhicule plein !"]]call DA3F_fnc_hint;DA3F_IsAction = false;};
if (_TotalPoidsUsi <= 0) exitWith
	{
		closeDialog 0;
		[1,"L'exploitation de carburant est à sec"]call DA3F_fnc_hint;
		DA3F_IsAction = false;
};

_arr 		= _arrItemsUsine select 0;
_item 		= _arr select 0;
_Nrbitem 	= _arr select 1;
_itemsPoids = Items_Cfg(getNumber,_item,"Poids");

_Nrbitem = _Nrbitem - 1;
_TotalPoidsUsi = _TotalPoidsUsi - (_itemsPoids * 1);
_arr set [1,_Nrbitem];
_InventoryUsine set [1,_TotalPoidsUsi];
_arrIndex = 0;
_active = false;
_all=[];
{
	_all pushBack (_x select 0);
	if ((_x select 0) isEqualTo "Carbu_Brute") then
		{
			_arrIndex =_arrIndex + _foreachindex;
			_active = true;
	};
} forEach _arrItemsVeh;

if ("Carbu_Brute" in _all) then [{

_arr 		= _arrItemsVeh select _arrIndex;
_item 		= _arr select 0;
_Nrbitem 	= _arr select 1;
_itemsPoids = Items_Cfg(getNumber,_item,"Poids");

_Nrbitem = _Nrbitem + 1;
_TotalPoidsVeh = _TotalPoidsVeh + (_itemsPoids * 1);
_arr set [1,_Nrbitem];
_inventoryVeh set [1,_TotalPoidsVeh];
},{
	_arrItemsVeh set [count _arrItemsVeh,["Carbu_Brute",1]];
	_itemsPoids 	= Items_Cfg(getNumber,"Carbu_Brute","Poids");
	_TotalPoidsVeh 	= _TotalPoidsVeh  + (_itemsPoids * 1);
	_inventoryVeh set [1,_TotalPoidsVeh];
}];
	_veh setVariable ["DA3F_InvVirtVeh",[_arrItemsVeh,_TotalPoidsVeh],true];
		_convert 	= linearConversion [0, _maxQuantCit, _TotalPoidsUsi, 0, 10, true];
		_progBar progressSetPosition _convert;
		_pos = progressPosition _progBar;

			_cP 	= 0.005;
			_cpRate = 0.0005;
		    _cP 	= _cP + _cpRate;
		    _pos 	= _pos + _cP;
		    _progBar progressSetPosition _pos;
		    _info ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1'>Citerne : <t/><t color='#01A6D9' size='1'>%1/%2<t/>",_TotalPoidsUsi,_maxQuantCit];
			_info_veh ctrlSetStructuredText parseText format ["<t color='#FEFEFE' align='left' size='1'>véhicule :<t/><t color='#01A6D9' size='1' align='right'>%1<t/><br/><t color='#FEFEFE' align='left' size='1'>Capacité :<t/><t color='#01A6D9' size='1' align='right'>%2/%3<t/>",_NameVeh,_TotalPoidsVeh,_MaxInv];
				if(_pos >= 1) exitWith {closeDialog 0;DA3F_IsAction = false;};
sleep (.3 + random .2);
DA3F_IsAction = false;