/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Expoitation_Petrol.sqf
*		Gère le remplissage de la cuve (Site pétrolier)
*		this addAction ["Exploitation",DA3F_fnc_Expoitation_Petrol];
*
*/

#include "..\..\DA3F_macros.hpp"

private ["_maxPoids_CiternePetrole","_cuve","_usine","_panne","_inventoryUsine","_arrItemsUsine","_cycle","_TypeCarbu","_sound","_all","_newInv","_item","_nbrItem","_val","_itemsPoids","_stockage","_nameItem","_TotalPoidsUsine"];

hintSilent "Lancement de l'exploitation";
player say3D "spawn";

if (isnil {(_this select 0) getVariable "DA3F_Farm_IsAcive"}) then {
	(_this select 0) setVariable ["DA3F_Farm_IsAcive",false,true];
};

if ((_this select 0) getVariable "DA3F_Farm_IsAcive") exitWith {[1,"L'usine est déjà en travail"]call DA3F_fnc_hint;};

	(_this select 0) setVariable ["DA3F_Farm_IsAcive",true,true];

	_maxPoids_CiternePetrole = DA3F_Cfg(getNumber,"DA3F_InvCiternePetrol");
	_cuve = nearestObjects [getPos (_this select 0),["Land_dp_smallTank_F"],80]select 0;
	_usine = nearestObjects [getPos (_this select 0),["Land_Factory_Main_F"],80]select 0;

	if (isNil "_cuve") exitWith {};
		if (isNull _cuve) exitWith {};
			if (isNil{_cuve getVariable "DA3F_StockPetrol"}) then {
				_cuve setVariable ["DA3F_StockPetrol",[[],0],true];
			};
			_panne = false;
			_cycle = (15 + ceil random 30);
			_TypeCarbu	= "Carbu_Brute";
			_sound = "Sign_Sphere10cm_F" createVehicle position _usine;
			_sound setObjectTextureGlobal [0,""];


		_newInv = [];
		_newPoids = 0;
		for "_a" from 1 to _cycle step 0.5 do {


			_inventoryUsine = (_cuve getVariable "DA3F_StockPetrol");
			_arrItemsUsine = _inventoryUsine select 0;
			_TotalPoidsUsine = _inventoryUsine select 1;
			_all = [];
			_arrIndex = 0;
			{
			_all pushBack (_x select 0);
			if ((_x select 0) isEqualTo "Carbu_Brute") then
				{
					_arrIndex =_arrIndex + _foreachindex;
			};
		} forEach _arrItemsUsine;

			// 30% de chance de tomber en panne
			if (_a > 3 && (random 100) < 30) exitWith {_panne = true;};

				if (_TypeCarbu in _all) then [{


					_arr 		= _arrItemsUsine select _arrIndex;
					_item 		= _arr select 0;
					_Nrbitem 	= _arr select 1;
					_itemsPoids = Items_Cfg(getNumber,_item,"Poids");
					_val = (ceil random 3);
					_Nrbitem = _Nrbitem + _val;
					_TotalPoidsUsine = _TotalPoidsUsine + (_itemsPoids * _val);
					_arr set [1,_Nrbitem];
					_inventoryUsine set [1,_TotalPoidsUsine];
						},{

							_val = (ceil random 3);
							_arrItemsUsine set [count _arrItemsUsine,["Carbu_Brute",_val]];
							_itemsPoids 	= Items_Cfg(getNumber,"Carbu_Brute","Poids");
							_TotalPoidsUsine 	= _TotalPoidsUsine  + (_itemsPoids * _val);
							_inventoryUsine set [1,_TotalPoidsUsine];
					}];
				_sound say3D "Device_disassembled_loop"; // "mining";
				sleep (30 + random 30);
};
		(_this select 0) setVariable ["DA3F_Farm_IsAcive",false,true];
			_nameItem = Items_Cfg(getNumber,_TypeCarbu,"displayname");
			deleteVehicle _sound;
		if (_panne) then [{
			[1,format["L'exploitation de carburant est tombé en panne<br/>%1<br/>%2/%3",_nameItem,_TotalPoidsUsine,_maxPoids_CiternePetrole]] call DA3F_fnc_hint;
		},{
			[1,format["L'exploitation de carburant est à l'arrêt.<br/>%1<br/>%2/%3",_nameItem,_TotalPoidsUsine,_maxPoids_CiternePetrole]] call DA3F_fnc_hint;
		}];