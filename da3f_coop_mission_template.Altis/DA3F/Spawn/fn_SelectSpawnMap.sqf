/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SelectSpawnMap.sqf
*       Sélection du spawn
*
*/

disableSerialization;
_type = _this select 1;
private _text = "";
private _info = "";
switch (_type) do {
    case 0: {
		_display 	= (findDisplay 181117);
		_select_IDC = (_this select 0)select 1;
		_text 		= _text + (((_display)displayCtrl 1500) lbText _select_IDC);
		_speed 		= 1.5;
		_zoom 		= 0.07;
		_DA3F_listMrk   = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Spawn_Ennemy" >> "DA3F_listMrk");
		_select_Mrk = (_DA3F_listMrk select _select_IDC)select 0;
		_position 	= getMarkerPos _select_Mrk;
		_control 	= ((_display)displayCtrl 31400);

		_control ctrlMapAnimAdd[_speed,_zoom,_position];
		ctrlMapAnimCommit _control;
    };
    case 1: {
		_display 	= (findDisplay 221117);
		_select_IDC = (_this select 0)select 1;
		_DA3F_listMrk   = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Spawn");
		_txt_resume = (_DA3F_listMrk select _select_IDC)select 1;
		_txt_descri = (_DA3F_listMrk select _select_IDC)select 2;
		_text 		= _text + format ["%1<br/><br/>%2", _txt_resume,_txt_descri];
		hintSilent format ["%1 - %2", _txt_resume,_txt_descri];
		_speed 		= 1.5;
		_zoom 		= 0.06;
		_AllMrk 	= missionNamespace getVariable "DA3F_Mrk_Sp";
		_select_Mrk = (_AllMrk select _select_IDC)select 0;
		_position 	= getMarkerPos _select_Mrk;
		_control 	= ((_display)displayCtrl 31400);

		_control ctrlMapAnimAdd[_speed,_zoom,_position];
		ctrlMapAnimCommit _control;
    };
    case 2: {
		_display 		= (findDisplay 1091217);
		_select_IDC 	= (_this select 0)select 1;
		_DA3F_Class 	= DA3F_SpawnList select _select_IDC;
		_DA3F_Mrk  		= getText	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "marker");
		_NameSp			= getText	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "displayname");
		_txt_resume 	= getText	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "Title");
		_txt_descri 	= getText	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "Descrip");
		_Radius   		= getNumber	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "Sp_Radius");
		_icon   		= getText	(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> _DA3F_Class >> "icon");
		_txtMrk			= markerText _DA3F_Mrk;
		//_txt_resume = (_DA3F_listMrk select _select_IDC)select 1;
		//_txt_descri = (_DA3F_listMrk select _select_IDC)select 2;
		_text 		= _text + format ["%1<br/><br/>%2", _txt_resume,_txt_descri];
		[_DA3F_Mrk,_NameSp]call DA3F_fnc_Spawn_loadCamera;
			{
		    if (_x isEqualTo "") then
		    	{
		    	  _x = "Aucune info"
		    	};
	  		} forEach [_NameSp,_txt_resume,_txt_descri,_txtMrk];
		_info = _info + format ["<t color='#0082BA' align='center' size='1.1'>Info sur la position<t/><br/><t color='#FEFEFE' align='center' size='.9'>Texte marker<br/>%1<br/><br/>Nom du spawn :<br/>%2<br/><br/>Titre :<br/>%3<br/><br/>Description :<br/>%4<t/>",_txtMrk, _NameSp,_txt_resume,_txt_descri];
		((_display)displayCtrl 2010) ctrlSetStructuredText parseText format ["%1", _info];
		//hintSilent format ["%1 - %2", _txt_resume,_txt_descri];
		_speed 		= 1.5;
		_zoom 		= 0.06;
		_AllMrk 	= missionNamespace getVariable "DA3F_Mrk_Sp";
		_select_Mrk = (_AllMrk select _select_IDC)select 0;
		//_position 	= getMarkerPos _select_Mrk;
		_position 	= getMarkerPos _DA3F_Mrk;
		_control 	= ((_display)displayCtrl 31400);
		_control ctrlMapAnimAdd[_speed,_zoom,_position];
		ctrlMapAnimCommit _control;
    };
};
//[1,_text]call DA3F_fnc_hint;