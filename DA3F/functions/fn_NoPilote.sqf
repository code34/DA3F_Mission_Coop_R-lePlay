/*
*       File: fn_NoPilote.sqf
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*
*/
#include "..\..\DA3F_macros.hpp"
    //hint format ["%1  %2  %3 ", typeOf (_this select 0), _this select 1, _this select 2];
    _className  = typeOf (_this select 0);
    _unit       = (_this select 2);
    _typeVeh    = ClassVeh(_className);
    _exit       = false;
    _ArrWhiteClasse =   Concess_Cfg(getArray,"WhiteList_Air","WhiteVeh");
    _ArrWhiteSpe =  Concess_Cfg(getArray,"WhiteList_Air","WhiteSpe");
    _whiteListe = false;

    {
        if (MNS_Gvar_Spe(Spe_Cfg(getText,(_x),"var"))) then {
            _whiteListe = true;
        };
    } forEach _ArrWhiteSpe;

    if (_typeVeh isEqualTo "Air") then {
        if !(DA3F_Sp_Pilote) then {
            if !(_className in _ArrWhiteClasse) then {
                if !(_whiteListe) then {
                    if ((_this select 1) isEqualTo "driver") then {
                        _exit       = true;
                    };
                };
            };
        };
    };
    if (_exit) exitWith {
        [1,format["%1<br/>Tu n'est pas pilote<br/>ou<br/>Tu ne dispose pas d'autorisation de vol",name _unit]]call DA3F_fnc_hint;
        (driver (_this select 0)) action ["getout", (_this select 0)];
        };