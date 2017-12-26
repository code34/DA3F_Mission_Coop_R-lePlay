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
_name_mission   = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
_display        = (findDisplay 181117);
_sel            = (lbCurSel 1500);
if (_sel isEqualTo -1) exitWith {};
_text           = ((_display)displayCtrl 1500) lbText _sel;
_AllMrk         = missionNamespace getVariable "DA3F_Mrk_Sp";
_mrk            = _AllMrk select _sel;
_pos            = [((getMarkerPos _mrk)select 0) + random 250,((getMarkerPos _mrk)select 1) + random 250,((getMarkerPos _mrk)select 2)];
if (_mrk isEqualTo "respawn_guerrila") then [{
	player setPos getMarkerPos "respawn_guerrila";
},{
	player setPos _pos;
}];

[0,format ["%1 vous venez de spawn %2", name player,_text]]remoteExec["DA3F_fnc_hint",player];
[1,format ["%1 <br/> vous venez de spawn sur :<br/> %2 <br/>position : %3", name player,_text,mapGridPosition player]]remoteExec["DA3F_fnc_hint",player];
[2,format ["%1 vous venez de spawn %2", name player,_text]]remoteExec["DA3F_fnc_hint",player];
  cutText ["","BLACK IN",3];
closeDialog 0;
if !(isNull (findDisplay 1811172)) then {
	(findDisplay 1811172) closeDisplay 1;
};
};