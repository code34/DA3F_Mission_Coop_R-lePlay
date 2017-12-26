/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_DepotCash.sqf
*       Fichier temporaire pour permettre de régénérer faim et soif
*
*/
_this spawn {
_cash_Requis   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_cash_Food");
if (DA3F_Cash < _cash_Requis) exitWith {[1,format["Tu manque de cash.<br/>%1€", (DA3F_Cash - _cash_Requis)]]call DA3F_fnc_hint;};
	DA3F_Soif = DA3F_Soif + (10 + round(random 15));
	DA3F_Faim = DA3F_Faim + (10 + round(random 15));
	DA3F_Cash = DA3F_Cash - _cash_Requis;
	if (DA3F_Soif > 100) then {DA3F_Soif = 100;};
	if (DA3F_Faim > 100) then {DA3F_Faim = 100;};
	if (DA3F_Soif < 0) then {DA3F_Soif = 0;};
		if (DA3F_Faim < 0) then {DA3F_Faim = 0;};
	[1,"Vous venez de vous alimenter. Vous avez bu et mangé."]call DA3F_fnc_hint;
};