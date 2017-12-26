/*
*       File: fn_ClearZone.sqf
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*
*/

	_mrk 		= (_this select 0);
	_clearAll 	= (_this select 1);
	_stock 		= (_this select 2);
	_radius		= (_this select 3);
	_forced		= (_this select 4);
	if (isNil "_radius") then {_radius = 850;};
	if (isNil "_forced") then {_forced = false;};

	waitUntil
	{
		_units		= {alive _x && _x distance getMarkerPos _mrk < _radius} count playableUnits;
		if !(_forced) then {
			sleep (30 + (random 30));
		};
		(_units isEqualTo 0)
		or
		_forced
	};
			deleteMarker _mrk;
			{
			if (isNil{_x getVariable "DA3F_Save_Me_Please"}) then {
				deleteVehicle _x;
			};
			} forEach _clearAll;

			{
			if (isNil{_x getVariable "DA3F_Save_Me_Please"}) then {
				deleteVehicle _x;
			};
			} forEach (nearestObjects [(_stock select 0),["car","tank","air","test_EmptyObjectForFireBig"],450]);

			{
				if (_x distance (_stock select 0) < 450) then
				{
					if (isnil{_x getVariable "Revive"}) then
					{
						deleteVehicle _x;
					};
				};
			} forEach allDead;