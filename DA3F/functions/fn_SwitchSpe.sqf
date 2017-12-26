/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_SwitchSpe.sqf
*       ["Pilote",true]call DA3F_fnc_SwitchSpe;
*		// Utilisez cette action pour donner/retirer une spe.
*		Arguments :
*	       [SCALAR,STRING,BOOLEAN] remoteExec ["DA3F_fnc_ActTarget",Target];
*		Exemples :
*	       [1,Name spécialisation,true/false] remoteExec ["DA3F_fnc_ActTarget",player];
*	       [1,"Pilote",true] remoteExec ["DA3F_fnc_ActTarget",player];
*/
_spe    = _this select 0;
_bool   = _this select 1;
missionNamespace setVariable [format ["DA3F_Sp_%1",_spe],_bool];