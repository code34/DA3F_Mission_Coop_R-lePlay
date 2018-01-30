/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_hint.sqf
*       Message player
*
*/
    {
        if (_x animationPhase "Door_1_rot" isEqualTo 1 or _x animationPhase "Door_2_rot" isEqualTo 1) then {

            if ((count (nearestObjects [getPos _x,["car","air"],6]))>0) then [{
            [1,"Fermeture de la barrière impossible"]call DA3F_fnc_hint;
            },{
                _x animate ["Door_1_rot", 0];
                _x animate ["Door_2_rot", 0];
            }];
        }
        else
        {
                _x animate ["Door_1_rot",1];
                _x animate ["Door_2_rot",1];
        };
    }forEach (nearestObjects [player, ["Land_BarGate_F","Land_Net_Fence_Gate_F"], 30]);
