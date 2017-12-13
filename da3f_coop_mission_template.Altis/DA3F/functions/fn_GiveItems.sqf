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
_index 			= lbCurSel 2100;
_indexItems 	= lbCurSel 1501;
private _value 	= ctrlText 1400;
_value 			= call compile _value;
if (_index isEqualTo -1) exitWith {};
_items  	= DA3F_Items_Inv_Unit select _indexItems;
_unit  		= DA3F_arrayNearUnits select _index;
_nrb 		= missionNamespace getVariable format ["DA3F_Item_%1",_items];
if (_nrb < _value) exitWith {[1,"Tu n'as pas autant d'items"]call DA3F_fnc_hint;};
    _nrb = _nrb - _val;
missionNamespace setVariable [format ["DA3F_Item_%1",_item],_nrb];
_itemName 		= getText (missionConfigFile >> "DA3F_Cfg_Items_virt" >> _items >> "displayName");
_itemPoids 		= getText (missionConfigFile >> "DA3F_Cfg_Items_virt" >> _items >> "poids");
_Poids_total 	= (_itemPoids * _value);
DA3F_Items_Inv 	= DA3F_Items_Inv - _Poids_total;
	if (DA3F_Items_Inv < 0) then
		{
			DA3F_Items_Inv = 0;
		};
	[3,_value,_items,_itemName,_Poids_total,player] remoteExecCall ["DA3F_fnc_ActTarget",_unit];
[1,format["Item(s) Envoyé <br/> %1",_itemName]]call DA3F_fnc_hint;
closeDialog 0;