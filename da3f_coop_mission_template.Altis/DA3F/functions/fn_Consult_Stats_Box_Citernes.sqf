/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_WinKeysAction.sqf
*       Attribution des actions de la touche windows
*
*/
private ["_target","_Name_Var","_display","_showInfo","_contenu","_MaxCapa"];
disableSerialization;
if !(createDialog "Gui_Coms_Consult") exitWith {};
	_target		= (_this select 0);
	_Name_Var	= (_this select 1);
	_display 	= (findDisplay 121217);
	_showInfo 	= ((_display)displayCtrl 2010);
	_contenu 	= (_target getVariable _Name_Var)select 0;
	_MaxCapa 	= (_target getVariable _Name_Var)select 1;
		switch (_Name_Var) do {
		    case "DA3F_CoffreBase": {
				_showInfo ctrlSetStructuredText parseText format ["<t color='#F44100' size='1.4' align='center' >Stats du coffre <t/><br/><br/><br/><t color='#FEFEFE' size='1.6' align='center' >%1/%2<t/>", _contenu,_MaxCapa];
		    };
		    case "DA3F_CiterneBase": {
				_showInfo ctrlSetStructuredText parseText format ["<t color='#F44100' size='1.4' align='center' >Stats de la citerne <t/><br/><br/><br/><t color='#FEFEFE' size='1.6' align='center' >%1/%2<t/>", _contenu,_MaxCapa];
		    };
		};