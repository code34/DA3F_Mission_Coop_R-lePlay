/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_atmMenu.sqf
*		à moins d'être con et la j'y peu rien tu sais à quoi sert un atmmenu, Non ? ...
*
*/
#include "fn_Cfg_ShohVehinit.sqf"
if !(createDialog "Gui_Bank") exitWith {hint "Erreur de chargement du menu..."};
disableSerialization;
_display =(findDisplay 19319);
_CashEnBank = profileNamespace getVariable "DA3F_civParty_SaveCash";
if (isNil "_CashEnBank") then {_CashEnBank = 0};
_Id_Cash 	= 1101;
_Id_Bank 	= 1104;
_depBtn = 2400;
_retBtn = 2401;
_EndBtn = 2402;
_Btn_dep 	= _display displayCtrl _depBtn;
_Btn_ret 	= _display displayCtrl _retBtn;
_Btn_end 	= _display displayCtrl _EndBtn;
_Cash 	= _display displayCtrl _Id_Cash;
_Bank 	= _display displayCtrl _Id_Bank;

_Btn_dep	buttonSetAction "[]call DA3F_Dep";
_Btn_ret	buttonSetAction "[]call DA3F_Ret";
_Btn_end	buttonSetAction "closeDialog 0";
_Cash ctrlSetStructuredText parseText format["%1",[DA3F_Cash]call DA3F_fnc_numberText];
_Bank ctrlSetStructuredText parseText format["%1",[DA3F_Bank]call DA3F_fnc_numberText];

DA3F_Dep={
#include "fn_Cfg_ShohVehinit.sqf"
disableSerialization;
	_depot=parseNumber(ctrlText(1400));
	if (DA3F_Cash < _depot) exitWith {[1,"Opération impossible"]call DA3F_fnc_hint};
DA3F_Cash = DA3F_Cash - _depot;
DA3F_Bank = DA3F_Bank + _depot;
[1,format ["Vous avez fait un dépôt de : <br/>%1 %2",[_depot]call DA3F_fnc_numberText,_deviseUtilise]]call DA3F_fnc_hint;
//[false] call DA3F_fnc_SaveStats;

((findDisplay 19319)displayCtrl 1101) ctrlSetStructuredText parseText format["%1",[DA3F_Cash]call DA3F_fnc_numberText];
((findDisplay 19319)displayCtrl 1104) ctrlSetStructuredText parseText format["%1",[DA3F_Bank]call DA3F_fnc_numberText];
};

DA3F_Ret={
#include "fn_Cfg_ShohVehinit.sqf"
disableSerialization;
	_depot=parseNumber(ctrlText(1400));
	if (DA3F_Bank < _depot) exitWith {[1,"Opération impossible"]call DA3F_fnc_hint};
DA3F_Cash = DA3F_Cash + _depot;
DA3F_Bank = DA3F_Bank - _depot;
[1,format ["Vous avez fait un retrait de : <br/>%1 %2",[_depot]call DA3F_fnc_numberText,_deviseUtilise]]call DA3F_fnc_hint;
//[false] call DA3F_fnc_SaveStats;
((findDisplay 19319)displayCtrl 1101) ctrlSetStructuredText parseText format["%1",[DA3F_Cash]call DA3F_fnc_numberText];
((findDisplay 19319)displayCtrl 1104) ctrlSetStructuredText parseText format["%1",[DA3F_Bank]call DA3F_fnc_numberText];
};