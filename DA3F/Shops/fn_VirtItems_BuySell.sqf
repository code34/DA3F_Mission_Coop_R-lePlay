/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShopItems_BuySell.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
private ["_type","_type_Shop","_display","_index_Items","_index_Inv","_Value","_item","_cnt","_val","_NameItem","_price","_devise","_poids","_total","_Poids_total"];
_type = ctrlIDC (_this select 0);
disableSerialization;
_display        = (findDisplay 120118);
_index_Items    = (lbCurSel 1500);
_index_Inv      = (lbCurSel 1501);
_Value		    = (ctrlText 1400);
_Data_Market	= call compile format["%1",lbData [1500,(_index_Items)]];
_Data_inv		= call compile format["%1",lbData [1501,(_index_Inv)]];
_item_Market	= _Data_Market select 0;
_item_inv		= _Data_inv select 0;
	switch (_type) do
	{
	    case 2400:
	    {
		if (_index_Items isEqualTo -1) exitWith {[1,"Tu n'as rien séléctionné."]call DA3F_fnc_hint};
			_val            = call compile format ["%1", _Value];
			_price			= Items_Cfg(getNumber,_item_Market,"Price_Buy");
			_devise			= Items_Cfg(getText,_item_Market,"devise");
			_NameItem		= Items_Cfg(getText,_item_Market,"displayName");
			_total			= (_price * _val);
			_type_Shop		= _Data_Market select 1;
			//[1,format["%1 %2",_item_Market, _val]]call DA3F_fnc_hint;
			switch (_devise) do {
			    case "€": {
					if (DA3F_Cash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
				if !([_item_Market,_val,"add"]call DA3F_fnc_Add_Ret_Items) exitWith{};
				[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
				DA3F_Cash = DA3F_Cash - _total;
			    };

			    case "K": {
					if (DA3F_WCash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_WCash - _price),_devise]]call DA3F_fnc_hint};
				if !([_item_Market,_val,"add"]call DA3F_fnc_Add_Ret_Items) exitWith{};

					_path_Klix  = format["<img size='0.65' image='%1' />",DA3F_Cfg(getText,"DA3F_IconCustomDevise")];
				[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_path_Klix]]call DA3F_fnc_hint;
				DA3F_WCash = DA3F_WCash - _total;
			    };
			};
			[nil,nil,nil,_type_Shop]call DA3F_fnc_Shop_Update_VirtItems;
	    };
	    case 2401:
	    {
		if (_index_Inv isEqualTo -1) exitWith {[1,"Tu n'as rien séléctionné."]call DA3F_fnc_hint};
			_val            = call compile format ["%1", _Value];
	    	_cnt 			= MNS_Gvar_Items(_item_inv);
			_price			= Items_Cfg(getNumber,_item_inv,"Price_Sell");
			_devise			= Items_Cfg(getText,_item_inv,"devise");
			_NameItem		= Items_Cfg(getText,_item_inv,"displayName");
			_total			= (_price * _val);
			_type_Shop		= _Data_inv select 1;
			//if (DA3F_Cash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
			if ([_item_inv,_val,"del"]call DA3F_fnc_Add_Ret_Items) then {
			switch (_devise) do {
			    case "€": {
				DA3F_Cash = DA3F_Cash + _total;
				[1,format["Vous avez vendu :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
			    };

			    case "K": {
				DA3F_WCash = DA3F_WCash + _total;
				_path_Klix  = format["<img size='0.65' image='%1' />",DA3F_Cfg(getText,"DA3F_IconCustomDevise")];
				[1,format["Vous avez vendu :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_path_Klix]]call DA3F_fnc_hint;
			    };
			};


				[nil,nil,nil,_type_Shop]call DA3F_fnc_Shop_Update_VirtItems;
			};
	    };
	    default {};
	};
