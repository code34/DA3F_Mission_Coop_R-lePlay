/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_ZoneDeRadion.sqf
*		Putain si tu comprends pas avec le nom du script... Je peux plus rien pour toi...
*
*/
private ["_Array_Pos","_radius","_Pos","_unitsInZone","_units"];
    diag_log format ["Run Script Radiation", nil];
    while {true} do {
_diagT = diag_tickTime;
        sleep 10;
            "Zone rad init" remoteExecCall ["hint", -2];
    _Array_Pos  = [[3215.6,12494.5],"DA3F_Rad"];
    _radius     = 3;
    _Pos        = selectRandom(_Array_Pos);
    _unitsInZone= [];
        waitUntil {
            if ((typeName _Pos)isEqualTo "ARRAY" ) then {
                _units = {
                 if (_x distance _Pos <= _radius)then {_unitsInZone pushBack _x};
                ((alive _x) && (_x distance _Pos <= _radius))
                }count allUnits;
            };
            if ((typeName _Pos)isEqualTo "STRING" ) then {
                _units = {
                    if (_x distance getMarkerPos _Pos <= _radius)then {_unitsInZone pushBack _x};
                    ((alive _x) && ((_x distance getMarkerPos _Pos) <= _radius))
                }count allUnits;
            };
            sleep 0.5;
            (_units > 0)
        };
diag_log format ["Script Radiation :: Units in zone : %1", _unitsInZone];
        {
            if ((typeName _Pos)isEqualTo "ARRAY" ) then {
                if (_x distance _Pos <= _radius)then {_x setDamage ((damage _x) + 0.15);
                    {0 setFog [0.8, 0.8, 60];forceWeatherChange; [1,"zone active"]call DA3F_fnc_hint} remoteExecCall ["bis_fnc_call", _x];
                };
            };

            if ((typeName _Pos)isEqualTo "STRING" ) then {
                if ((_x distance getMarkerPos _Pos )<= _radius)then {_x setDamage ((damage _x) + 0.15);
                    {
                    0 setFog [0.8, 0.8, 60];forceWeatherChange; [1,"zone active"]call DA3F_fnc_hint;
                    [_x,_Pos,_radius] spawn {
                    params[["_unit",objNull,[objNull]],["_Pos","",[0,0]],["_radius",0,[0]]];
                    waitUntil {
                    1 setFog [0.8, 0.8, 60];
                    sleep 1.5;
            if ((typeName _Pos)isEqualTo "ARRAY" ) then {
                if (_x distance _Pos <= _radius)then {
                    (_unit distance _Pos > _radius)
                    };
            if ((typeName _Pos)isEqualTo "STRING" ) then {
                if ((_x distance getMarkerPos _Pos )<= _radius)then {
                    (_unit distance getMarkerPos _Pos > _radius)
                        };
                    };
                };
                } remoteExecCall ["bis_fnc_call", _x];
                };

            };
        } forEach _unitsInZone;
    //    0 setFog [0.8, 0.8, 60];
sleep 30;

diag_log format ["Script Radiation :: New loop : %1  - %2", (diag_tickTime - _diagT), time];

        {
            if ((typeName _Pos)isEqualTo "ARRAY" ) then {
                if ((_x distance _Pos) > _radius)then {{0 setFog [0, 0, 800];forceWeatherChange;} remoteExecCall ["bis_fnc_call", _x]};
            };

            if ((typeName _Pos)isEqualTo "STRING" ) then {
                if ((_x distance getMarkerPos _Pos) > _radius)then {{0 setFog [0, 0, 800];forceWeatherChange;} remoteExecCall ["bis_fnc_call", _x]};
            };
        } forEach _unitsInZone;
            "Mouvement de la zone" remoteExecCall ["hint", -2];
    };