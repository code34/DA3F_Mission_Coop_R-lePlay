/*
*
*    File: fn_cleanMap.sqf
*    Original Author: Bryan "Tonic" Boardwine
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_cleanMap.sqf
*		(envoi info serv/delete vehicle)
*		Clean vehicle only
*
*/
[]spawn
{
	while {true} do {
	    sleep (10*60);
	    {
	    _deleted 	= false;
	    _deletedBdd = false;
        _veh 		= _x;
        _infos 		= _veh getVariable "DA3F_VehInfo";
		_uid        = _infos select 0;
		_proprio    = _infos select 1;
		_plak       = _infos select 2;
        _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

        if (_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
        _units = {(_x distance _veh < 1500)} count playableUnits;
        _dmg = damage _veh;
        _fuel = fuel _veh;
            if (count crew _x isEqualTo 0) then
            {
                switch (true) do
                {
                    case (_dmg > 0.97) : {deleteVehicle _x; _deletedBdd = true;};
                    case ((_x getHitPointDamage "HitEngine") > 0.7 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
                    case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
                    case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
                    case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
                    case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
                    case (_units isEqualTo 0): {deleteVehicle _x; _deleted = true;};
                };
            };

		        if (_deleted) then {
		            waitUntil {isNull _veh};
		            _deleted = false;
		        };

		        if (_deletedBdd) then
		        [{
			    	_deletedBdd = false;
		            _query = format ["UPDATE vehicles SET active='0', alive='0' WHERE pid='%1' AND plak='""%2""'",_uid,_plak];
		            [_query,1] call DB_fnc_asyncCall;
		    	},{
		            if (isNull _veh) then {
		                if !(isNil "_infos") then {
			    			[_uid,_dmg,_fuel,_plak] remoteExecCall ["DB_fnc_UpdateVehicle",2];
		                };
		            };
		    	}];
	    	};
	    } forEach vehicles;
	};
};
