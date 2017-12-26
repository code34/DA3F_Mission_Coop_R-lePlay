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

((findDisplay 1612172)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1.1' align='left'>Véhicule :<t/><t color='#F44100' size='1.3' align='right'>%1<t/><br/><t color='#FEFEFE' size='1.1' align='left'>Plaque :<t/><t color='#F44100' size='1.3' align='right'>%2<t/><br/>", Real_NameVeh(_classN),_plak];