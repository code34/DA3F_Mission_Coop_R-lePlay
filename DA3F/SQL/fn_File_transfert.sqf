/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       init_Units.sqf
*       Initialisation des variables des joueurs
*
*		Réinitialiser les valeurs (remise à 0 des stats) :
*		profileNamespace setVariable ["DA3F_Stats",nil];
*		A éxecuter au lancement puis reboot et la retirer
*		ou
*		en console
*
*/
private ["_Stats","_faim","_soif","_Damg","_Cash","_CountKill","_magazines","_magazineClass","_fatigue"];
_fatigue   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_FatigueActive");
if (_fatigue isEqualTo 0) then {
	player enableFatigue false;
    player allowSprint true;
};
_Stats = profileNamespace getVariable "DA3F_Stats";
if (isNil "_Stats") then {
		systemChat "1ère connexion... Initialisation...";

		profileNamespace setVariable ["DA3F_Stats",[[100,100,0],[0,0,0],["U_I_C_Soldier_Bandit_3_F","V_Chestrig_khk",""],[[],[]]]];
		_Stats = profileNamespace getVariable "DA3F_Stats";

diag_log "**********************************************************";
diag_log "*****************Initialisation Client********************";
diag_log "*********************1ere connexion***********************";
diag_log "************************Succès****************************";
diag_log "**********************************************************";

};
private _VehUnit = (profileNamespace getVariable "DA3F_My_Vehicle");
if !(isNil "_VehUnit") then {
		missionNamespace setVariable ["DA3F_GarageUnit",_VehUnit];
};
private _Spe_Inv = (profileNamespace getVariable "DA3F_Inv_Spe");
	if !(isNil "_Spe_Inv") then
		[{
				_all_SpeUnit = _Spe_Inv select 0;
				_all_itemsInv = _Spe_Inv select 1;
		// Load Spe
		if !(str _all_SpeUnit isEqualTo "[]") then {
				{
					missionNamespace setVariable [format ["DA3F_Sp_%1",_x],true];
				} forEach _all_SpeUnit;
			};
		// Load Items
		if !(str _all_itemsInv isEqualTo "[]") then {
				{
				    missionNamespace setVariable [format ["DA3F_Item_%1",(_x select 0)],(_x select 1)];
				} forEach _all_itemsInv;
			};
	},{
		profileNamespace setVariable ["DA3F_Inv_Spe",[[],[]]];
	}];

player addEventHandler["Killed", {_this call DA3F_fnc_onPlayerKilled}];
player addEventHandler["Respawn", {_this call DA3F_fnc_onPlayerRespawn}];
_faim = (_Stats select 0) select 0;
_soif = (_Stats select 0) select 1;
_Damg = (_Stats select 0) select 2;

_Cash 		= (_Stats select 1) select 0;
_Bank 		= (_Stats select 1) select 1;
_CountKill 	= (_Stats select 1) select 2;

_uniform 	= (_Stats select 2) select 0;
_vest 		= (_Stats select 2) select 1;
_sac 		= (_Stats select 2) select 2;

_weapons	= ((_Stats select 3)select 0);
_magazines	= ((_Stats select 3)select 1);
_items		= ((_Stats select 3)select 2);

if (isNil "_weapons") then {
	_weapons= [];
};

if (isNil "_items") then {
	_items= [];
};

if (isNil "_magazines") then {
	_magazines= [];
};


if !(_uniform isEqualTo "") then {
	player forceAddUniform _uniform
};
if !(_vest isEqualTo "") then {
	player addVest _vest
};

if !(_sac isEqualTo "") then {
	player addBackpack _sac
};

if !(str _weapons isEqualTo "[]") then {
	{
		player addWeapon _x
	} forEach _weapons;
};
/*
if !(str _items isEqualTo "[]") then {
	{
		if !((vest player) isEqualTo "") then [{
			player addItemToVest _x
		},{
		player addItem _x
	}];
	} forEach _items;
};
*/
if !(str _magazines isEqualTo '[]') then [{
	{
		player addMagazine _x
	} forEach _magazines;

},{
	_magazines = getArray (configFile / "CfgWeapons" / (currentWeapon player) / "magazines");
	_magazineClass = _magazines call bis_fnc_selectRandom;
		for "_i" from 0 to (ceil random 6) do
			{
		 if (isNil "_magazineClass") exitWith {};
		 	if ((vest player) isEqualTo "") then [{
		 		player addItemToUniform _magazineClass;
		 	},{
			  player addItemToVest _magazineClass;
		 }];
	};
}];

DA3F_Faim = _faim;
DA3F_Soif = _soif;
DA3F_Cash = _Cash;
DA3F_Bank = _Bank;
	if (DA3F_Soif > 100) then {DA3F_Soif = 100;};
	if (DA3F_Faim > 100) then {DA3F_Faim = 100;};
	if (DA3F_Soif < 0) then {DA3F_Soif = 0;};
	if (DA3F_Faim < 0) then {DA3F_Faim = 0;};
player setDamage _Damg;
CountKillUnits 		= _CountKill;
[]call DA3F_fnc_SetupAction;
[]call DA3F_fnc_SetStats;
DA3F_IsInitialisation = true;

[]call DA3F_fnc_statusBar;

[] call DA3F_fnc_SpawnStartMenu;
[]spawn
{
    waitUntil {!(IsNull (findDisplay 46))};
    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DA3F_fnc_KeyBoard"];
};
diag_log "**********************************************************";
diag_log "*****************Initialisation Client********************";
diag_log "************************Succès****************************";
diag_log "**********************************************************";