/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Shop_Spe_BuySell.sqf
*
*/
_this spawn {
_type = _this select 1;
disableSerialization;
_display        = (findDisplay 10812172);
_index_Spe    	= (lbCurSel 1500);
_index_SpeUnit  = (lbCurSel 1501);
	switch (_type) do
	{
	    case 0:
	    {
			if (_index_Spe isEqualTo -1) exitWith {[1,"Sélectionne une spécialité"]call DA3F_fnc_hint};
			_spe           	= DA3F_All_Spe select _index_Spe;
			_verif          = missionNamespace getVariable format ["DA3F_Sp_%1",_spe];
			_var			= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "var");
			_NameSpe		= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "displayName");
			_price 			= getNumber	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "Price_Buy");
			_devise			= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "devise");
			if (DA3F_Cash < _price) exitWith {[1,format["Tu manque de cash <br/>%1%2",(DA3F_Cash - _price),_devise]]call DA3F_fnc_hint};
			DA3F_Cash = DA3F_Cash - _price;
			missionNamespace setVariable [format ["DA3F_Sp_%1",_var],true];
			[1,format["Vous avez acheté la spécialité  :<br/>%1<br/>Pour : %2%3",_NameSpe,_price,_devise]]call DA3F_fnc_hint;
			closeDialog 0;
			sleep 0.001;
			[]call DA3F_fnc_Shop_Specialisation;
	    };
	    case 1:
	    {
	    	if (_index_SpeUnit isEqualTo -1) exitWith {[1,"Sélectionne une spécialité"]call DA3F_fnc_hint};
	    	_spe			= DA3F_All_Spe_Unit select _index_SpeUnit;
			_verif          = missionNamespace getVariable format ["DA3F_Sp_%1",_spe];
			_var			= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "var");
			_NameSpe		= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "displayName");
			_price 			= getNumber	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "Price_Sell");
			_devise			= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "devise");
			DA3F_Cash = DA3F_Cash + _price;
			missionNamespace setVariable [format ["DA3F_Sp_%1",_var],false];
			[1,format["Vous avez vendu la spécialité :<br/>%1<br/>Pour : %2%3",_NameSpe,_price,_devise]]call DA3F_fnc_hint;
			closeDialog 0;
			sleep 0.001;
			[]call DA3F_fnc_Shop_Specialisation;
	    };
	    default {};
	};
};