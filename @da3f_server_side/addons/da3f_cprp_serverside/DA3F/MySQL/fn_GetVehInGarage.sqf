/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_GetVehInGarage.sqf
*       Mise au garage du véhicule
*/
/*
SELECT `classname`, `plak`, `fuel`, `damage` FROM `vehicles` WHERE pid='76561198083277485' AND active='1'

SELECT `classname`, `plak`, `fuel`, `damage` FROM `vehicles` WHERE pid='76561198083277485' AND active='1' AND  side='Indep' AND  type='Car'
*/
_swit = _this select 0;
switch (_swit) do {
    case 0: {
		_uid    = _this select 1;
		_unit   = _this select 2;
		_side   = _this select 3;
		_type   = _this select 4;
		_mrk	= _this select 5;
		_query = format ["SELECT classname, plak, fuel, damage, inventory FROM vehicles WHERE side='%1' AND active='0' AND pid='%2' AND type='%3'",_side,_uid,_type];

		_queryResult = [_query,2,true] call DB_fnc_asyncCall;
		/*
		_new = [(_queryResult select 3)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[3,_new];
		*/
		/*
		_new = [(_queryResult select 3)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_queryResult set[3,_new];
		*/
		diag_log "**************************************************";
		diag_log "***************** DA3F - Garage ******************";
		diag_log format["uid : (%1) | unité : (%2) | type : (%3) | side : (%4) | queryResult : [%5] ",_uid,_unit,_type,_side,_queryResult];
		diag_log "**************************************************";
	//	_msg = format ["Comme un petit problème de garage...", nil];
	//	_msg remoteExec ["hint"];
	{
		_new = [(_x select 3)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_x set[3,_new];

		_new = [(_x select 4)] call DB_fnc_mresToArray;
		if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
		_x set[4,_new];
	} forEach _queryResult;
		[_queryResult,_mrk] remoteExecCall ["DA3F_fnc_GetMyVehGarage",_unit];
    };
    case 1: {
		_uid    = _this select 1;
		_unit   = _this select 2;
		_side   = _this select 3;
		_type   = _this select 4;
		_plak   = _this select 5;
		_query = format ["UPDATE vehicles SET active='1' WHERE pid='%2' AND plak='""%4""'",_side,_uid,_type,_plak];

		_queryResult = [_query,1] call DB_fnc_asyncCall;
	//	_msg = format ["%1 - %2",_unit, _plak];
	//	_msg remoteExec ["hint"];
    };
};