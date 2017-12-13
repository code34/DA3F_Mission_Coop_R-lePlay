/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_result.sqf
*		Retour des infos de connexion
*
*/
_this spawn {
hint str _this;
disableSerialization;
private["_uid","_name","_cash","_bank","_Alias","_specialisation","_invVirt","_invUnit","_stats","_bouf","_soif","_dmg","_cntKill"];
if (str _this isEqualTo "true") then [{

	[]call DA3F_fnc_SetupAction;
	[]call DA3F_fnc_SetStats;

	[] call DA3F_fnc_SpawnStartMenu;
	[] call DA3F_fnc_statusBar;


	player addEventHandler["Killed", {_this call DA3F_fnc_onPlayerKilled}];
	player addEventHandler["Respawn", {_this call DA3F_fnc_onPlayerRespawn}];

	[]spawn
	{
	    waitUntil {!(IsNull (findDisplay 46))};
	    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DA3F_fnc_KeyBoard"];
	};


},{
	_uid 		= _this select 0;
	_name 		= _this select 1;
	_cash 		= _this select 2;
	_bank 		= _this select 3;
	_Alias 		= _this select 4;
	_spe_L		= _this select 5;
	_invVirt 	= _this select 6;
	_invUnit 	= _this select 7;
	_stats 		= _this select 8;
		_bouf 		= _stats select 0;
		_soif 		= _stats select 1;
		_dmg 		= _stats select 2;
		_cntKill	= _stats select 3;
	_ret = format ["
	_uid = %1\n
	_name = %2\n
	_cash = %3\n
	_bank = %4\n
	_Alias = %5\n
	_spe_L = %6\n
	_invVirt = %7\n
	_invUnit = %8\n
	_stats = %9",_uid,_name,_cash,_bank,_Alias,_spe_L,_invVirt,_invUnit,_stats];
	//hint _ret;
	DA3F_Cash = _cash;
	DA3F_Bank = _bank;
	DA3F_Faim = _bouf;
	DA3F_Soif = _soif;
	CountKillUnits = _cntKill;
	player setDamage _dmg;
	//copyToClipboard str _ret;
	[]call DA3F_fnc_SetupAction;
	[]call DA3F_fnc_SetStats;

	[] call DA3F_fnc_SpawnStartMenu;
	[] call DA3F_fnc_statusBar;

{
    missionNamespace setVariable [format ["DA3F_Sp_%1",_x],true];
} forEach _spe_L;

{
	_item = _x select 0;
	_nrb = _x select 1;
    missionNamespace setVariable [format ["DA3F_Item_%1",_item],_nrb];
} forEach _invVirt;

	player addEventHandler["Killed", {_this call DA3F_fnc_onPlayerKilled}];
	player addEventHandler["Respawn", {_this call DA3F_fnc_onPlayerRespawn}];

	[]spawn
	{
	    waitUntil {!(IsNull (findDisplay 46))};
	    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DA3F_fnc_KeyBoard"];
	};

	}];
	cutText ["","BLACK"];
	[]spawn DA3F_fnc_AddActionToBase;
};