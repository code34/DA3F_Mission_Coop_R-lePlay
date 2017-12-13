/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Save_Update.sqf
*       Envoi de la requête au serveur
*
*/
private ["_uid","_unit","_name","_money","_bank","_alias","_query","_queryResult"];
_uid 		= _this select 0;
_cash 		= _this select 1;
_bank 		= _this select 2;
_spe_L		= _this select 3;
_invVirt 	= _this select 4;
_invUnit 	= _this select 5;
_stats 		= _this select 6;

/*
_query = format ["SELECT pid, name, cash, bankacc, aliases, spec, inv_virt, inv_unit, stats FROM players WHERE pid='%1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;
*/

	_spe_L 	= [_spe_L] call DB_fnc_mresArray;
	_invVirt= [_invVirt] call DB_fnc_mresArray;
	_invUnit= [_invUnit] call DB_fnc_mresArray;
	_stats 	= [_stats] call DB_fnc_mresArray;

	_money 	= [_money] call DB_fnc_numberSafe;
	_bank 	= [_bank] call DB_fnc_numberSafe;

	_query = format["UPDATE players SET cash='%2', bankacc='%3', spec='%4', inv_virt='%5', inv_unit='%6', stats='%7' WHERE pid='%1'",_uid,_cash,_bank,_spe_L,_invVirt,_invUnit,_stats];
	_queryResult = [_query,1] call DB_fnc_asyncCall;

diag_log format [" #SAVE retour CpRp :( query : %1 ) [ID : %2 '%3']", _queryResult,_uid,_name];