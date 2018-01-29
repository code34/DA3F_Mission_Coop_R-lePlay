/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_TransfertValide.sqf
*		Utilisation des items virtuel
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
_index_Exped    = lbCurSel 1500;
_index_Desti    = lbCurSel 1501;
_val            = compile (ctrlText 1400);
_val            = call _val;
if (_index_Desti isEqualTo -1) exitWith {};
if (_index_Exped isEqualTo -1) exitWith {};
if (_index_Desti isEqualTo _index_Exped) exitWith {[1,"Autant laisser ça la !"]call DA3F_fnc_hint};

_exped      = DA3F_Arr_AllStockage_in_base select _index_Exped;
_desti      = DA3F_Arr_AllStockage_in_base select _index_Desti;

_coffre_1   = ["coffre", lbText [1500,_index_Exped]] call BIS_fnc_inString;
_citerne_1  = ["citerne", lbText [1500,_index_Exped]] call BIS_fnc_inString;
_silo_1     = ["silo", lbText [1500,_index_Exped]] call BIS_fnc_inString;

_coffre_2   = ["coffre", lbText [1501,_index_Desti]] call BIS_fnc_inString;
_citerne_2  = ["citerne", lbText [1501,_index_Desti]] call BIS_fnc_inString;
_silo_2     = ["silo", lbText [1501,_index_Desti]] call BIS_fnc_inString;

_get_1 = "";
if (_coffre_1) then {_get_1 = _exped getVariable "DA3F_CoffreBase"};
if (_citerne_1) then {_get_1 = _exped getVariable "DA3F_CiterneBase"};
if (_silo_1) then {_get_1 = _exped getVariable "DA3F_SiloBase"};

_get_2 = "";
if (_coffre_2) then {_get_2 = _desti getVariable "DA3F_CoffreBase"};
if (_citerne_2) then {_get_2 = _desti getVariable "DA3F_CiterneBase"};
if (_silo_2) then {_get_2 = _desti getVariable "DA3F_SiloBase"};

    _contenu_1  = _get_1 select 0;
    _Max_1      = _get_1 select 1;
    _type_1     = _get_1 select 2;

    _contenu_2  = _get_2 select 0;
    _Max_2      = _get_2 select 1;
    _type_2     = _get_2 select 2;
    if !(_type_1 isEqualTo _type_2) exitWith {[1,"Cette action n'est pas possible<br/>les ressources doivent être identique"]call DA3F_fnc_hint};
    if (_contenu_1 < _val) exitWith {[1,"Le stockage ne possède pas cette quantité"]call DA3F_fnc_hint};
        if ((_contenu_2 + _val)> _Max_2) exitWith {[1,"Le stockage ne possède pas assez de place"]call DA3F_fnc_hint};
            _calcul_1 = (_contenu_1 - _val);
            _calcul_2 = (_contenu_2 + _val);
            _exped setVariable [format["DA3F_%1Base",_type_1],[_calcul_1,_Max_1,_type_1],true];
            _desti setVariable [format["DA3F_%1Base",_type_2],[_calcul_2,_Max_2,_type_2],true];
            [1,format["Transfert en cours...<br/>%1<br/>%2<br/>%3<br/>%4<br/>%5",_type_1,_contenu_1,_val,_Max_1,_calcul_1]]call DA3F_fnc_hint;
            closeDialog 0;