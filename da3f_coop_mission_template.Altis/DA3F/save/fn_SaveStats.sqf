/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SaveStats.sqf
*       Save des stats du joueurs
*
*/
_forcedSave = (_this select 0);
if (isNil "_forcedSave") then {
    _forcedSave = false;
};

if (_forcedSave) exitWith {
        _y = call DA3F_fnc_Cnt_Items_Spe;
        _spe_L = _y select 0;
        _invVirt = _y select 1;
        _mymsg = player getVariable "DA3F_Save_Msg";
        _getpos = position player;
        [(getPlayerUID player),DA3F_Cash,DA3F_Bank,_spe_L,_invVirt,[],[DA3F_Faim,DA3F_Soif,(Damage player),CountKillUnits],DA3F_WCash,_mymsg,_getpos]remoteExecCall ["DA3F_fnc_Save_Update",2];
};
            if !(DA3F_Save_IsActive) then
                [{
                    DA3F_Save_IsActive = true;
                    _y = call DA3F_fnc_Cnt_Items_Spe;
                    _spe_L = _y select 0;
                    _invVirt = _y select 1;
                    _mymsg = player getVariable "DA3F_Save_Msg";
                    _getpos = position player;

                [(getPlayerUID player),DA3F_Cash,DA3F_Bank,_spe_L,_invVirt,[],[DA3F_Faim,DA3F_Soif,(Damage player),CountKillUnits],DA3F_WCash,_mymsg,_getpos]remoteExecCall ["DA3F_fnc_Save_Update",2];

                [0,format["%1 :: Sauvegarde de vos données",name player]]call DA3F_fnc_hint;

                    []spawn
                    {
                        sleep (5*60);
                        DA3F_Save_IsActive = false;
                        [0,format["%1 :: sauvegarde disponible",name player]]call DA3F_fnc_hint
                    };
                },{
                    [1,"sauvegarde possible toute les 5min"]call DA3F_fnc_hint;
                }];