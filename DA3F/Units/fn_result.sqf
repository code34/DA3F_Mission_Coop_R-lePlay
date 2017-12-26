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
#include "..\..\DA3F_macros.hpp"
sleep 1;
//hint str _this;
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

	{
	    _class = (configName _x);
	    _varName = getText(_x >> "var");
	    _indexHiera = getNumber(_x >> "requiLvl");
		missionNamespace setVariable [format ["DA3F_Rank_%1",_varName],false];
	} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Rank"));
	player setVariable ["DA3F_Rank","Inde",true];
	DA3F_Rank_Inde = true;
},{

	_uid 		= _this select 0;
	_name 		= _this select 1;
	_cash 		= _this select 2;
	_bank 		= _this select 3;
	_GetPos		= _this select 4;
	_spe_L		= _this select 5;
	_invVirt 	= _this select 6;
	_invUnit 	= _this select 7;
	_stats 		= _this select 8;
	_AdminLvl	= _this select 9;
	_hierarchie = _this select 10;
	_wCash 		= _this select 11;
	_myMsg 		= _this select 12;

	player setVariable ["DA3F_Save_Msg",_myMsg,true];
	player setVariable ["DA3F_DB_Pos",_GetPos,false];

	{
	    _class = (configName _x);
	    _varName = getText(_x >> "var");
	    _indexHiera = getNumber(_x >> "requiLvl");
	    if (_indexHiera isEqualTo _hierarchie) then [{
		    missionNamespace setVariable [format ["DA3F_Rank_%1",_varName],true];
		    player setVariable ["DA3F_Rank",_class,true];
	    },{
		    missionNamespace setVariable [format ["DA3F_Rank_%1",_varName],false];
	}];
	} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Rank"));

		_bouf 		= _stats select 0;
		_soif 		= _stats select 1;
		_dmg 		= _stats select 2;
		_cntKill	= _stats select 3;
	_ret = format ["
	_uid = %1
	_name = %2
	_cash = %3
	_bank = %4
	_GetPos = %5
	_spe_L = %6
	((_invVirt = %7))
	_invUnit = %8
	_stats = %9
	_AdminLvl = %10
	_hierarchie = %11",_uid,_name,_cash,_bank,_GetPos,_spe_L,_invVirt,_invUnit,_stats,_AdminLvl,_hierarchie];
	//hint _ret;
	diag_log format ["**************************************************************", nil];
	diag_log format ["[DA3F Client] RETOUR BDD :: Array :: %1", _ret];
	diag_log format ["**************************************************************", nil];
		{
			diag_log format ["**************************************************************", nil];
			diag_log format ["[DA3F Client] RETOUR BDD :: Array :: %1", _ret];
			diag_log format ["**************************************************************", nil];
		} remoteExecCall ["bis_fnc_call", 2];
	DA3F_Cash 	= _cash;
	DA3F_WCash 	= _wCash;
	DA3F_Bank 	= _bank;
	DA3F_Faim 	= _bouf;
	DA3F_Soif 	= _soif;
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


	[]spawn
	{
	    waitUntil {!(IsNull (findDisplay 46))};
	    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DA3F_fnc_KeyBoard"];
	};
_Pt = 0;
_arr = [];
_invItem = (_invVirt select 0);
	if !(str _invItem isEqualTo "[]") then {
		for "_a" from 0 to (count _invItem -1) do
			{
			_item = (_invItem select _a) select 0;
			_nrb = (_invItem select _a) select 1;
			diag_log format ["***************************************",nil];
			diag_log format ["Items : %1 Value : %2", _item,_nrb];
			diag_log format ["***************************************",nil];
			[_item,_nrb,"add"]call DA3F_fnc_Add_Ret_Items;
			};
	};
	player addEventHandler["Killed", {_this call DA3F_fnc_onPlayerKilled}];
	player addEventHandler["Respawn", {_this call DA3F_fnc_onPlayerRespawn}];

	}];
	player addEventHandler ["InventoryOpened", {_this spawn DA3F_fnc_customInventory;}];
	[]spawn DA3F_fnc_AddActionToBase;
	[]spawn DA3F_fnc_NoCarbu_in_station;
};