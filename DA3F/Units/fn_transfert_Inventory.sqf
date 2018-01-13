/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_transfert_Inventory.sqf
*		Echange entre inventaire et coffre du menu I
*
*/

#include "..\..\DA3F_macros.hpp"
    disableSerialization;
	_idc		= ctrlIDC (_this select 0);
private	_value		= call compile format["%1",ctrlText 1400];
	if (_value isEqualTo 0) exitWith {[1,"Tu ne peux pas avoir une valeur à 0"]call DA3F_fnc_hint};
    switch (_idc) do {
    //Prendre
        case 2404: {
	private _invVirtObj	= DA3F_TarObj getVariable "DA3F_StockItems";
	private _inventoryUnit = player getVariable "DA3F_InvVirt";

			_index			= lbCurSel 1502;
			if (_index isEqualTo -1)exitWith {[1,"Sélectionne un item"]call DA3F_fnc_hint;};

			_arrItemStock 	= _invVirtObj select 0;
			_PoidsStock 	= _invVirtObj select 1;

			_DataitemExt	= call compile format ["%1",lbData [1502,_index]];
			_itemExt 		= _DataitemExt select 0;
			_exit 			= false;

			{
				_item 		= _x select 0;
				_Nrbitem 	= _x select 1;
						if (_value > _Nrbitem) then {_value = _Nrbitem;};
					if (_itemExt isEqualTo _item) then {
						_Nrbitem 	= _Nrbitem - _value;
		                _itemPoids  = Items_Cfg(getNumber,_item,"poids");
		                _PoidsStock = _PoidsStock - (_itemPoids * _value);
		                _invVirtObj set [1,_PoidsStock];
						_x set [1,_Nrbitem];
						if (_Nrbitem isEqualTo 0) then {
							_arrItemStock deleteAt _foreachindex;
						};
					};
			} forEach _arrItemStock;

// Inventaire player
			_arrItemUnit 	= _inventoryUnit select 0;
			_PoidsInvUnit 	= _inventoryUnit select 1;
			_all=[];
			{_all pushBack (_x select 0)} forEach _arrItemUnit;

			if (_itemExt in _all) then [{
				{
						if (_itemExt in _x) then {
							_item 		= _x select 0;
							_Nrbitem 	= _x select 1;
							_Nrbitem 	= _Nrbitem + _value;
			                _itemPoids  = Items_Cfg(getNumber,_item,"poids");
			                _PoidsInvUnit = _PoidsInvUnit + (_itemPoids * _value);
			                if (_PoidsInvUnit > DA3F_Max_Items_Inv) exitWith {_exit = true};
			                _inventoryUnit set [1,_PoidsInvUnit];
							_x set [1,_Nrbitem];
						};
				} forEach _arrItemUnit;
			},{
			    _itemPoids  = Items_Cfg(getNumber,_itemExt,"poids");
	            _PoidsInvUnit = _PoidsInvUnit + (_itemPoids * _value);
		        if (_PoidsInvUnit > DA3F_Max_Items_Inv) exitWith {[1,"Vous n'avez pas assez de place"]call DA3F_fnc_hint;closeDialog 0};
				_arrItemUnit set [count _arrItemUnit,[_itemExt,_value]];
				_inventoryUnit set [1,_PoidsInvUnit];
		}];
			if (_exit) exitWith {[1,"Vous n'avez pas assez de place"]call DA3F_fnc_hint;closeDialog 0};
        if ((typeOf DA3F_TarObj)isEqualTo "Land_LuggageHeap_02_F" && ((DA3F_TarObj getVariable "DA3F_StockItems")select 0)isEqualTo []) exitWith {deleteVehicle DA3F_TarObj;};
        };
// Depot
        case 2405: {
	private _invVirtObj	= DA3F_TarObj getVariable "DA3F_StockItems";
	private _inventoryUnit = player getVariable "DA3F_InvVirt";
			_index			= lbCurSel 1500;
			if (_index isEqualTo -1)exitWith {[1,"Sélectionne un item"]call DA3F_fnc_hint;};

			_DataitemExt	= call compile format ["%1",lbData [1500,_index]];
			_exit 			= false;
			_itemExt 		= _DataitemExt select 0;
			_arrItemStock 	= _invVirtObj select 0;
			_PoidsStock 	= _invVirtObj select 1;

			_arrItemUnit 	= _inventoryUnit select 0;
			_PoidsInvUnit 	= _inventoryUnit select 1;

			{
				_item 		= _x select 0;
				_Nrbitem 	= _x select 1;
					if (_itemExt isEqualTo _item) then {
						_Nrbitem 	= _Nrbitem - _value;
		                _itemPoids  = Items_Cfg(getNumber,_item,"poids");
		                _PoidsInvUnit = _PoidsInvUnit - (_itemPoids * _value);
		                _inventoryUnit set [1,_PoidsInvUnit];
						_x set [1,_Nrbitem];
						if (_Nrbitem isEqualTo 0) then {
							_arrItemUnit deleteAt _foreachindex;
						};
					};
			} forEach _arrItemUnit;

			_all=[];
			{_all pushBack (_x select 0)} forEach _arrItemStock;


			if (_itemExt in _all) then [{
				{
						if (_itemExt in _x) then {
							_item 		= _x select 0;
							_Nrbitem 	= _x select 1;
							_Nrbitem 	= _Nrbitem + _value;
			                _itemPoids  = Items_Cfg(getNumber,_item,"poids");
			                _PoidsStock = _PoidsStock + (_itemPoids * _value);
			                if (_PoidsStock > DA3F_Max_Items_Inv) exitWith {_exit = true};
			                _invVirtObj set [1,_PoidsStock];
							_x set [1,_Nrbitem];
						};
				} forEach _arrItemStock;
			},{
			    _itemPoids  = Items_Cfg(getNumber,_itemExt,"poids");
	            _PoidsStock = _PoidsStock + (_itemPoids * _value);
				_arrItemStock set [count _arrItemStock,[_itemExt,_value]];
				_invVirtObj set [1,_PoidsStock];
		}];
		if (_exit) exitWith {[1,"Vous n'avez pas assez de place"]call DA3F_fnc_hint};
        };
    };
    [] call DA3F_fnc_UpdateInv;