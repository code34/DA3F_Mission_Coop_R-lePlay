/*
*
*		[DA3F] Aroun Le BriCodeur
*		Mission Template
*		fn_DesignLaser_Mortier.sqf
*		...
*
*/
	disableSerialization;
	private _exit 	= false;
	private _title 	= "Localisation";
	private _TimeReloading = 30; // Temps en secondes
	_cpRate 		= 0.0025;

		if !(cameraView isEqualTo "GUNNER") exitWith {
		[1,format["<t size='1' color='#E31400'>Regarde en visé</t>",nil]]call DA3F_fnc_hint;
		};
		if (DA3F_IsReloadMortier) exitWith {
[1,format["<t size='1' color='#E31400'>Tu dois attendre la fin du rechargement</t>",nil]]call DA3F_fnc_hint;
};
	    if !(alive player) exitWith {};
	    if !(cursorTarget isEqualTo DA3F_Target) then {_exit = true};
	    if !(DA3F_IsKeyActived) then {_exit = true};
			if (_exit) exitWith {
				[1,"<t size='1' color='#E31400'>Tu dois viser ta cible jusqu'à la fin du chargement</t>"]call DA3F_fnc_hint;
				DA3F_IsAction = false;
				DA3F_cnt = 0.01;
			};

	DA3F_cnt = DA3F_cnt + _cpRate;
	[DA3F_cnt]spawn DA3F_fnc_UpdateProgress;