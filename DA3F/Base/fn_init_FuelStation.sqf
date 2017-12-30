/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_init_FuelStation.sqf
*
*/
private ["_class", "_debug", "_listVeh", "_display", "_cnt", "_Stock", "_Max", "_ClassPar", "_menu", "_add", "_veh", "_plak", "_infos", "_dis", "_fuelCapa", "_NameVeh", "_fuel", "_litres", "_VulisteVeh"];
#include "..\..\DA3F_macros.hpp"
disableSerialization;
if !(createDialog "Gui_station") exitWith {};
_class		= _this select 3;
_debug		= true;
if (isNil "_class" or _class isEqualTo "") then
{
	_class = ClassVeh(typeOf (_listVeh select 0));
	_class = [_class];
};
_display 	= (findDisplay 221217);
// à venir pour la MAJ (choix du type de carburant)
{
	_x ctrlShow false;
} forEach [((_display)displayCtrl 2101),((_display)displayCtrl 1101)];

_listVeh = nearestObjects [player,_class,10];
_cnt = 0;
{
	_cnt =_cnt + 1;
	_Stock 		= _x getVariable "DA3F_StockItems";
	_Max 		= _x getVariable "DA3F_MaxStock";
	//_ClassPar 	= _x getVariable "DA3F_ClassParent";
	_menu 		= format ["Citerne n°%1 - %2 / %3", _cnt,(_Stock select 1),_Max];
	_add		= lbAdd[2100,_menu];
	lbSetData [2100,(lbSize 2100)-1,str _foreachindex];
} forEach (nearestObjects [player,["Land_Tank_rust_F"],30]);

{
	_veh = _x;
	if (_debug) then {
		_plak = format ["%1 %2%3 %4",
		round(random 1000),
		selectRandom["A","B","C","D","E","Z","X","Y","M","T","V","K","P"],
		selectRandom["F","G","H","I","J","Z","X","Y","M","T","V","K","P"],
		round(random 99)];
		_infos = ["554544754545",(name player),_plak];
		_veh setVariable ["DA3F_VehInfo",_infos,true];
	};
	_dis = round(player distance (getPos _veh));
	_fuelCapa = ClassVeh_i(getNumber,(typeOf _veh),"fuelCapacity");
	_NameVeh = Real_NameVeh(typeOf _veh);
	_fuel	= fuel _veh;
	_litres 	= round(_fuelCapa * _fuel);
	_plak	= (_x getVariable ["DA3F_VehInfo",[]])select 2;
	_VulisteVeh = format ["%1 %4.L- %2 - %3m",_NameVeh,_plak,_dis,_litres];
	_add	= lbAdd [1500,_VulisteVeh];
	lbSetData [1500,(lbSize 1500)-1,str[(typeOf _veh),_plak,_litres,_dis]];
} forEach _listVeh;