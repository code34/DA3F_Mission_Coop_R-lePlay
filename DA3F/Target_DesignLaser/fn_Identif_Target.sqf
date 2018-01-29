/*
*
*		[DA3F] Aroun Le BriCodeur
*		Mission Template
*		fn_Identif_Target.sqf
*		...
*
*/

	disableSerialization;
	_exit 	= false;
	_title 	= "Identification";
	if (DA3F_IsAction)exitWith{hintSilent "Tu dois attendre la fin de l'identification"};
		if !(cameraView isEqualTo "GUNNER") exitWith
			{
				hintSilent format ["Regarde en visé",nil];
			};

		if !(cursorTarget isKindOf "Man") exitWith
			{
				hintSilent format ["Uniquement sur des cibles humaines !",nil];
			};

	DA3F_IsAction = true;
	5 cutRsc ["DA3F_progress_Target","PLAIN"];
		_ui 			= uiNamespace getVariable "DA3F_progress_Target";
		_progressBar 	= _ui displayCtrl 3138201;
		_titleText 		= _ui displayCtrl 3138202;
		_BackG	 		= _ui displayCtrl 545465;
        _progressBar 	ctrlSetPosition [0.08140 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY];
        _titleText 		ctrlSetPosition [0.085 * safezoneW + safezoneX,0.828 * safezoneH + safezoneY];
        _progressBar 	ctrlCommit 0;
		_titleText 		ctrlCommit 0;
		_BackG			ctrlShow false;
		_cP 			= 0.01;
		_cpRate 		= 0.0085;
		_loop 			= 0.014;
		_cible 			= cursorTarget;

		_titleText ctrlSetStructuredText parseText format["%2 (1%1)","%",_title];
		_progressBar progressSetPosition 0.01;

			while {true} do
				{
				    sleep _loop;
				    if(isNull _ui) then {
				        5 cutRsc ["DA3F_progress_Target","PLAIN"];
				        _ui = uiNamespace getVariable "DA3F_progress_Target";
				        _progressBar 	= _ui displayCtrl 3138201;
				        _titleText 		= _ui displayCtrl 3138202;
						_BackG	 		= _ui displayCtrl 545465;
				        _progressBar ctrlSetPosition [0.45140 * safezoneW + safezoneX,0.39 * safezoneH + safezoneY];
				        _titleText ctrlSetPosition [0.5 * safezoneW + safezoneX,0.388 * safezoneH + safezoneY];
				        _progressBar ctrlCommit 0;
						_titleText ctrlCommit 0;
						_BackG			ctrlShow false;
				    };
				    _cP = _cP + _cpRate;
				    _progressBar progressSetPosition _cP;
				_titleText  ctrlSetStructuredText parseText format["<t size='1px' color='#FEFEFE'>%3 </t><t size='0.8px' color='#FF0000'>(%1%2)...</t>",round(_cP * 100),"%",_title];
				    if (_cP >= 1 OR !alive player) exitWith {};
				    if !(cursorTarget isEqualTo _cible) exitWith {_exit = true};
				};

				5 cutText ["","PLAIN"];
				player playActionNow "stop";

				DA3F_IsAction = false;
			if (_exit) exitWith {[1,"Tu dois viser ta cible jusqu'à la fin du chargement"]call DA3F_fnc_hint;};

				[1,format["Identification de :<br/>%1<br/><br/>distance de :<br/>%2m",name _cible,round(player distance _cible)]]call DA3F_fnc_hint;