/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       configuration.sqf
*
*/
#include "..\DA3F_macros.hpp"
/*
	Variables mission
*/
private ["_cash","_bank","_bouf","_soif"];

_cash 		= DA3F_Cfg(getNumber,"DA3F_Cash_Start");
_bank 		= DA3F_Cfg(getNumber,"DA3F_Bank_Start");
_Wcash 		= DA3F_Cfg(getNumber,"DA3F_WCash");
_bouf 		= DA3F_Cfg(getNumber,"DA3F_Bouf_Start");
_soif 		= DA3F_Cfg(getNumber,"DA3F_Soif_Start");
DA3F_Active_debug	= true; // affichage debug en hint + log
DA3F_IsAction 		= false;
DA3F_Stop_Action 	= false;
DA3F_IsRespawn 		= false;
DA3F_Cam_IsActive 	= false;
DA3F_Save_IsActive	= false;
MCF_CountShoot 		= 0;
DA3F_Save_Pos		= [];
DA3F_TimeNewCo 		= 10;
DA3F_RespawnTime	= 0;
DA3F_Items_Inv		= 0;
DA3F_Max_Items_Inv	= 100;
DA3F_Cash 			= _cash;
DA3F_WCash 			= _Wcash;
DA3F_Bank 			= _bank;
DA3F_Faim 			= _bouf;
DA3F_Soif 			= _soif;
CountKillUnits 		= 0;
player setVariable ["DA3F_IsLoadActiv",true,false];
player setVariable ["DA3F_Save_Msg",[],true];
player setVariable ["DA3F_DB_Pos",[],false];
player setVariable ["DA3F_Mdp_Co","1234",false];
player setVariable ["DA3F_New_Co",false,false];
player setVariable ["DA3F_InvVirt",[[],0],false];
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// Exemple d'une license : DA3F_Sp_Pilote
// Attribué une license : DA3F_Sp_Pilote = true

{
    _varName = getText(_x >> "var");
    missionNamespace setVariable [format ["DA3F_Sp_%1",_varName],false];
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Spe"));

{
    missionNamespace setVariable [format ["DA3F_Item_%1",(configName _x)],0];
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));
//[]call DA3F_fnc_init_Units;
[]spawn DA3F_fnc_emptyFuel;
DA3F_IsInitialisation = true;
[]execVM "DA3F\Units\init_Unit.sqf";

DA3F_Admin=
	[
		"76561198083277485",
		"Uid_2"
	];