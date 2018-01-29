/*
*
*		[DA3F] Aroun Le BriCodeur
*		Mission Template
*		fn_Boom_Target.sqf
*		...
*
*/

	params[
	["_bombe",objNull,[objNull]],
	["_nrb",0,[0]],
	["_PosArrow",[],[[]]]
	];

	if (_PosArrow isEqualTo []) exitWith {[1,"Erreur de localisation"]call DA3F_fnc_hint;};
	if (_bombe isEqualTo objNull) exitWith {[1,"Erreur de chargement des munitions"]call DA3F_fnc_hint;};

	sleep (1 + random 1);

		_bombe setPos [(_PosArrow)select 0,(_PosArrow)select 1,400];
		_bombe setVelocity [random 5,random 10,-1000];

			waitUntil
			{
				sleep 0.02;
				(((getPos _bombe)select 2) < 30)
			};

		_bombe setPos [(_PosArrow)select 0,(_PosArrow)select 1,((getPos _bombe)select 2)];
		_bombe setVelocity [random 2,random 5,-1000];

		waitUntil {((getPos _bombe)select 2) <= 0.5};

		_bombe setDamage 1;
		_mrk_Mortier = createMarker ["markername",getPos _bombe];
		_mrk_Mortier setMarkerShape "ICON";
		_mrk_Mortier setMarkerType "hd_dot";
		_mrk_Mortier setMarkerText format["Mortier : %1",_nrb];
		sleep (8+random 3);
		deleteMarker _mrk_Mortier;
