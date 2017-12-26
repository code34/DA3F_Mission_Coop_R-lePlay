/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Pnj_Portier.sqf
*		_da3f = this call DA3F_fnc_Pnj_Portier;
*
*/
_this disableAI "move";
_this addAction ["<t color='#00FF00' size='1.2' >Ouvrir la barrière<t/>",{
{
    if (_x animationPhase "Door_1_rot" isEqualTo 1 or _x animationPhase "Door_2_rot" isEqualTo 1) then {
        _x animate ["Door_1_rot", 0];
        _x animate ["Door_2_rot", 0];
    }
    else
    {
	    if ((count (nearestObjects [getPos _x,["car","air"],8]))>0) then [{
		[1,"Fermeture de la barrière impossible"]call DA3F_fnc_hint;
	    },{
	        _x animate ["Door_1_rot",1];
	        _x animate ["Door_2_rot",1];
		}];
    };
}forEach (nearestObjects [(_this select 0), ["Land_BarGate_F","Land_Net_Fence_Gate_F"], 15]);
},"",100,true,false,"",""];