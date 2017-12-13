/*
*
*       Dev'Arma 3 France
*       The Survivors Rp
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnTempPos.sqf
*       Téléportation du joueur sur le spawn sélectionné
*
*/
private ["_name_mission","_display","_sel","_text","_AllMrk","_mrk"];
_this spawn {
disableSerialization;
_index =lbCurSel 1500;
_pos =  (DA3F_Save_Pos select _index)select 0;
player setPosATL _pos;
closeDialog 0;
};