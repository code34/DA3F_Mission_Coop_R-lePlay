/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       init_Units.sqf
*       Initialisation des variables du joueur
*		Attend la fin du chargement du serverSide
*
*/

private ["_cash","_bank","_bouf","_soif"];
	waitUntil {DA3F_CoopRp_server_isReady}; // server side load !

[getPlayerUID player,player,name player,DA3F_Cash,DA3F_Bank]remoteExecCall ["DA3F_fnc_request",2];

diag_log "*********************DA3F CoopRp**************************";
diag_log "*****************Initialisation Client********************";
diag_log "************************Succès****************************";
diag_log "**********************************************************";