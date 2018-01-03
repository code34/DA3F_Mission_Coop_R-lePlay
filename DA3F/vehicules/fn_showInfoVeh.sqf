/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShowInfoVeh.sqf
*
*/

disableSerialization;
#include "..\..\DA3F_macros.hpp"
_idc        = ctrlIDC(_this select 0);
_selectCat  = _this select 1;
_Garage     = lbText[_idc,lbCurSel _idc];
_Data       = lbData[_idc,lbCurSel _idc];
_Data   	= call compile _Data;
//systemChat format ["%1", _Data];
    _classN = _Data select 0;
    _plak   = _Data select 1;
    _fuel   = _Data select 2;
	_fuelCapa = ClassVeh_i(getNumber,_classN,"fuelCapacity");
	_litres = round(_fuelCapa * _fuel);

((findDisplay 1612172)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1.1' align='left'>Véhicule :<t/><t color='#F44100' size='1.1' align='right'>%1<t/><br/><t color='#FEFEFE' size='1.1' align='left'>Plaque :<t/><t color='#F44100' size='1.1' align='right'>%2<t/><br/><t color='#FEFEFE' size='1.1' align='left'>Réservoir :<t/><t color='#F44100' size='1.1' align='right'>%3.l/%4.l<t/><br/>", Real_NameVeh(_classN),_plak,_litres,_fuelCapa];