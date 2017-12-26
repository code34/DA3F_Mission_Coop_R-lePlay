/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShowCam.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
_arrayMrkSp	= Mrk_SpVeh_Cfg; // Macro no Global var
_InfoGui 	= _this select 0;
_type 		= _this select 1;
_idc 		= ctrlIDC (_InfoGui select 0);
_selectCat	= lbCurSel 2100;
_selectveh 	= lbCurSel 1500;
_selectMrk 	= lbCurSel 1501;
_display 	= findDisplay 1811173;
_Data       	= (lbData[1500,_selectveh]);
if !(_Data isEqualTo "") then {
	_Data 	= call compile _Data;
};

	_altitudeCam = 10;
	switch (str _idc) do {
	    case "1500": {

_Garage 	= lbText[2100,lbCurSel 2100];

	if (_Garage isEqualTo "Mon Garage") then
		[{
			_infos = DA3F_GarageUnit select _selectveh;
			_className 	= _infos select 0;
			_Camera_DA3F  = _display displayCtrl 1200;
    		_picture = getText(configFile >> "cfgVehicles" >> _className >> "picture");
			_Camera_DA3F ctrlSetText _picture;
		},{
			_veh = _Data select 0;
			_Camera_DA3F  = _display displayCtrl 1200;
    		_picture = getText(configFile >> "cfgVehicles" >> _veh >> "picture");
			_Camera_DA3F ctrlSetText _picture;
		}];

	    };
	    case "1501": {
    		_mrk 		= (_arrayMrkSp select _selectMrk) select 0;
    		_InfoZone 	= (_arrayMrkSp select _selectMrk) select 1;
    		hint format ["%1\n\n%2", markerText _mrk,_InfoZone];
    		[1,format ["%1",markerText _mrk,_InfoZone]]call DA3F_fnc_hint;
			_speed 		= 1.5;
			_zoom 		= 0.07;
			_position 	= getMarkerPos _mrk;
			_control 	= ((_display)displayCtrl 31400);
			_control ctrlMapAnimAdd[_speed,_zoom,_position];
			ctrlMapAnimCommit _control;

			_Camera_DA3F  = _display displayCtrl 1201;
			_Camera_DA3F ctrlSetText "#(argb,512,512,1)r2t(DA3F_ViewMrk,1)";
			if(!isPiPEnabled) exitWith {hint "PIP désactivé";};
				if(isNil "DA3F_CamVehView") then [{
				DA3F_CamVehView = "camera" camCreate [0,0,0];
				DA3F_CamVehView cameraEffect ["Internal", "Back", "DA3F_ViewMrk"];
				DA3F_CamVehView camcommit 0;
				"rtt" setPiPEffect [0];
				DA3F_CamVehView camSetPos [((getMarkerPos _mrk)select 0)+(2+(random 3)),((getMarkerPos _mrk)select 1)+(1 + random 3),((getMarkerPos _mrk)select 2)+(1 + (random _altitudeCam))];
				DA3F_CamVehView camSetTarget [((getMarkerPos _mrk)select 0),((getMarkerPos _mrk)select 1),((getMarkerPos _mrk)select 2)+0.5];
				DA3F_CamVehView camCommit 0;
	    },{
	    		DA3F_CamVehView cameraEffect ["terminate", "back"];
				camDestroy DA3F_CamVehView;
				DA3F_CamVehView = "camera" camCreate [0,0,0];
				DA3F_CamVehView cameraEffect ["Internal", "Back", "DA3F_ViewMrk"];
				DA3F_CamVehView camcommit 0;
				"rtt" setPiPEffect [0];
				DA3F_CamVehView camSetPos [((getMarkerPos _mrk)select 0)+(3+(random 3)),((getMarkerPos _mrk)select 1)+(3 + random 3),((getMarkerPos _mrk)select 2)+(1 + (random _altitudeCam))];
				DA3F_CamVehView camSetTarget [((getMarkerPos _mrk)select 0),((getMarkerPos _mrk)select 1),((getMarkerPos _mrk)select 2)+0.5];
				DA3F_CamVehView camCommit 0;
		}];
	};

	    default {
	     	if (true) exitWith {};
	    };
	};