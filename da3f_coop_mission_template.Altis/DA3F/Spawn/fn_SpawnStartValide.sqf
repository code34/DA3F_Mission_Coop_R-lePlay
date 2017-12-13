/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnStartValide.sqf
*       Téléportation du joueur sur le spawn sélectionné
*
*/
#include "..\..\DA3F_macros.hpp"
private ["_name_mission","_display","_sel","_text","_AllMrk","_mrk","_pos"];
_this spawn {
disableSerialization;

_name_mission 	= DA3F_Cfg(getText,"DA3F_NameMission");
_DA3F_listMrk 	= DA3F_Cfg(getText,"DA3F_Spawn");
_display        = (findDisplay 221117);
_sel            = (lbCurSel 1500);
_IsPara         = (lbCurSel 2100);
if (_sel isEqualTo -1) exitWith {[1,"Tu dois choisir une insertion"]call DA3F_fnc_hint};
_text           = ((_display)displayCtrl 1500) lbText _sel;
_text           = format ["%1<br/>%2",(_DA3F_listMrk select _sel) select 1,(_DA3F_listMrk select _sel) select 2];
_mrk            = (_DA3F_listMrk select _sel)select 0;
_radius         = (_DA3F_listMrk select _sel)select 3;
_pos            = switch (_IsPara) do {
							    case 0: {
										[((getMarkerPos _mrk)select 0) + random _radius,((getMarkerPos _mrk)select 1) + random _radius,0];
							    };
							    case 1: {
										_AltiPara       = (lbText [2101,lbCurSel 2101]);
										_AltiPara		= parseNumber _AltiPara;
										[((getMarkerPos _mrk)select 0) + random _radius,((getMarkerPos _mrk)select 1) + random _radius,_AltiPara];
									};

							    default {
										[((getMarkerPos _mrk)select 0) + random _radius,((getMarkerPos _mrk)select 1) + random _radius,0];
							    };
							};
if (_mrk isEqualTo "respawn_guerrila") then [{
	player setPos getMarkerPos "respawn_guerrila";
},{
if (_IsPara isEqualTo 1) then {
		[player, [missionNamespace, "DA3F_Save_InvJumpPara"]] call BIS_fnc_saveInventory;
		removeBackpack player;
		player addBackpack "B_parachute";
		[]spawn {
		waitUntil {(((getPosATL player)select 2)< 120)};
		if (vehicle player == player) then {
			player action ["openParachute",player];
		};
		waitUntil {isTouchingGround player};
		[player, [missionNamespace, "DA3F_Save_InvJumpPara"]] call BIS_fnc_loadInventory;
		[1,"Chargement de votre inventaire"]call DA3F_fnc_hint;
		};
};
	player setPos _pos;
}];
[0,format ["%1 vous venez de spawn %2", name player,((_DA3F_listMrk select _sel) select 1)]] call DA3F_fnc_hint;
//[1,format ["%1 <br/> vous venez de spawn sur :<br/> %2 <br/>position : %3", name player,_text,mapGridPosition player]] call DA3F_fnc_hint;
/*
[0,format ["%1 vous venez de spawn %2", name player,_text]]remoteExec["DA3F_fnc_hint",player];
[1,format ["%1 <br/> vous venez de spawn sur :<br/> %2 <br/>position : %3", name player,_text,mapGridPosition player]]remoteExec["DA3F_fnc_hint",player];
[2,format ["%1 vous venez de spawn %2", name player,_text]]remoteExec["DA3F_fnc_hint",player];
  cutText ["","BLACK IN",3];
  */
closeDialog 0;
if !(isNull (findDisplay 221117)) then {
	(findDisplay 221117) closeDisplay 1;
};
sleep 30;
	_msg = format ["Bonjour<br/><t color='#2EFE00' size='1.1'>%1<t/><br/><br/><t color='#FEFEFE' size='1'>Bienvenue sur le projet communautaire de Aroun<t/><br/><t color='#00E0FE' size='1.3'>Projet en cours de dev<t/><br/><t color='#FEFEFE' size='1'>Le serveur n'est pas sous mot de passe pour permettre aux personnes qui suivent le projet de ce connecter pour essayer et faire avancer la mission<br/>Merci de prendre en considération que la mission ne dispose pas de toutes ces fonctionnalités et de me rapporter incohérences ou bug que vous pourriez rencontrer afin d'en faire le suivit<t/><br/><br/><t color='#00E0FE' size='1.3'>%2<t/>", name player,_name_mission];
		[1,_msg]call DA3F_fnc_hint;
};