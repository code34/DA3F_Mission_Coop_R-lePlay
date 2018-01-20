/*
*
*       Dev'Arma 3 France
*       Mission Template
*		Bryan "Tonic" Boardwine /  [DA3F] Aroun Le BriCodeur
*       fn_onPlayerRespawn.sqf
*       Respawn du player réinitialisation des variable
*
*/
private ["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
DA3F_corpse = _corpse;

_unit addRating 1e12; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "AmovPpneMstpSrasWrflDnon";
DA3F_corpse setVariable ["Revive",false,true];

DA3F_Faim = 100;
DA3F_Soif = 100;
DA3F_Cash = 0;
DA3F_IsAction = false;
DA3F_Stop_Action = false;
MCF_CountShoot = 0;

if (player getVariable "DA3F_IsLoadActiv") then {
	[player, [missionNamespace, "DA3F_InvUnit"]] call BIS_fnc_loadInventory;
};
if (!(uiNamespace getVariable "MCFStatusBar")) then {
	[]spawn DA3F_fnc_statusBar;
};

[]call DA3F_fnc_SetupAction;
	execVM "DA3F\functions\DA3F_particules.sqf";
player addRating -6000;