/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SaveStats.sqf
*       Save des stats du joueurs
*
*/
private ["_Stats","_name_mission","_dam","_unif","_vest","_bag","_allWeapons","_mags"];
_showMsg = _this select 0;
_name_mission = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
if (DA3F_Save_IsActive) exitWith {}; // [1,"sauvegarde possible toute les 5min"]call DA3F_fnc_hint
	DA3F_Save_IsActive = true;
	[]spawn {sleep (5*60);DA3F_Save_IsActive = false;[0,"sauvegarde disponible"]call DA3F_fnc_hint};
		_dam 		= (damage player);
		_unif 		= uniform player;
		_vest 		= vest player;
		_bag 		= backpack player;
		_allWeapons = weapons player;
		_mags 		= magazines player;
		_items		= ((items player) + (assignedItems player));
		_Inv_Spe	= call DA3F_fnc_Cnt_Items_Spe;
	//	hint format ["%1", _Inv_Spe];
		if (isNil "DA3F_GarageUnit") then
			[{
				profileNamespace setVariable ["DA3F_My_Vehicle",[]];
			},{
				profileNamespace setVariable ["DA3F_My_Vehicle",DA3F_GarageUnit];
			}];
		profileNamespace setVariable ["DA3F_Inv_Spe",_Inv_Spe];
		profileNamespace setVariable ["DA3F_Stats",[[DA3F_Faim,DA3F_Soif,_dam],[DA3F_Cash,DA3F_Bank,CountKillUnits],[_unif,_vest,_bag],[_allWeapons,_mags,_items]]];

		if (isNil "_showMsg") then {
			systemChat format ["%1 : %2 sauvegarde de vos informations",_name_mission, name player];
		};