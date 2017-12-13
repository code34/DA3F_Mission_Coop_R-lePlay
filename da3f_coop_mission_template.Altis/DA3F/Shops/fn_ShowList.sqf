/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShowList.sqf
*
*/
#include "fn_Cfg_ShohVehinit.sqf"
disableSerialization;
_idc 		= ctrlIDC(_this select 0);
_selectCat 	= _this select 1;
_Garage 	= lbText[_idc,lbCurSel _idc];
_liste 		= (_arrayVeh select _selectCat);
lbClear 1500;

	if (_Garage isEqualTo "Mon Garage") then
		[{
			{
				_className 	= _x select 0;
				_Dmg_Veh 	= _x select 1;
				_fuel_Veh 	= _x select 2;
				_Plak_Veh 	= _x select 3;
			    _realName = getText(configFile >> "cfgVehicles" >> _className >> "displayname");
			    _vuDansLeMenu = format ["%1 - état: %2%4 | Carburant: %3%4 | %5",_realName,  (round((_Dmg_Veh-1)*100)),(round((_fuel_Veh)*100)), "%", _Plak_Veh];
			    _add=lbAdd[1500,_vuDansLeMenu];
			 } forEach DA3F_GarageUnit;
		},{
			for "_b" from 1 to (count _liste -1) do {
			    _vehicle = (_liste select _b)select 0;
			    _achat = (_liste select _b)select 1;
			    _vente = (_liste select _b)select 2;
			    _realName = getText(configFile >> "cfgVehicles" >> _vehicle >> "displayname");
			    _vuDansLeMenu = format ["%1 - Achat: %2%4 | Vente: %3%4",_realName, _achat, _vente, _deviseUtilise];
			    _add=lbAdd[1500,_vuDansLeMenu];
			};
		}];
