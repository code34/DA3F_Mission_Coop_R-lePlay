/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SaveUnit.sqf
*
*/
    _confirme = ["<t color='#F44100' size='1.1' align='Center' >Souhaites-tu vraiment sauvegarder ??<t/>","Confirmation de Sauvegarde","Save","Annuler"]call bis_fnc_GUImessage;
        if (_confirme) then
            [{
                closeDialog 0;
            if !(DA3F_Save_IsActive) then
                [{
                    DA3F_Save_IsActive = true;
                    _y = call DA3F_fnc_Cnt_Items_Spe;
                    _spe_L = _y select 0;
                    _invVirt = _y select 1;
[(getPlayerUID player),DA3F_Cash,DA3F_Bank,_spe_L,_invVirt,[],[DA3F_Faim,DA3F_Soif,(Damage player),CountKillUnits]]remoteExecCall ["DA3F_fnc_Save_Update",2];
                    [1,"Sauvegarde de vos données"]call DA3F_fnc_hint;
                    []spawn
                        {
                            sleep (5*60);
                            DA3F_Save_IsActive = false;
                            [0,"sauvegarde disponible"]call DA3F_fnc_hint
                        };
                },{
                    [1,"sauvegarde possible toute les 5min"]call DA3F_fnc_hint;
                }];
            },{
                [1,"Sauvegarde annulé"]call DA3F_fnc_hint;
                closeDialog 0;
            }];