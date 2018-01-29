/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_EscoPNJ_Menotte.sqf
*		Menottage pour PNJ
*
*/

	params
	[
		["_unit",objNull,[objNull]],
		["_otage",objNull,[objNull]],
		["_bool",false,[false]]
	];

		if (isNull _unit || isNull _otage) exitWith {};
			_unit setVariable ["DA3F_Get_Otage",_otage,false];
			_otage setVariable ["DA3F_Get_Bourreau",_unit,true];

		if (_bool) then [{
		_otage switchMove "AmovPercMstpSsurWnonDnon";
		_otage setVariable ["DA3F_isAttached",true,true];
	},{
		_otage switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
		_otage setVariable ["DA3F_isAttached",false,true];
}];