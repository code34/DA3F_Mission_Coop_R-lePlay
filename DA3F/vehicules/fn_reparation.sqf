/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_reparation.sqf
*		Réparation partiel du vehicule
*
*/
disableSerialization;
_selectveh 		= lbCurSel 1500;
_Data       	= (lbData[1500,_selectveh]);
_list 			= nearestObjects [player,["car","air","ship","Tank"],40];
_veh 			= _list select _selectveh;
_uid 			= (_veh getVariable ["DA3F_VehInfo",[]])select 0;
_plak 			= (_veh getVariable ["DA3F_VehInfo",[]])select 2;
_noRep 			= false;
closeDialog 0;
_dmg = damage _veh;
_newDmg = 0;
if (_veh isKindOf "air") then [{
if (_dmg <= 0.6) then {[1,"Tu ne peux pas réparer ton véhicule d'avantage ici.<br/>Trouve un mécano qui fera le reste du travail"]call DA3F_fnc_hint;_noRep = true};
	_newDmg = _newDmg + 0.6;
},{
	if (_dmg <= 0.3) then {[1,"Tu ne peux pas réparer ton véhicule d'avantage ici.<br/>Trouve un mécano qui fera le reste du travail"]call DA3F_fnc_hint;_noRep = true};
	_newDmg = _newDmg + 0.4;
}];
if (DA3F_Bank < 2500) then {
	_noRep = true;
	[1,format["Tu manque de tunes !",_plak]]call DA3F_fnc_hint;
};
if (_noRep) exitWith {};
_rep = ["Réparation partiel",0.9] spawn DA3F_fnc_Progresse;
	waitUntil {sleep .5;scriptDone _rep};
_veh setDamage _newDmg;
	[1,format["Ton véhicule<br/>%1<br/>est en partie réparé",_plak]]call DA3F_fnc_hint;
