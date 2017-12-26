/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ActTarget.sqf
*       Switch des actions du remoteExec
*
*       Exemple :
*           [Type,Arguments] remoteExecCall ["DA3F_fnc_ActTarget",TARGET];
*
*/
#include "..\..\DA3F_macros.hpp"

private ["_type","_obj","_cash"];
_type = (_this select 0);
switch (_type) do
    {
    // Action ramasse cash
    case 0: {
    		_obj = (_this select 1);
    		_obj addAction ["<t color='#F59800' size='1.2' >Ramasser le cash<t/>",
    	{
    		_cash = (_this select 0) getVariable "DA3F_DeadCash";
    		DA3F_Cash = DA3F_Cash + _cash;
    		deleteVehicle (_this select 0);
    		[1,format ["Vous venez de Ramasser <br/>%1€", _cash]]call DA3F_fnc_hint;
    	}];
    };
    // Switch Spécialisation
    case 1: {
        _spe    = _this select 1;
        _bool   = _this select 2;
        [_spe,_bool]call DA3F_fnc_SwitchSpe;
    };
    // Give monney
    case 2: {
        _val    = _this select 1;
        _name   = _this select 2;
        DA3F_Cash = DA3F_Cash + _val;
        [1,format ["%1<br/>vous a donné<br/>%2€", _name,_val]]call DA3F_fnc_hint;
    };
    // Give items
    case 3:
        {
            _item   = _this select 1;
            _val    = _this select 2;
            _expedit= _this select 3;
            _name   = name _expedit;
            if !([_item,_val,"add"]call DA3F_fnc_Add_Ret_Items) then
                [{
                    [3,_item,_val,player] remoteExecCall ["DA3F_fnc_ActTarget",_expedit];
                    [1,format["Les items vous sont rendu<br/>%1<br/>n'a pas assez de place",name player]] remoteExecCall ["DA3F_fnc_hint",_expedit];
                    [1,format["Tu manque de place",nil]]call DA3F_fnc_hint;
                },{
                [1,format ["%1<br/>vous a donné<br/>%2 %3", _name,_val,Items_Cfg(getText,_item,"displayname")]]call DA3F_fnc_hint;
            }];
        };
    // Addaction obj for all player (No JIP (after ??? ^^))
    case 4: {
    _PC = (_this select 1);
        _PC addAction
                [
                format ["%1", (Mission_Cfg(getArray,DA3F_NameClass_Mission,"Objet_Exec"))select 0],
            {
                DA3F_futureDA3F_NameClass_Mission = DA3F_futureDA3F_NameClass_Mission + (2*60);
                _arrExec = (Mission_Cfg(getArray,DA3F_NameClass_Mission,"Objet_Exec"))select 1;
                _exec    = (_arrExec select 0);
                _exec = compile (_exec);
                call _exec;
            }];
        };
        // Add var all player
        case 5: {
        _unit = (_this select 1);
        _Nvar = (_this select 2);
        _args = (_this select 3);
        _bool = (_this select 4);
            _unit setVariable [format ["%1",_Nvar],_args,_bool];
        };
        // Info mission
        case 6:
        {
        _ico    = ["dead"]call DA3F_fnc_A3_Icons;
            player createDiaryRecord["Mission",
                [
                    format ["Locoliser : %1", name DA3F_Dead_list],
                    format["<br/><br/>Localisation de : <marker name='%1'>%2</marker><br/><br/>  Afficher la position de :<execute expression='[""%1"",""%2""]call DA3F_fnc_showMrkTarget'>%2</execute>",
                    (DA3F_Dead_list getVariable "DA3F_mrk_trgt"),name DA3F_Dead_list]
                ]
            ];
        ["DA3F_Info_cprp_1",[format ["%1", _ico],"Info de mission",format ["Le nom de votre cible vient de tomber  %1", name DA3F_Dead_list]]] call BIS_fnc_showNotification;

        };
        // Recompense Mission dyn.
        case 7: {
            _typeVic    = (_this select 1);
            _gain       = (_this select 2);
            _devise     = (_this select 3);

            switch (_typeVic) do {
                case 1: {
                    switch (_devise) do {
                        case "€": {
                            DA3F_Cash = DA3F_Cash + _gain;
                        };

                        case "£": {
                            DA3F_WCash = DA3F_WCash + _gain;
                        };
                        default {
                            DA3F_Cash = DA3F_Cash + _gain;
                        };
                    };
                    [1,format ["Vous venez de toucher :<br/>%1%2<br/> pour votre travail",_gain,_devise]]call DA3F_fnc_hint;
                };

                case 2: {
                    _item       = _gain select 0;
                    _val        = _gain select 1;
                    _itemName   = Items_Cfg(getText,_item,"displayName");
                    _itemPoids  = Items_Cfg(getNumber,_item,"poids");
                    _Poids_total= (_itemPoids * _val);
                    if !([_item,_val,"add"]call DA3F_fnc_Add_Ret_Items) exitWith {};
                    [1,format ["Vous touchez :<br/> %1 X %2<br/>En récompense de la mission",_val,_itemName]]call DA3F_fnc_hint;
                };
            };
        };
        // Message Admin
        case 8: {
            _msg    = _this select 1;
            _exped  = _this select 2;
            [1,format["Message en provenance de :<br/> %1 <br/><br/>%2",_exped,_msg]]call DA3F_fnc_hint;
        };
        // Arsenal by admin
        case 9: {
            ["Open",true ] spawn BIS_fnc_arsenal;
        };
        // Heal by admin
        case 10: {
        _admin = _this select 1;
            [1,format["Vous venez d'être heal par : %1",_admin]]call DA3F_fnc_hint;
            player setDamage 0;
        };
        // God mod by admin
        case 11: {
        _admin = _this select 1;
            if (isNil{player getVariable "DA3F_God"}) then [{
            [1,format["Vous venez de passer en God Mod par : %1",_admin]]call DA3F_fnc_hint;
                player setVariable ["DA3F_God",true,true];
                player allowDamage false;
            },{
            [1,format["Vous n'êtes plus en God Mod",nil]]call DA3F_fnc_hint;
                player setVariable ["DA3F_God",nil,true];
                player allowDamage true;
            }];
        };
        case 12: {
        _admin = _this select 1;
            [1,format["Vous venez d'être restauré par : %1",_admin]]call DA3F_fnc_hint;
            DA3F_Soif = 100;
            DA3F_Faim = 100;
        };

        case 13: {
        _admin = _this select 1;
            if (isNil{player getVariable "DA3F_NoKeyboard"}) then [{
            [1,format["Vous venez d'être immobilisé par : %1",_admin]]call DA3F_fnc_hint;
                player setVariable ["DA3F_NoKeyboard",true,true];
                disableUserInput true;
            },{
            [1,format["Vous êtes libre",nil]]call DA3F_fnc_hint;
                player setVariable ["DA3F_NoKeyboard",nil,true];
                disableUserInput false;
            }];
            [1,format["Vous venez d'être désarmé par : %1",_admin]]call DA3F_fnc_hint;
            player removeWeapon (currentWeapon player);
        };
    };