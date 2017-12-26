/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Give.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;
    _indexItem 	= lbCurSel 1500;
    _indexUnit 	= lbCurSel 2100;

			if (_indexItem isEqualTo -1)exitWith {[1,"Séléctionne un item"]call DA3F_fnc_hint;};
			if (_indexUnit isEqualTo -1)exitWith {[1,"Séléctionne un joueur"]call DA3F_fnc_hint;};
    _arrItem	= compile(lbData [1500,(_indexItem)]);
    _runit		= (lbData [2100,(_indexUnit)]);
    _arrItem	= call _arrItem;
    _unit		= call compile format["%1",_runit];
    _item		= _arrItem select 0;
    _value		= call compile(ctrlText 1400);
	[_item,_value,"del"]call DA3F_fnc_Add_Ret_Items;
	[3,_item,_value,player] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
	lbClear 1500;
	_invVirtUntis	= player getVariable "DA3F_InvVirt";
	_arrItems		= _invVirtUntis select 0;
	_ListeItem = ((findDisplay 602)displayCtrl 1500);
	{
		_item		= _x select 0;
		_Nrbitem	= _x select 1;
		_nameItem 	= Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
		_add 		= _ListeItem lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _ListeItem 	lbSetPictureRight [(lbSize _ListeItem)-1,_icon];
		lbSetData [1500,(lbSize 1500)-1,str(_x)];
	} forEach _arrItems;
 //   [1,format ["retour :  %1<br/>%2 X %3",name _unit,_value, Items_Cfg(getText,_item,"displayname")]]call DA3F_fnc_hint;