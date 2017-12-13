/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_request.sqf
*       Envoi de la requête au serveur
*
*/
private ["_uid","_unit","_name","_money","_bank","_alias","_query","_queryResult"];
_uid 	= _this select 0;
_unit 	= _this select 1;
_name 	= _this select 2;
_money 	= _this select 3;
_bank 	= _this select 4;
_query = format ["SELECT pid, name, cash, bankacc, aliases, spec, inv_virt, inv_unit, stats FROM players WHERE pid='%1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;
		diag_log format [" 1/2 retour CpRp :( query : %1 ) [name : %2]", _queryResult,_name];

if (isNil "_queryResult" || str _queryResult isEqualTo "[]") then
	[{
	_name 	= [_name] call DB_fnc_mresString; //Clense the name of bad chars.
	_alias 	= [[_name]] call DB_fnc_mresArray;
	_money 	= [_money] call DB_fnc_numberSafe;
	_bank 	= [_bank] call DB_fnc_numberSafe;
		_query = format ["INSERT INTO players (pid, name, cash, bankacc, aliases, spec, 	inv_virt, inv_unit, stats) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[100,100,0,0]""')",
		    _uid,
		    _name,
		    _money,
		    _bank,
		    _alias
		];
		_queryResult = [_query,1] call DB_fnc_asyncCall;
		_queryResult remoteExecCall ["DA3F_fnc_result",_unit];
	},{
		// spec
		/*
		_tmp = _queryResult select 2;
		_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
		_tmp = _queryResult select 3;
		_queryResult set[3,[_tmp] call DB_fnc_numberSafe];
		*/
		_new = [(_queryResult select 5)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[5,_new];
		// inv virtuel
		_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[6,_new];
		// inv unit
		_new = [(_queryResult select 7)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[7,_new];
		// stats
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[8,_new];

	_queryResult remoteExecCall ["DA3F_fnc_result",_unit];
	_queryResult = [_query,1] call DB_fnc_asyncCall;

	}];

		diag_log format [" 2/2 retour CpRp :( query : %1 ) [uid : %2]", _queryResult,_uid];
