/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_GiveCash.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
    _indexUnit 	= lbCurSel 2101;
    _indexDeviz	= lbCurSel 2102;
    _value		= ctrlText 1401;
	_exit 		= false;
    _runit		= (lbData [2101,(_indexUnit)]);
    _Deviz		= (lbText [2102,(_indexDeviz)]);

    _unit		= call compile format["%1",_runit];
    _value		= call compile format["%1",_value];
    switch (_Deviz) do {
            case "€": {
                if (DA3F_Cash < _value) then {_exit =true};
            };
            case "Klix": {
                if (DA3F_WCash < _value) then {_exit =true};
            };
        };
        if (_exit) exitWith {[1,"Tu ne dispose pas des fonds suffisant"]call DA3F_fnc_hint;};
			[14,_value,name player,_Deviz] remoteExecCall ["DA3F_fnc_ActTarget",_unit];

	_ico = "";
        switch (_Deviz) do {
            case "€": {
                DA3F_Cash = DA3F_Cash - _value;
                _ico = _ico + "€";
            };
            case "Klix": {
                DA3F_WCash = DA3F_WCash - _value;
                _ico = _ico + format ["<img size='0.65' image='%1' />",DA3F_Cfg(getText,"DA3F_IconCustomDevise")];
            };
        };
        [1,format["Tu viens de donner <br/>%1%2<br/>à : %3",_value,_ico,name _unit]]call DA3F_fnc_hint;
