/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_BackLobby.sqf
*
*/
[]spawn {
if (isNil "DA3F_RageQuit") then {
	DA3F_RageQuit = false;
};
if (DA3F_RageQuit) exitWith {};
	DA3F_RageQuit = true;
[2,"Vous avez choisi de revenir au lobby. veuillez patienter..."]call DA3F_fnc_hint;
call DA3F_fnc_SaveStats;
sleep 3;
closeDialog 0;
endMission "BackLobby";
DA3F_RageQuit = false;
};