/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_Valide_Msg.sqf
*       ...
*
*/
private ["_destinataire","_text"];
_this spawn
	{
	    disableSerialization;
		if ((lbCurSel 2100)isEqualTo -1) exitWith {hint "Destinataire manquant"};
		    _destinataire 	= (DA3F_ListUnit select(lbCurSel 2100));
		    _text 			= ctrlText 1400;
	   		closeDialog 0;
	    	hint parseText format ["<t color='#FEFEFE' size='1.1' >Message envoyé à :<t/><br/><t color='#00F700' size='1.2' >%2<t/><br/><br/><t color='#FEFEFE' size='1' >%1<t/>", _text,name _destinataire];
	    sleep 1;
	   			[0,player,_text] remoteExecCall ["DA3F_fnc_Coms_Target",_destinataire];
    };