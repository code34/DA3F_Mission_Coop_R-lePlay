/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShopItems_BuySell.sqf
*
*/
_this spawn {
#include "..\..\DA3F_macros.hpp"
private ["_type","_display","_index_Items","_index_Inv","_ValuesBuy","_ValuesSell","_item","_cnt","_val","_NameItem","_price","_devise","_poids","_total","_Poids_total"];
_type = _this select 1;
disableSerialization;
_display        = (findDisplay 1081217);
_index_Items    = (lbCurSel 1500);
_index_Inv      = (lbCurSel 1501);
_ValuesBuy      = (ctrlText 1401);
_ValuesSell     = (ctrlText 1400);
_item_Market	= call compile format["%1",lbData [1500,(_index_Items)]];
_item_inv		= call compile format["%1",lbData [1501,(_index_Inv)]];
	switch (_type) do
	{
	    case 0:
	    {
		if (_index_Items isEqualTo -1) exitWith {[1,"Tu n'as rien séléctionné."]call DA3F_fnc_hint};
			_val            = call compile format ["%1", _ValuesBuy];
			_price			= Items_Cfg(getNumber,_item_Market,"Price_Buy");
			_devise			= Items_Cfg(getText,_item_Market,"devise");
			_NameItem		= Items_Cfg(getText,_item_Market,"displayName");
			_total			= (_price * _val);
			//[1,format["%1 %2",_item_Market, _val]]call DA3F_fnc_hint;
			switch (_devise) do {
			    case "€": {
					if (DA3F_Cash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
				if !([_item_Market,_val,"add"]call DA3F_fnc_Add_Ret_Items) exitWith{};
				[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				DA3F_Cash = DA3F_Cash - _total;
			    };

			    case "£": {
					if (DA3F_WCash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_WCash - _price),_devise]]call DA3F_fnc_hint};
				if !([_item_Market,_val,"add"]call DA3F_fnc_Add_Ret_Items) exitWith{};
				[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				DA3F_WCash = DA3F_WCash - _total;
			    };
			};
			[1]call DA3F_fnc_ShopItemsVirt;
	    };
	    case 1:
	    {
		if (_index_Inv isEqualTo -1) exitWith {[1,"Tu n'as rien séléctionné."]call DA3F_fnc_hint};
			_val            = call compile format ["%1", _ValuesSell];
	    	_cnt 			= MNS_Gvar_Items(_item_inv);
			_price			= Items_Cfg(getNumber,_item_inv,"Price_Sell");
			_devise			= Items_Cfg(getText,_item_inv,"devise");
			_NameItem		= Items_Cfg(getText,_item_inv,"displayName");
			_total			= (_price * _val);
			//if (DA3F_Cash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
			if ([_item_inv,_val,"del"]call DA3F_fnc_Add_Ret_Items) then {
			switch (_devise) do {
			    case "€": {
				DA3F_Cash = DA3F_Cash + _total;
			    };

			    case "£": {
				DA3F_WCash = DA3F_WCash + _total;
			    };
			};
				[1,format["Vous avez vendu :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				[1]call DA3F_fnc_ShopItemsVirt;
			};
	    };
	    default {};
	};
};
