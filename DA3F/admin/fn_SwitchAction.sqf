/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_init_AdminMenu.sqf
*		Admin menu V1
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
private ["_index_Units", "_infos", "_edit", "_unit", "_index_Action", "_SwitchAction", "_choix", "_inipos"];
_index_Units	= lbCurSel 1500;
if (_index_Units isEqualTo -1)exitWith {[1,"Séléctionne un joueur"]call DA3F_fnc_hint;};
_infos			= compile(lbData [1500,_index_Units]);
_infos			= call _infos;
_uid			= _infos select 0;
_edit			= (ctrlText 1400);
_unit 			= [_uid]call bis_fnc_getUnitByUid;
_index_Action 	= lbCurSel 1501;
_SwitchAction   = (lbData [1501,_index_Action]);
if (_index_Action isEqualTo -1) exitWith {[1,"Séléctionne une action"]call DA3F_fnc_hint;};

switch (_SwitchAction) do {
// Téléport unit
    case "Téléport unit": {
    	[_unit] spawn {
        _unit = (_this select 0);
    	_choix=["Le téléporter ou le laisser choisir sa destination","Téléportation","Le TP","Libre"]call bis_fnc_GUImessage;
    	if (_choix) then
    		[{
		    	[_unit]call DA3F_fnc_teleport;
    		},{
		    	[]remoteExecCall["DA3F_fnc_teleport",_unit];
    		}];
    	};
    };
    // Remboursement
    case "Remboursement": {
    	_edit = call compile _edit;
    [1,format["Remboursement de : %1€<br/>pour : %2",[_edit]call DA3F_fnc_numberText,name _unit]]call DA3F_fnc_hint;
        [2,_edit,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Message
    case "Message": {
    [1,format["Message à : %1<br/><br/>Message :<br/>%2",name _unit,_edit]]call DA3F_fnc_hint;
        [8,_edit,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Arsenal
    case "Arsenal": {
    [1,format["Arsenal pour : %1",name _unit]]call DA3F_fnc_hint;
        [9] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Heal
    case "Heal": {
    [1,format["Heal pour : %1",name _unit]]call DA3F_fnc_hint;
        [10,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // God Mod
    case "God Mod": {
        if (isNil{_unit getVariable "DA3F_God"}) then [{
            [1,format["God Mod pour : %1",name _unit]]call DA3F_fnc_hint;
        },{
            [1,format["Fin du God Mod pour : %1",name _unit]]call DA3F_fnc_hint;
        }];
        [11,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Restauration (Faim/soif)
    case "Restauration (Faim/soif)": {
        [1,format["Vous avez restauré : %1",name _unit]]call DA3F_fnc_hint;
        [12,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Désarmer
    case "Désarmer": {
        [1,format["Vous avez désarmé : %1",name _unit]]call DA3F_fnc_hint;
        [13,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
    };
    // Restraindre
    case "Restraindre": {
        if (isNil{_unit getVariable "DA3F_NoKeyboard"}) then [{
            [1,format["Vous avez freeze : %1",name _unit]]call DA3F_fnc_hint;
        },{
            [1,format["Vous avez libéré : %1",name _unit]]call DA3F_fnc_hint;
        }];
        [13,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",_unit];

    };
    // Parachuter
    case "Parachuter": {
        openMap true;
        DA3F_unit = _unit;
        _inipos = getpos _unit;
        onMapSingleClick "DA3F_unit setPosATL [_pos select 0,_pos select 1,1000];onMapSingleClick ''; true";
        waitUntil
        {
            sleep .3;
            !((_inipos)isEqualTo (getPos DA3F_unit))
        };
        DA3F_unit addBackpack "B_parachute";
        DA3F_unit = nil;
    };
    // Plouf (Tp dans l'eau)
    case "Plouf (Tp dans l'eau)": {
            [1,format["Vous avez Tp %1 dans l'eau",name _unit]]call DA3F_fnc_hint;
            [1,"Vous avez été TP dans l'eau"] remoteExecCall ["DA3F_fnc_hint",_unit];
    	_unit setPosASL [15241,13851.7,1]; // Altis pos (baie au centre)
    };
    // Blesser
    case "Blesser": {
            [1,format["Vous avez blessé %1",name _unit]]call DA3F_fnc_hint;
            [1,format["Vous avez été blessé par %1",DA3F_Cfg(getText,"DA3F_SignatureAdmin")]] remoteExecCall ["DA3F_fnc_hint",_unit];
    	_unit setDamage ((Damage _unit)+ random 0.25);
    };
    // Kill
    case "Kill": {
            [1,format["Vous avez été tué par %1",DA3F_Cfg(getText,"DA3F_SignatureAdmin")]] remoteExecCall ["DA3F_fnc_hint",_unit];
            [1,format["Vous avez tué %1",name _unit]]call DA3F_fnc_hint;
        _unit setDamage 1;
    };
    // Msg All
    case "Message All": {
        [1,format["Message à TOUS<br/><br/>Message :<br/>%1",_edit]]call DA3F_fnc_hint;
        [8,_edit,DA3F_Cfg(getText,"DA3F_SignatureAdmin")] remoteExecCall ["DA3F_fnc_ActTarget",-2];
    };
default {
        [1,format["Action non définit dans fn_SwitchAction.sqf",nil]]call DA3F_fnc_hint;
    };
};