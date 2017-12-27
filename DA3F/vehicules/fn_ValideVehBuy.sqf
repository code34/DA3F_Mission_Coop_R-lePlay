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

#include "..\..\DA3F_macros.hpp"
disableSerialization;

_selectCat 		= lbCurSel 2100;
_selectveh 		= lbCurSel 1500;
_selectMrk 		= lbCurSel 1501;
_selectInVeh 	= lbCurSel 2101;
_Garage 		= lbText[2100,lbCurSel 2100];
_Data       	= (lbData[1500,_selectveh]);
_debug			= false;
if !(_Data isEqualTo "") then [{
	_Data 	= call compile _Data;
},{
	_exit = true;
}];

//systemChat str _Data;
_arrayMrkSp	= Mrk_SpVeh_Cfg; // Macro no Global var
_timeDelVehinMrkSp = DA3F_Cfg(getNumber,"DA3F_MaxTimeDelVeh");
_exit = false;
{
	if (_x isEqualTo -1) then {_exit = true};
}forEach [_selectveh,_selectCat,_selectMrk];

if (_exit) exitWith {hint "Rempliser tous les champs"};

	_veh = _Data select 0;
	_PriceAchat = _Data select 1;
	_PriceVente = _Data select 2;
	_Devise 	= _Data select 3;
    _mrk = (_arrayMrkSp select _selectMrk) select 0;
    _Infomrk = (_arrayMrkSp select _selectMrk) select 1;
    _pos = getMarkerPos _mrk;
			switch (_devise) do {
			    case "€": {
					if (DA3F_Cash < _PriceAchat) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _PriceAchat),_devise]]call DA3F_fnc_hint};
				//[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				DA3F_Cash = DA3F_Cash - _PriceAchat;
			    };

			    case "£": {
					if (DA3F_WCash < _PriceAchat) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_WCash - _PriceAchat),_devise]]call DA3F_fnc_hint};
				//[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				DA3F_WCash = DA3F_WCash - _PriceAchat;
			    };
			};

			if (_Infomrk isEqualTo "") then {
				_Infomrk = "Aucune info"
			};

		[1,format ["%1 <br/> %2",markerText _mrk, _Infomrk]]call DA3F_fnc_hint;
			_actualPos = [(_pos select 0),(_pos select 1),0.2];

		if (_selectInVeh isEqualTo 1) then
			[{
				if !(_veh isKindOf "Air") then [{
						_ValideSP = [_actualPos]call DA3F_fnc_NearVeh;
						if (_ValideSP) then {
							_vehsp = createVehicle [_veh,_actualPos,[],0,"FLY"];
						};
					},{
						_vehsp = createVehicle [_veh,_actualPos,[],0,"FLY"];
					}];

						_vehsp allowDamage false;
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
			    _ValideSP = [_actualPos]call DA3F_fnc_NearVeh;
					if (_ValideSP) then {
							_vehsp = createVehicle [_veh,_actualPos,[],0,"None"];
							_vehsp allowDamage false;
					};
			}];
			if (isNil "_vehsp") exitWith {};
		_plak = format ["%1 %2%3 %4",
		round(random 1000),
		selectRandom["A","B","C","D","E","Z","X","Y","M","T","V","K","P"],
		selectRandom["F","G","H","I","J","Z","X","Y","M","T","V","K","P"],
		round(random 99)];

		_infos 		= [(getPlayerUID player),(name player),_plak];
		_invVirt 	= Veh_Cfg(getNumber,(typeOf _vehsp),"ItemVirtSpace");
		_TypeCarbu 	= Veh_Cfg(getText,(typeOf _vehsp),"Carburant");

		_vehsp setVariable ["DA3F_ID_Veh",[_invVirt,_TypeCarbu],true];
		_vehsp setVariable ["DA3F_VehInfo",_infos,true];
		_vehsp setVariable ["DA3F_InvVirtVeh",[[],0],true];

		_classVeh	=  ClassVeh(_veh);
		_side = switch (playerSide) do {case independent: {"Indep"};case west: {"west"};};
	if ((getPlayerUID player) in DA3F_Admin && _debug) then
		{
			[0,format ["%1 %2 %3 %4 %5 %6",(getPlayerUID player),_side,_classVeh,_veh,-1,_plak ]]call DA3F_fnc_hint;
		};
		_plak = str _plak;
			[(getPlayerUID player),_side,_classVeh,_veh,-1,_plak] remoteExecCall ["DB_fnc_insertVehicle",2];
		[false] call DA3F_fnc_SaveStats;
/*
		_vehsp addEventHandler ["Killed",{
		params
		[
    		["_veh",objNull,[objNull]],
    		["_killer",objNull,[objNull]]
		];

_infos = _veh getVariable "DA3F_VehInfo";
_uid 		= _infos select 0;
_proprio 	= _infos select 1;
_plak 		= _infos select 2;
[_uid,_plak] remoteExecCall ["DA3F_fnc_vehicleDelete",2];
}];
*/
		sleep 1;
		_vehsp allowDamage true;
		clearWeaponCargoGlobal _vehsp;
		clearMagazineCargoGlobal _vehsp;
		clearItemCargoGlobal _vehsp;
		clearBackpackCargoGlobal _vehsp;

			_vehsp addEventHandler ["GetIn",{
					_this spawn{
					//hint format ["%1  %2  %3 ", typeOf (_this select 0), _this select 1, _this select 2];
					_className 	= typeOf (_this select 0);
					_unit 		= (_this select 2);
					_typeVeh	= ClassVeh(_className);
					_exit 		= false;

					if (_typeVeh isEqualTo "Air") then {
						if ((_this select 1) isEqualTo "driver" && !DA3F_Sp_Pilote) then {
							_exit 		= true;
					//	[1,"Tu n'est pas pilote"]call DA3F_fnc_hint;
						};
					};
					if (_exit) exitWith {
						[1,format["%1<br/>Tu n'est pas pilote",name _unit]]call DA3F_fnc_hint;
						(driver (_this select 0)) action ["getout", (_this select 0)];
						};
					};
				}];
	closeDialog 0;
};