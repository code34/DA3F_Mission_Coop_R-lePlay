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
disableSerialization;
_index =lbCurSel 1500;
if (_index isEqualTo -1) exitWith {[1,"Séléctionne une position"]call DA3F_fnc_hint};
DA3F_Save_Pos deleteAt _index;
closeDialog 0;