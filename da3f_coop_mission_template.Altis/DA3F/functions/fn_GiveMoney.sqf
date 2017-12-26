/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_UseItems.sqf
*		Utilisation des items virtuel
*
*/
disableSerialization;
_index = lbCurSel 2101;
private _value = ctrlText 1401;
_value = call compile _value;
hint str _value;
if (_index isEqualTo -1) exitWith {};
_unit  = DA3F_arrayNearUnits select _index;
if (DA3F_Cash < _value) exitWith {[1,"Tu n'as pas assez de cash"]call DA3F_fnc_hint;};
    DA3F_Cash = DA3F_Cash - _value;
[2,_value,name player] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
[1,format["Argent Envoyé <br/>%1€",_value]]call DA3F_fnc_hint;
closeDialog 0;
