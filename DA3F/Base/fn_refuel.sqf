/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_refuel.sqf
*
*/
_this spawn
	{
	private ["_Btn_idc", "_debug", "_idc", "_index", "_index_Box", "_infos", "_carbu", "_arrInfos", "_ClassNveh", "_plak", "_litres", "_dis", "_listVeh", "_veh", "_plakVeh", "_ActualFuel", "_value", "_fuelCapa", "_Actulitre", "_calcul", "_Newfuel", "_wait", "_citerne", "_a", "_max", "_newInfo", "_total", "_item", "_nrb"];
	#include "..\..\DA3F_macros.hpp"
	disableSerialization;
	_Btn_idc	= ctrlIDC (_this select 0);
	_debug		= true;
	_idc 		= 1500;
	_index 		= lbCurSel 1500;
	_index_Box	= lbCurSel 1500;
	_infos 		= compile(lbData [_idc,_index]);
	_carbu 		= compile(lbData [2100,lbCurSel 2100]);
	_carbu		= call _carbu;
	_arrInfos	= call _infos;
	_ClassNveh	= _arrInfos select 0;
	_plak		= _arrInfos select 1;
	_litres		= _arrInfos select 2;
	_dis		= _arrInfos select 3;
	_listVeh	= nearestObjects [player,[_ClassNveh],10];
	{
		_veh 		= _x;
		_plakVeh	= (_x getVariable ["DA3F_VehInfo",[]])select 2;
		if (_plakVeh isEqualTo _plak) then {
			_ActualFuel = fuel _veh;
			_value 		= call compile(ctrlText 1400);
			_fuelCapa 	= ClassVeh_i(getNumber,_ClassNveh,"fuelCapacity");
			_Actulitre 	= round(_fuelCapa * _ActualFuel);
			_calcul		= round((_value + _Actulitre));
			_Newfuel	= ((_value + _Actulitre)/_fuelCapa);

			if (_calcul > _fuelCapa) exitWith {closeDialog 0;[1,format ["Le réservoir ne dispose pas de cette capacité", nil]]call DA3F_fnc_hint; true};
			if (_debug) then {
				[1,format ["Litre avant: %2<br/>Litre après %1<br/>Litre ajouté %3<br/>New fuel : %4<br/>fuel : %5", _calcul, _Actulitre, _value, _Newfuel,_ActualFuel]]call DA3F_fnc_hint;
			};
			closeDialog 0;
			[1,format ["Remplissage en cours...%1", _carbu]]call DA3F_fnc_hint;
			sleep (2 + (random 5));
			//_wait = ["Remplissage",0.3,false] spawn DA3F_fnc_Progresse;
			//	waitUntil {sleep .3;scriptDone _wait};
			if (_Btn_idc isEqualTo 2400) then {
				_veh setFuel _Newfuel;
			};
			if (_Btn_idc isEqualTo 2402) then {
				_veh setFuel 1;
			};
			_citerne = (nearestObjects [player,["Land_Tank_rust_F"],30])select _index_Box;
			_a = _citerne getVariable 'DA3F_StockItems';
			_max 	= _citerne getVariable 'DA3F_MaxStock';
			_newInfo = [];
			_total = _a select 1;
			_total	= _total - _value;
			//_newInfo pushBack [_item,_nrb];
			/*
			{
				_item 	= _x select 0;
				_nrb 	= _x select 1;
				_nrb	= _nrb - _value;
				_total	= _total - _value;
				_newInfo pushBack [_item,_nrb];
			} forEach (_a select 0);
			*/
			_citerne setVariable ["DA3F_StockItems",[[],_total],true];
			[1,format ["%1 - %2 <br/><br/>%3<br/>%4", _calcul, _citerne,_a,_value]]call DA3F_fnc_hint;
			//	[1,format ["Ravitaillement terminé<br/>le véhicule dispose de %1.L", _calcul]]call DA3F_fnc_hint;
		};
	} forEach _listVeh;
};