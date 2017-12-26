/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Help_Me.sqf
*		Message aux allies indiquant la position du corps
*
*/
disableSerialization;
((findDisplay 1811172)displayCtrl 2400) ctrlShow false; // No spam (Plus de touche plus de SPAM ! )
[1,format["%1<br/>est en difficulté en position :<br/>%2",name player,mapGridPosition (getPos DA3F_corpse)]]remoteExecCall ["DA3F_fnc_hint",independent];
[0,format["%1 est en difficulté en position : %2",name player,mapGridPosition (getPos DA3F_corpse)]]remoteExecCall ["DA3F_fnc_hint",independent];
DA3F_RespawnTime = DA3F_RespawnTime + 20;
[]spawn {
    sleep 30;
    ((findDisplay 1811172)displayCtrl 2400) ctrlShow true;
};