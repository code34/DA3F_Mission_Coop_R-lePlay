/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_Apps.sqf
*       Ouverture de l'appli de messagerie
*
*/
private ["_historik","_display","_valmsg","_infos","_txt_Msg","_txt_News","_txt_close","_Edittxt","_ListUnits","_txt"];
    disableSerialization;
        if !(createDialog "Gui_Coms_inter") exitWith {};
            _historik   = player getVariable "DA3F_Save_Msg";
            _display    = (findDisplay 10712172);
            _valmsg     = (_display displayCtrl 2403);
            _infos      = (_display displayCtrl 2010);
            _txt_Msg    = (_display displayCtrl 1201);
            _txt_News   = (_display displayCtrl 1202);
            _txt_close  = (_display displayCtrl 1203);
            _Edittxt    = (_display displayCtrl 1400);
            _ListUnits  = (_display displayCtrl 2100);
            _txt        = "";
            _valmsg     ctrlShow false;
            _ListUnits  ctrlShow false;
            _Edittxt    ctrlShow false;
            if (_historik isEqualTo []) then
                [{
                    _infos ctrlSetStructuredText parseText format ["<t color='#000000' size='1.1' align='left' >Aucun correspondant<t/><br/><t color='#000000' size='1.1' align='Center' >Aucun message<t/>", nil];
                },{
                        {
                            _exped  = _x select 0;
                            _OldMsg = _x select 1;
                            _txt =_txt + format ["<t color='#017CB1' size='1.1' align='left' >%1<t/><br/><t color='#000000' size='1.1' align='Center' >%2<t/><br/><t color='#000000' size='1.1' align='Center' >-------------------<t/><br/>", _exped,_OldMsg];
                        } forEach _historik;
                    _infos ctrlSetStructuredText parseText format ["%1",_txt];
                }];

            _txt_Msg ctrlSetStructuredText parseText format ["<t color='#00F700' underline='true' size='1.1' >Conversations<t/>", nil];
            _txt_News ctrlSetStructuredText parseText format ["<t color='#FE0A26' underline='false' size='1.1' >Écrire un message<t/>", nil];
            _txt_close ctrlSetStructuredText parseText format ["<t color='#FF0000' underline='true' size='1.1' align='Center' >Fermer<t/>", nil];