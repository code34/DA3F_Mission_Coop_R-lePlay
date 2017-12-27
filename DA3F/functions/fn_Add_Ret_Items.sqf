
/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Add_Ret_Items.sqf
*
* 	Arguments :
* 		STRING , SCALAR , STRING
* 		"NameItem" , 1 , "add"
*
* 	Exemples :
* 		// Ajout d'item(s) au joueur
* 		["Obj_water",2,"add"]call DA3F_fnc_Add_Ret_Items;
* 		// Retrait d'item(s) au joueur
* 		[_item,_value,"del"]call DA3F_fnc_Add_Ret_Items;
*
*/
#include "..\..\DA3F_macros.hpp"
	params [
		["_item", "", [""]],
		["_value", 0, [0]],
		["_type", "", [""]]
		];

		if (_item isEqualTo "") exitWith
			{
				if (DA3F_Active_debug)then
					{
						[1,format["Erreur sur la gestion de l'inventaire<br/>%1<br/>Item attendu","fn_Add_Ret_Items.sqf"]]call DA3F_fnc_hint;
						diag_log format ["DA3F log :: Item attendu dans fn_Add_Ret_Items.sqf", nil];
				};
			};

		if (_value isEqualTo 0) exitWith
			{
				if (DA3F_Active_debug)then
					{
						[1,format["Erreur sur la gestion de l'inventaire<br/>%1<br/>Valeur attendu","fn_Add_Ret_Items.sqf"]]call DA3F_fnc_hint;
						diag_log format ["DA3F log :: Valeur attendu dans fn_Add_Ret_Items.sqf", nil];
				};
			};

		if (_type isEqualTo "") exitWith
			{
				if (DA3F_Active_debug)then
					{
						[1,format["Erreur sur la gestion de l'inventaire<br/>%1<br/>","fn_Add_Ret_Items.sqf"]]call DA3F_fnc_hint;
						diag_log format ["DA3F log :: type (add ou del) attendu dans fn_Add_Ret_Items.sqf", nil];
				};
			};

//	DA3F_Max_Items_Inv
	_exit_poids 	= false;
	_exit_NoItems 	= false;
	_Succes 		= false;
	_invVirtUntis	= player getVariable "DA3F_InvVirt";
	_arrItems		= _invVirtUntis select 0;
	_MaxPoidsItems	= _invVirtUntis select 1;
	_NameItem		= Items_Cfg(getText,_item,"displayName");
	_poids			= Items_Cfg(getNumber,_item,"poids");
	_cnt            = MNS_Gvar_Items(_item);
	_invPoids		= DA3F_Items_Inv;
	_Poids_total	= (_poids * _value);
	_AllItemInInv	= [];
	private ["_MaxPItems"];
		{_AllItemInInv pushBack (_x select 0)}foreach _arrItems;
		switch (_type) do {
		    case "add":
		    {
				_invPoids = _invPoids + _Poids_total;
				if (_invPoids > DA3F_Max_Items_Inv) then
					[{
					_exit_poids = true;
				},{
					if (_item in _AllItemInInv) then [{
						_index 		= _AllItemInInv find _item;
						_ittst 		= _arrItems select _index;
						_NrbItm 	= _ittst select 1;
						_NrbItm 	= _NrbItm + _value;
						_poids		= Items_Cfg(getNumber,_item,"poids");
						_MaxPoidsItems 	= _MaxPoidsItems + (_poids * _value);
						_arrItems set [_index,[_item,_NrbItm]];
						MNS_Svar_Items(_item,_NrbItm);
					},{
						_arrItems pushBack [_item,_value];
						_MaxPoidsItems 	= _MaxPoidsItems + (_poids * _value);
						MNS_Svar_Items(_item,_value);
				}];
				player setVariable ["DA3F_InvVirt",[_arrItems,_MaxPoidsItems],false];
				_Succes = true;
			}];
		    };

		    case "del":
		    {
					if (_item in _AllItemInInv) then [{
						_index 		= _AllItemInInv find _item;
						_ittst 		= _arrItems select _index;
						_NrbItm 	= _ittst select 1;
						_NrbItm 	= _NrbItm - _value;
						if (_value > _cnt) then {
							_value = _cnt;
						};
						if (_NrbItm <= 0) then
							[{
						_arrItems deleteAt _index;
						},{
						_poids		= Items_Cfg(getNumber,_item,"poids");
						_MaxPoidsItems 	= _MaxPoidsItems - (_poids * _value);

						if (_NrbItm > 0) then [{
						_arrItems set [_index,[_item,_NrbItm]];
						},{
						MNS_Svar_Items(_item,0);
					}];
					}];
					player setVariable ["DA3F_InvVirt",[_arrItems,_MaxPoidsItems],false];
					_Succes = true;
				},{
					_exit_NoItems = true;
				}];

		    };
		};

		if (_exit_poids) exitWith {[1,"Vous n'avez pas assez de place."]call DA3F_fnc_hint;};
		if (_exit_NoItems) exitWith {[1,"Vous n'avez pas cet item."]call DA3F_fnc_hint;};
		_Succes