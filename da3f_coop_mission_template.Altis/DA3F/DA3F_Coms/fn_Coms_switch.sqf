/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_switch.sqf
*       Switch de l'interface Conversation/Nouveau message
*
*/

private ["_type","_display","_txt_Msg","_txt_News","_valmsg","_Showmsg","_Editmsg","_ListUnits"];
	disableSerialization;
	_type 		= _this select 0;
	_display    = (findDisplay 10712172);
	_txt_Msg    = (_display displayCtrl 1201);
	_txt_News   = (_display displayCtrl 1202);
    _valmsg     = (_display displayCtrl 2403);
    _Showmsg    = (_display displayCtrl 2300);
    _Editmsg    = (_display displayCtrl 1400);
    _ListUnits  = (_display displayCtrl 2100);

		switch (_type) do {
		    case 0:
		    {
	            _txt_Msg ctrlSetStructuredText parseText format ["<t color='#00F700' underline='true' size='.8' >Conversations<t/>", nil];
	            _txt_News ctrlSetStructuredText parseText format ["<t color='#FE0A26' underline='false' size='.8' >Écrire un message<t/>", nil];
            _valmsg 	ctrlShow false;
            _Showmsg 	ctrlShow true;
            _Editmsg 	ctrlShow false;
            _ListUnits  ctrlShow false;
		    };
		    case 1: {
	            _txt_Msg ctrlSetStructuredText parseText format ["<t color='#FE0A26' underline='false' size='.8' >Conversations<t/>", nil];
	            _txt_News ctrlSetStructuredText parseText format ["<t color='#00F700' underline='true' size='.8' >Écrire un message<t/>", nil];
            _valmsg 	ctrlShow true;
            _Editmsg 	ctrlShow true;
            _ListUnits  ctrlShow true;
            _Showmsg 	ctrlShow false;

            _Allunits = [];
            lbClear 2100;
	            {
	            	_Allunits pushBack _x;
	            	_add= lbAdd[2100,format ["%1", name _x]];
	            } forEach (playableUnits - [player]); // allUnits  <-- Utilisez pour des tests en éditeur (playableUnits n'est pas reconnu en local);
	            missionNamespace setVariable ["DA3F_ListUnit",_Allunits];
		    };
		};