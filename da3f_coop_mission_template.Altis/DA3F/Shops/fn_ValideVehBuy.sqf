/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShowList.sqf
*
*/
/*
// Verfier le propriétaire d'un véhicule
_proprio = (cursorTarget getVariable ["DA3F_VehInfo",[]])select 1; hint str _proprio;

// Verfier la plaque d'un véhicule
_plak = (cursorTarget getVariable ["DA3F_VehInfo",[]])select 2; hint str _plak;
*/

_this spawn {
private ["_selectCat","_selectveh","_selectMrk","_selectInVeh","_timeDelVehinMrkSp","_exit","_veh","_PriceAchat","_PriceVente","_mrk","_Infomrk","_pos","_vehGenant","_pos_1","_pos_2","_alti","_vehsp"];
#include "fn_Cfg_ShohVehinit.sqf"
disableSerialization;
_selectCat = lbCurSel 2100;
_selectveh = lbCurSel 1500;
_selectMrk = lbCurSel 1501;
_selectInVeh = lbCurSel 2101;
_Garage 	= lbText[2100,lbCurSel 2100];
_timeDelVehinMrkSp = 30; // Temps avant que le vehicule soit supprimé si il occupe le spawn (a partir du moment ou il gêne un spawn)
_exit = false;
{
	if (_x isEqualTo -1) then {_exit = true};
}forEach [_selectveh,_selectCat,_selectMrk];

if (_exit) exitWith {hint "Rempliser tous les champs"};
if (_Garage isEqualTo "Mon Garage") then [{
		_vehIn_Garage = DA3F_GarageUnit;
		_infos = _vehIn_Garage select _selectveh;
		_className 	= _infos select 0;
		_Dgm_Veh 	= _infos select 1;
		_fuel_Veh 	= _infos select 2;
		_plak_Veh 	= _infos select 3;
	    _mrk 		= (_arrayMrkSp select _selectMrk) select 0;
	    _Infomrk 	= (_arrayMrkSp select _selectMrk) select 1;
	    _pos 		= getMarkerPos _mrk;
		_vehsp 		= _className createVehicle _pos;
		_vehsp allowDamage false;
		_vehsp setDamage _Dgm_Veh;
		_vehsp setFuel _fuel_Veh;
	    _pos 		= getMarkerPos _mrk;
		_Veh_infos = [(getPlayerUID player),(name player),_plak_Veh];
		_vehsp setVariable ["DA3F_VehInfo",_Veh_infos,true];
		_newinfo = [];
		for "_a" from 0 to (count _vehIn_Garage -1) do {
			if !(_a isEqualTo _selectveh) then {
				_newinfo pushBack _vehIn_Garage select _a;
			};
		};
		missionNamespace setVariable ["DA3F_GarageUnit",_newinfo];

			if (_selectInVeh isEqualTo 1) then
				[{
				_alti = lbText[2102,lbCurSel 2102];
				if ((lbCurSel 2102)isEqualTo -1) then [{
					_alti = 250;
				},{
					_alti = parseNumber _alti;
				}];

				if (_vehsp isKindOf "air") then {
					_pos = [(_pos select 0),(_pos select 1),_alti];
					_vehsp setPosATL _pos;
					[1,format ["Position : <br/> %1 <br/>Information sur la zone :<br/> %2 <br/> Altitude :<br/> %3m",markerText _mrk, _Infomrk,_alti]]call DA3F_fnc_hint;
				};

				_vehsp setDir (markerDir _mrk);
				player moveInDriver _vehsp;
				0 fadeSound 0.1;
				_vel = velocity _vehsp;
				_dir = direction _vehsp;
				_speed = 20;
				_vehsp setVelocity [
					(_vel select 0) + (sin _dir * _speed),
					(_vel select 1) + (cos _dir * _speed),
					(_vel select 2)
					];
		},{
				deleteVehicle _vehsp;
				sleep 0.01;
				_vehsp = createVehicle [_className,[(_pos select 0),(_pos select 1),0.2],[],0,"None"];
			//	_vehsp setPos getMarkerPos _mrk;
		}];
closeDialog 0;
call DA3F_fnc_SaveStats;
sleep 1;
_vehsp allowDamage true;
},{
	_veh = ((_arrayVeh select _selectCat) select (_selectveh +1))select 0;
	_PriceAchat = ((_arrayVeh select _selectCat) select (_selectveh +1))select 1;
	_PriceVente = ((_arrayVeh select _selectCat) select (_selectveh +1))select 2;
    _mrk = (_arrayMrkSp select _selectMrk) select 0;
    _Infomrk = (_arrayMrkSp select _selectMrk) select 1;
    _pos = getMarkerPos _mrk;
    _nearOtherVeh = nearestObjects [_pos,["car","air","ship"],6];
if (DA3F_Cash < _PriceAchat) exitWith
	{
		[1,"Tu manques d'argent."]call DA3F_fnc_hint;
	};
if ((count(_nearOtherVeh))> 0) then [{
		[1,format["Un véhicule occupe le spawn<br/>Il sera détruit dans : <br/> %1min<br/>Si il reste sur le spawn",[_timeDelVehinMrkSp,"MM:SS"]call bis_fnc_secondsToString]]call DA3F_fnc_hint;
		_vehGenant = _nearOtherVeh select 0;
		if (_timeDelVehinMrkSp < 15) then {_timeDelVehinMrkSp = 15};
		_vehGenant setVariable ["DA3F_TimeDel",_timeDelVehinMrkSp,false];
		_vehGenant spawn {
		_pos_1 = getPos _this;
		_timeDelVehinMrkSp = _this getVariable "DA3F_TimeDel";
		sleep _timeDelVehinMrkSp;
		_pos_2 = getPos _this;
		if (_pos_1 distance _pos_2 <= 0.2) then
			{
				deleteVehicle _this;
			};
		};
	},{
			if (_Infomrk isEqualTo "") then {
				_Infomrk = "Aucune info"
			};
		[1,format ["%1 <br/> %2",markerText _mrk, _Infomrk]]call DA3F_fnc_hint;


			_vehsp = createVehicle [_veh,[(_pos select 0),(_pos select 1),0.2],[],0,"FLY"];
			_vehsp allowDamage false;
		if (_selectInVeh isEqualTo 1) then
			[{
			_alti = lbText[2102,lbCurSel 2102];
			if ((lbCurSel 2102)isEqualTo -1) then [{
				_alti = 250;
			},{
				_alti = parseNumber _alti;
			}];

				if (_vehsp isKindOf "air") then {
					_pos = [(_pos select 0),(_pos select 1),_alti];
					_vehsp setPosATL _pos;
					[1,format ["Position : <br/> %1 <br/>Information sur la zone :<br/> %2 <br/> Altitude :<br/> %3m",markerText _mrk, _Infomrk,_alti]]call DA3F_fnc_hint;
				};

				_vehsp setDir (markerDir _mrk);
				player moveInDriver _vehsp;
				0 fadeSound 0.1;
				_vel = velocity _vehsp;
				_dir = direction _vehsp;
				_speed = 20;
				_vehsp setVelocity [
					(_vel select 0) + (sin _dir * _speed),
					(_vel select 1) + (cos _dir * _speed),
					(_vel select 2)
					];
		},{
				deleteVehicle _vehsp;
				sleep 0.01;
				_vehsp = createVehicle [_veh,[(_pos select 0),(_pos select 1),0.2],[],0,"None"];
			//	_vehsp setPos getMarkerPos _mrk;
				/*
				sleep 0.7;
				player attachTo [_vehsp,[3,1,0]];
				detach player;
				*/
		}];

		_plak = format ["%1 %2%3 %4",
		round(random 99),
		selectRandom["A","B","C","D","E"] ,
		selectRandom["F","G","H","I","J"] ,
		round(random 99)];
		_infos = [(getPlayerUID player),(name player),_plak];
		_vehsp setVariable ["DA3F_VehInfo",_infos,true];
		DA3F_Cash = DA3F_Cash - _PriceAchat;
		call DA3F_fnc_SaveStats;
		sleep 1;
		_vehsp allowDamage true;
	}];
	closeDialog 0;
}];
	if (_vehsp isKindOf "I_Truck_02_fuel_F") then {
		_vehsp setVariable ["DA3F_Res_Carbu",[0,250],true]; // cursorTarget getVariable "DA3F_Res_Carbu";
	};
};