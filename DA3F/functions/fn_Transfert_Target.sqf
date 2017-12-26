/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Transfert_Target.sqf
*		Utilisation des items virtuel
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
_switch         = _this select 0;
_index_Exped    = lbCurSel 1500;
_index_Desti    = lbCurSel 1501;
_val            = compile (ctrlText 1400);
_val            = call _val;
switch (_switch) do {
    case 0: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_CoffreBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 2;
        };

        if !(isNil {DA3F_TarObj getVariable "DA3F_CiterneBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 2;
            _cnt =  MNS_Gvar_Items("Carbu_Brute");
            _itemPoids      = Items_Cfg(getNumber,"Carbu_Brute","poids");
            if (_cnt < _val) exitWith {[1,"Tu ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                if ((_contenu + _val)>_max) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
                    DA3F_TarObj setVariable ["DA3F_CiterneBase",[(_contenu + _val),_max,_type],true];
            MNS_Svar_Items("Carbu_Brute",(_cnt-_val));
            DA3F_Items_Inv = DA3F_Items_Inv - (_itemPoids * _val);
                if (DA3F_Items_Inv < 0) then
                    {
                        DA3F_Items_Inv = 0;
                    };
        };

        if !(isNil {DA3F_TarObj getVariable "DA3F_SiloBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_SiloBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_SiloBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_SiloBase")select 2;
            _cnt =  MNS_Gvar_Items("Obj_burger");
            _itemPoids      = Items_Cfg(getNumber,"Obj_burger","poids");
            if (_cnt < _val) exitWith {[1,"Tu ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                if ((_contenu + _val)>_max) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
                    DA3F_TarObj setVariable ["DA3F_SiloBase",[(_contenu + _val),_max,_type],true];
            MNS_Svar_Items("Obj_burger",(_cnt-_val));
            DA3F_Items_Inv = DA3F_Items_Inv - (_itemPoids * _val);
                if (DA3F_Items_Inv < 0) then
                    {
                        DA3F_Items_Inv = 0;
                    };
        };
    };

    case 1: {
        if !(isNil {DA3F_TarObj getVariable "DA3F_CoffreBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_CoffreBase")select 2;
        };

        if !(isNil {DA3F_TarObj getVariable "DA3F_CiterneBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_CiterneBase")select 2;
            _cnt =  MNS_Gvar_Items("Carbu_Brute");
                _itemPoids      = Items_Cfg(getNumber,"Carbu_Brute","poids");
                _Poids_total    = (_itemPoids * _val);
                if (_Poids_total > DA3F_Max_Items_Inv) exitWith {[1,"Tu manque de place"]call DA3F_fnc_hint};
                    if (_val > _contenu) exitWith {[1,"Le stockage ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                      //  if ((_cnt + _val)> 0) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
                            DA3F_TarObj setVariable ["DA3F_CiterneBase",[(_contenu - _val),_max,_type],true];

            MNS_Svar_Items("Carbu_Brute",(_cnt+_val));
                DA3F_Items_Inv  = DA3F_Items_Inv + _Poids_total;
        };

        if !(isNil {DA3F_TarObj getVariable "DA3F_SiloBase"}) then {
            _contenu = (DA3F_TarObj getVariable "DA3F_SiloBase")select 0;
            _max = (DA3F_TarObj getVariable "DA3F_SiloBase")select 1;
            _type = (DA3F_TarObj getVariable "DA3F_SiloBase")select 2;
            _cnt =  MNS_Gvar_Items("Obj_burger");
                _itemPoids      = Items_Cfg(getNumber,"Obj_burger","poids");
                _Poids_total    = (_itemPoids * _val);
                if (_Poids_total > DA3F_Max_Items_Inv) exitWith {[1,"Tu manque de place"]call DA3F_fnc_hint};
                    if (_val > _contenu) exitWith {[1,"Le stockage ne dispose pas de cette quantité"]call DA3F_fnc_hint};
                    //    if ((_cnt + _val)> 0) exitWith {[1,"Le stockage n'a pas assez de place"]call DA3F_fnc_hint};
                            DA3F_TarObj setVariable ["DA3F_SiloBase",[(_contenu - _val),_max,_type],true];

            MNS_Svar_Items("Obj_burger",(_cnt+_val));
                DA3F_Items_Inv  = DA3F_Items_Inv + _Poids_total;
        };
    };
};
closeDialog 0;