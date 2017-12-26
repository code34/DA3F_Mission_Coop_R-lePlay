/*
*       File: fn_TargetIdentity.sqf
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*
*/

if (cursorTarget isKindOf "Man") then
	[{
	_target = cursorTarget;
	_scrpt = ["Analyse : ",0.04,false] spawn DA3F_fnc_Progresse;
	waitUntil {scriptDone _scrpt};
	_is_YourName = "";
	if !(isNil{player getVariable "DA3F_WhatYourName"}) then [{
	if((name _target)isEqualTo (player getVariable "DA3F_WhatYourName"))then [{
		_is_YourName = _is_YourName + "Oui";
	},{
		_is_YourName = _is_YourName + "Non";
	}];
		[1,format ["Résultat de l'identification corporelle <br/><br/>Nom :%1<br/><br/>distance : %2m<br/><br/>Recherché : %3",name _target,round(player distance _target),_is_YourName]]call DA3F_fnc_hint;
	},{
		[1,"Aucune info"]call DA3F_fnc_hint;
	}];

	},{
		[1,"Visez votre cible correctement"]call DA3F_fnc_hint;
	}];