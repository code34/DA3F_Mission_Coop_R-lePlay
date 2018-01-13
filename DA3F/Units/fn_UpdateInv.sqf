/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_UpdateInv.sqf
*		Maj de l'inventaire après échange
*
*/
#include "..\..\DA3F_macros.hpp"
    disableSerialization;
    _display = (findDisplay 602);
    lbClear 1500;
    lbClear 1502;
    _ListeItem = _display displayCtrl 1500;
    _list_Coffre = _display displayCtrl 1502;
	_invVirtUntis	= player getVariable "DA3F_InvVirt";
	_arrItems		= _invVirtUntis select 0;
	{
		_item		= _x select 0;
		_Nrbitem	= _x select 1;
		_nameItem 	= Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
		_add 		= _ListeItem lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _ListeItem 	lbSetPictureRight [(lbSize _ListeItem)-1,_icon];
		lbSetData [1500,(lbSize 1500)-1,str(_x)];
	} forEach _arrItems;

	_obj = nearestObjects [player,["B_Slingload_01_Cargo_F","Land_cmp_Tower_F","Land_Tank_rust_F","Land_dp_bigTank_F","Land_LuggageHeap_02_F","Land_cmp_Tower_F"],6]select 0;
	if (isNil "_obj") exitWith {};
	if (isNull _obj) exitWith {};
	private _invVirtObj	= _obj getVariable "DA3F_StockItems";
	if (isnil "_invVirtObj") then [{
		_add 		= _list_Coffre lbAdd format ["Aucun inventaire",nil];
	},{
	_arrItems		= _invVirtObj select 0;
	{
		_item		= _x select 0;
		_Nrbitem	= _x select 1;
		_nameItem 	= Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
		_add 		= _list_Coffre lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _ListeItem 	lbSetPictureRight [(lbSize _ListeItem)-1,_icon];
		lbSetData [1502,(lbSize 1502)-1,str(_x)];
	} forEach _arrItems;
}];