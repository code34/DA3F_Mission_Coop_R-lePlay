/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShopItems_BuySell.sqf
*
*/
_this spawn {
private ["_type","_display","_index_Items","_index_Inv","_ValuesBuy","_ValuesSell","_item","_cnt","_val","_NameItem","_price","_devise","_poids","_total","_Poids_total"];
_type = _this select 1;
disableSerialization;
_display        = (findDisplay 1081217);
_index_Items    = (lbCurSel 1500);
_index_Inv      = (lbCurSel 1501);
_ValuesBuy      = (ctrlText 1401);
_ValuesSell     = (ctrlText 1400);
	switch (_type) do
	{
	    case 0:
	    {
			if (_index_Items isEqualTo -1) exitWith {[1,"Sélectionne un item"]call DA3F_fnc_hint};
			_item           = DA3F_AllItems select _index_Items;
			_cnt            = missionNamespace getVariable format ["DA3F_Item_%1",_item];
			_val            = (call compile _ValuesBuy);
			_NameItem		= getText(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "displayName");
			_price 			= getNumber(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "Price_Buy");
			_devise			= getText(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "devise");
			_poids			= getNumber(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "poids");
			_total			= (_price * _val);
			_Poids_total	= (_poids * _val);

			if ((DA3F_Items_Inv + _Poids_total) > DA3F_Max_Items_Inv) exitWith {[1,format["Tu manque de place",nil]]call DA3F_fnc_hint};
			if (_Poids_total > DA3F_Max_Items_Inv) exitWith {[1,format["Tu manque de place",nil]]call DA3F_fnc_hint};
			if (DA3F_Cash < _total) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
			_cnt = _cnt + _val;
			DA3F_Items_Inv = DA3F_Items_Inv + _Poids_total;
			DA3F_Cash = DA3F_Cash - _total;
			missionNamespace setVariable [format ["DA3F_Item_%1",_item],_cnt];
			[1,format["Vous avez acheté :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
			closeDialog 0;
			sleep 0.001;
			[]call DA3F_fnc_ShopItemsVirt;
	    };
	    case 1: {
	    	if (_index_Inv isEqualTo -1) exitWith {[1,"Sélectionne un item"]call DA3F_fnc_hint};
	    	_item			= DA3F_AllItems_Inv select _index_Inv;
			_cnt            = missionNamespace getVariable format ["DA3F_Item_%1",_item];
			_NameItem		= getText	(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "displayName");
			_price 			= getNumber	(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "Price_Sell");
			_devise			= getText	(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "devise");
			_poids			= getNumber(MissionConfigFile >> "DA3F_Cfg_Items_virt" >> _item >> "poids");
			_val            = (call compile _ValuesSell);
			_total			= (_price * _val);
			_Poids_total	= (_poids * _val);
			if (_cnt < _val) exitWith {[1,"Tu n'as pas autant d'items"]call DA3F_fnc_hint};
			_cnt = _cnt - _val;
			DA3F_Cash = DA3F_Cash + _total;
			DA3F_Items_Inv = DA3F_Items_Inv - _Poids_total;
			if (DA3F_Items_Inv < 0) then {DA3F_Items_Inv = 0};
			missionNamespace setVariable [format ["DA3F_Item_%1",_item],_cnt];
			[1,format["Vous avez vendu :<br/>%2 X %1<br/>Pour : %3%4",_NameItem,_val,_total,_devise]]call DA3F_fnc_hint;
			closeDialog 0;
			sleep 0.001;
			[]call DA3F_fnc_ShopItemsVirt;
	    };
	    default {};
	};
};