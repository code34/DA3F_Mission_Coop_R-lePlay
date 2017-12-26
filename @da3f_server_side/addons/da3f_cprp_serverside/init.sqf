#include "script_macros.hpp"
/*
*    File: init.sqf
*    Author: Bryan "Tonic" Boardwine
*
*    Edit: Nanou for HeadlessClient optimization.
*    Edit: [DA3F] Aroun for mission coop.
*    extrait de life server pour que ma mission soit connecté à une bdd (gros ménage de printemps)
*    extracted from life server so that my mission is connected to a database
*
*/
private ["_timeStamp","_extDBNotLoaded"];

tf_radio_channel_name = "Live Twitch TFRActif";  // Nom du Channel TeamSpeak
tf_radio_channel_password = "mcfgaming"; // Mot de passe du channel TeamSpeak

publicVariable "tf_radio_channel_name";
publicVariable "tf_radio_channel_password";

DB_Async_Active = false;
DB_Async_ExtraLock = false;
DA3F_CoopRp_server_isReady = false;
_extDBNotLoaded = "";
serv_sv_use = [];
publicVariable "DA3F_CoopRp_server_isReady";
/*
    Prepare extDB before starting the initialization process
    for the server.
*/

if (isNil {uiNamespace getVariable "DA3F_CpRp_sql_id"}) then {
    DA3F_CpRp_sql_id = round(random(9999));
    CONSTVAR(DA3F_CpRp_sql_id);
    uiNamespace setVariable ["DA3F_CpRp_sql_id",DA3F_CpRp_sql_id];
        try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(DA3F_CpRp_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    DA3F_CpRp_sql_id = uiNamespace getVariable "DA3F_CpRp_sql_id";
    CONSTVAR(DA3F_CpRp_sql_id);
    diag_log "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    life_server_extDB_notLoaded = true;
    publicVariable "life_server_extDB_notLoaded";
};
life_server_extDB_notLoaded = false;
publicVariable "life_server_extDB_notLoaded";

/* Run stored procedures for SQL side cleanup */
["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------- Starting Mission Template Server Init ------------------------------";
diag_log "------------------------------------------ Version 0.0.1 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
/*
if (LIFE_SETTINGS(getNumber,"save_civilian_position_restart") isEqualTo 1) then {
    [] spawn {
        _query = "UPDATE players SET civ_alive = '0' WHERE civ_alive = '1'";
        [_query,1] call DB_fnc_asyncCall;
    };
};
*/

[8,true,12] execFSM "\da3f_cprp_serverside\FSM\timeModule.fsm";


CONST(JxMxE_PublishVehicle,"false");
/* Setup radio channels for west/independent/civilian */
//life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
// life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
//  life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];


/* Event handler for disconnecting players */
/*
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
*/
DA3F_CoopRp_server_isReady = true;
publicVariable "DA3F_CoopRp_server_isReady";
call DA3F_fnc_cleanMap;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Mission Template Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
