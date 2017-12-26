/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SetupTV.sqf
*       Action sur l'écran de départ
*
*/
	#include "..\..\DA3F_macros.hpp"
_this allowDamage false;
_this addAction ["<t color='#15E73D' size='1.3'>Insertion sur la map<t/>",DA3F_fnc_SpawnMenu,nil,0,false,false,"","_this distance _target < 4"];
_this addAction["<t color='#01C525' size='1.3'>Demander une livraison de véhicule<t/>",DA3F_fnc_Concess,"Base_Terminal",0,false,false,"","_this distance _target < 4"];

if ((DA3F_Cfg(getNumber,"DA3F_FullArsenal"))isEqualTo 1) then {
_this addAction["<t color='#019AC5' size='1.3'>Full Arsenal<t/>",
{
	["Open",true ] spawn BIS_fnc_arsenal;
},nil,0,false,false,"","_this distance _target < 4"];
};


_this addAction["<t color='#2A9DBE' size='1.3'>Charger mon stuff au respawn<t/>",
{
	_confirm = ["<t color='#F52600' size='1.1'>Voulez-vous sauvegarder votre équipement ?<br/>Il vous sera attribué au respawn automatiquement<t/>","Confirmation ?","OUI","NON"]call bis_fnc_GUImessage;
	if (_confirm) then [{
		[player, [missionNamespace, "DA3F_InvUnit"]] call BIS_fnc_saveInventory;
		player setVariable ["DA3F_IsLoadActiv",true,false];
		[1,"Save de votre équipement avec succès"]call DA3F_fnc_hint;
	},{
		[1,"Sauvegarde annulé"]call DA3F_fnc_hint;
	}];
},nil,0,false,false,"","_this distance _target < 4"];