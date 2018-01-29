/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_inv_Valide_ActionListBox.sqf
*		Validation des actions de la liste box menu I
*		_this call DA3F_fnc_inv_Valide_ActionListBox;
*/
	disableSerialization;
	_idc = ctrlIDC(_this select 0);
	_index = (_this select 1);
	_data = lbData[_idc,_index];
	switch (_data) do {
		case "Aide": {
		_msg = format ["Volume = (9 - ç)
		<br/>
Ejection pilote (Air) = Shift + H (! Au dessus de 160m !)
<br/>
Consomer items virtuel = Double clique <br/> ou <br/> Utiliser menu I
<br/>
Utiliser Trousse de soin ()  = Double clique <br/>",nil];
			[1,format ["%1", _msg]]call DA3F_fnc_hint;
		};
	    case "Messagerie": {
	    	closeDialog 0;
    		call DA3F_fnc_Coms_CallCo;
	    };
	    case "Save Posistion": {
	    	closeDialog 0;
	    	call DA3F_fnc_SpawnTemp;
	    };
	    case "Syncro de vos données": {
	    	closeDialog 0;
	    	[]spawn DA3F_fnc_SaveUnit;
	    };
	};