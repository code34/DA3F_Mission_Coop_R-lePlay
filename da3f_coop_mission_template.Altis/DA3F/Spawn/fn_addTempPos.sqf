/*
*
*       Dev'Arma 3 France
*       The Survivors Rp
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnValide.sqf
*       Téléportation du joueur sur le spawn sélectionné
*
*/
private ["_name_mission","_display","_sel","_text","_AllMrk","_mrk"];
_this spawn {
disableSerialization;
_txt = ctrlText 1400;
if ((count DA3F_Save_Pos) >= 5) exitWith
	{
		[1,"Vous avez fait le nombre maxium de save"]call DA3F_fnc_hint;
	};
DA3F_Save_Pos pushBack [getPosATL player,_txt];
[1,"Save de votre position"]call DA3F_fnc_hint;
closeDialog 0;
};