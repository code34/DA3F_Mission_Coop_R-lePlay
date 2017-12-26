/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_ForceVeh.sqf
*
*/
/*
// Ajouter dans le keyhandler.sqf
    if !(isNil {_veh getVariable "DA3F_Veh_IsForced"}) exitWith {hint parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Ce véhicule à été forcé !<br/>Impossible de le verrouiller</t>",nil]; };
*/

_veh = vehicle cursorTarget;
if (_veh isKindOf "Man") exitWith {};
if !(license_civ_dir) exitWith {};
if ((locked _veh) isEqualTo 2) then [{
    hintSilent parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Forçage de la serrure...</t>",nil];
    sleep (2 + random 5);
      _veh lock 0;
      _veh setVariable ["DA3F_Veh_IsForced",true,true];
    hintSilent parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Véhicule ouvert.</t>",nil];
  },{
    hintSilent parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Ce véhicule est déjà ouvert</t>",nil];
}];
if (locked _veh isEqualTo 2) then [{
          life_action_inUse = true;
        _titre = format ["Tension sur la serrure",nil];

        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format ["%2 (1%1)...","%",_titre];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        while {true} do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            uiSleep 0.17;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_titre];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if !(isNull objectParent player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        player playActionNow "stop";

      _veh lock 0;
      _veh setVariable ["DA3F_Veh_IsForced",true,true];
    hintSilent parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Véhicule ouvert.</t>",nil];
},{
    hintSilent parseNumber format ["<t color='#EA4300' size='1.2'>Info</t><br/><t color='#FEFEFE' size='1.2'>Ce véhicule est déjà ouvert</t>",nil];
}];