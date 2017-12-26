/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShowInfoVehFuel.sqf
*
*/
	#include "..\..\DA3F_macros.hpp"
	disableSerialization;
	_idc 		= ctrlIDC (_this select 0);
	_index 		= (_this select 1);
	_infos 		= compile(lbData [_idc,_index]);
	_arrInfos	= call _infos;
	_ClassNveh	= _arrInfos select 0;
	_plak		= _arrInfos select 1;
	_litres		= _arrInfos select 2;
	_dis		= _arrInfos select 3;
	_NameVeh	= Real_NameVeh(_ClassNveh);
	_fuelCapa 	= ClassVeh_i(getNumber,_ClassNveh,"fuelCapacity");
	[1,format ["Véhicule : %1<br/>plaque : %2<br/>réservoir %3.L<br/>Capacité : %4.L", _NameVeh,_plak,_litres,_fuelCapa]]call DA3F_fnc_hint;
	_Vu_du_menu = format ["<t color='#FEFEFE' size='1.3' align='left' >Véhicule :<t/><t color='#F44100' size='1.5' align='center' >%1<t/><t color='#F44100' size='1.5' align='right' >%2.L / %5.L-Max.<t/><br/><t color='#FEFEFE' size='1.3' align='left' >Plaque :<t/><t color='#F44100' size='1.5' align='right' >%3<t/><br/><t color='#FEFEFE' size='1.3' align='left' >Distance :<t/><t color='#F44100' size='1.5' align='right' >%4m<t/><br/><br/>",_NameVeh,_litres,_plak,_dis,_fuelCapa];
	_Ctrl_txt = ((findDisplay 221217)displayCtrl 1100);
	_Ctrl_txt ctrlSetStructuredText parseText _Vu_du_menu;