/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_UpdateVehicle.sqf
*       Mise au garage du véhicule
*/

_uid    = _this select 0;
_dmg    = _this select 1;
_fuel   = _this select 2;
_plak   = _this select 3;
_invVir = _this select 4;
_dmg 	= [_dmg] call DB_fnc_mresArray;
_invVir = [_invVir] call DB_fnc_mresArray;
if (_uid isEqualTo "") exitWith {};
_query = format ["UPDATE vehicles SET active='0', damage='%2', fuel='%3', inventory='%5' WHERE pid='%1' AND plak='""%4""'",_uid,_dmg,_fuel,_plak,_invVir];

[_query,1] call DB_fnc_asyncCall;