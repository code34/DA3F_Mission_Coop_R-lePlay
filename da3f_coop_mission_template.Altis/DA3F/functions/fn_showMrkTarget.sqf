/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_showMrkTarget.sqf
*
*/
_this spawn
    {
        _Mrk    = (_this select 0);
        _cible  = (_this select 1);
        if (isNull _cible) exitWith {[1,format ["Aucune cible active", _cible]]call DA3F_fnc_hint;};
            if (isNil "_cible") exitWith {[1,format ["Aucune cible active", _cible]]call DA3F_fnc_hint;};
        [1,format ["Localisation de  : %1", _cible]]call DA3F_fnc_hint;
        _Mrk setMarkerType "mil_dot";
        _Mrk setMarkerColor "ColorEast";
        _mrk setMarkerText format ["%1", _cible];
        mapAnimAdd [1, 0.1, markerPos _Mrk  ];
        mapAnimCommit;
        sleep 5;
        _mrk setMarkerType "Empty";
    };