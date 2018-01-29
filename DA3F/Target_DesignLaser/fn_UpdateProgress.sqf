/*
*
*		[DA3F] Aroun Le BriCodeur
*		Mission Template
*		fn_UpdateProgress.sqf
*		...
*
*/
	disableSerialization;

		if (DA3F_IsReloadMortier) exitWith {};
	5 cutRsc ["DA3F_progress","PLAIN"];
		private _ui 			= uiNamespace getVariable "DA3F_progress";
		private _progressBar 	= _ui displayCtrl 3138201;
		private _titleText 		= _ui displayCtrl 3138202;
		private _BackG	 		= _ui displayCtrl 545465;
		private _exit 			= false;
		/*
		private _title 			= selectRandom(["Localisation","Calcule des axes","Calcule axe X","Calcule axe Y","Calcule du vent","Réception GPS","Activation des capteurs"]);
		*/
		private _title 			= "Calcule position";
		private _TimeReloading	= (2*60);

		_BackG			ctrlShow false;
        _progressBar 	ctrlSetPosition [0.08140 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY];
        _titleText 		ctrlSetPosition [0.085 * safezoneW + safezoneX,0.828 * safezoneH + safezoneY];
        _progressBar 	ctrlCommit 0;
		_titleText 		ctrlCommit 0;

			_progressBar progressSetPosition DA3F_cnt;
			_titleText  ctrlSetStructuredText parseText format["<t size='1px' color='#FEFEFE'>%3 </t><t size='0.8px' color='#FF0000'>(%1%2)...</t>",round(DA3F_cnt * 100),"%",_title];

	if (DA3F_cnt >= 1) exitWith {
    5 cutText ["","PLAIN"];
		DA3F_IsReloadMortier 	= true;
		DA3F_IsAction 			= false;
		DA3F_cnt 				= 0.1;

	6 cutRsc ["DA3F_progress","PLAIN"];
		private _title 	= "Envoi des infos";
		private _ui 			= uiNamespace getVariable "DA3F_progress";
		private _progressBar 	= _ui displayCtrl 3138201;
		private _titleText 		= _ui displayCtrl 3138202;
		private _BackG	 		= _ui displayCtrl 545465;
		private _cpRate 				= 0.0085;
		private _cp 					= 0.1;
		private _ArrowPos 				= getPos arrow;

		deleteVehicle arrow;
		DA3F_IsArrowActived = false;
		arrow = nil;
		_BackG			ctrlShow false;
        _progressBar 	ctrlSetPosition [0.08140 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY];
        _titleText 		ctrlSetPosition [0.085 * safezoneW + safezoneX,0.828 * safezoneH + safezoneY];
        _progressBar 	ctrlCommit 0;
		_titleText 		ctrlCommit 0;
		_progressBar progressSetPosition 0.1;

			while {true} do {
				sleep 0.035;
				_cp = _cp + _cpRate;
				_progressBar progressSetPosition _cp;
				_titleText  ctrlSetStructuredText parseText format["<t size='1px' color='#FEFEFE'>%3 </t><t size='0.8px' color='#FF0000'>(%1%2)...</t>",round(_cp * 100),"%",_title];
			    if (_cp >= 1) exitWith {};
			};

	6 cutText ["","PLAIN"];
				onEachFrame {};
["<t color='#E31400' size = '.8'>Localisation confirmé<br />Mortier en approche</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
	//	[1,format["<t size='1' color='#E31400'>Localisation envoyé</t>",nil]]call DA3F_fnc_hint;

					for "_a" from 1 to 5 do {
						private _Boom = "Bo_Mk82" createVehicle [0,0,300];
						[_Boom,_a,_ArrowPos]spawn DA3F_fnc_Boom_Target;
						sleep (.4 + random .3);
					};

				sleep _TimeReloading;

				DA3F_IsReloadMortier = false;
				[1,"<t size='1' color='#76D701'>Séction prêt au tir !<br/>Mortier disponible<t/>"]call DA3F_fnc_hint;
		};