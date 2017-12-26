/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_RespawnUnit.sqf
*       Création de la nouvelle entité
*
*/
player setVariable ["Revive",nil,false];
DA3F_CamKilled cameraEffect ["TERMINATE","BACK"];
camDestroy DA3F_CamKilled;
DA3F_IsRespawn = false;
player switchMove "";
DA3F_corpse spawn {
[1,"Vous avez 5 min pour retrouver votre corps"] call DA3F_fnc_hint;
_TimeDel   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Time_DelCorps");
	sleep (_TimeDel*60);
DA3F_corpse setVariable ["Revive",nil,false];
	deleteVehicle _this;
};