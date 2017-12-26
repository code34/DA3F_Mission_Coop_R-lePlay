/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_rec.sqf
*       ...
*
*/
_this spawn
	{
	private ["_text","_edit","_mdp"];

	    disableSerialization;
	    _text = ctrlText 1400;
	    _edit = ((findDisplay 1071217)displayCtrl 1400);

	    if (_text isEqualTo "") exitWith {hint "Aucune donnée..."};

	    for "_a" from 0 to 1 do {
	    	_edit ctrlSetText "Identification";
	    	sleep 0.8;
	    	_edit ctrlSetText "Identification.";
	    	sleep 0.8;
	    	_edit ctrlSetText "Identification..";
	    	sleep 0.8;
	    	_edit ctrlSetText "Identification...";
	    	sleep 0.8;
	    };
	    _mdp = player getVariable "DA3F_Mdp_Co";
	    if (_text isEqualTo _mdp) then [{

	    	_edit ctrlSetText format["%1",name player];
	    	sleep 1.5;
	    	closeDialog 0;
	    	[]call DA3F_fnc_Coms_Apps;

	    		player setVariable ["DA3F_New_Co",true,false];
	    	[]spawn
	    	{
	    		DA3F_TimeNewCo = DA3F_TimeNewCo + (time + 60);
	    		waitUntil {time >= DA3F_TimeNewCo};
	    		player setVariable ["DA3F_New_Co",false,false];
	    	};
	    },{
	    	_edit ctrlSetText "Erreur.";
	    	sleep 2;
	    	_edit ctrlSetText format ["%1",_text];
		}];
    };