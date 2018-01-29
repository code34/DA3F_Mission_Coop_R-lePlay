/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_Freedom.sqf
*		fin de l'escorte
*
*/

_Target_escort = player getVariable ["DA3F_IsEscorting",objNull];
	detach _Target_escort;
		_Target_escort setVariable ["DA3F_isRestain",false,true];
		_Target_escort switchMove "AmovPercMstpSnonWnonDnon_EaseOut";

			cutText ["Fin de l'escorte","PLAIN DOWN",1];

				player setVariable ["DA3F_IsEscorting",nil,false];
				if (captive _Target_escort) then {
					_Target_escort setCaptive false;
				};
					(findDisplay 280118) closeDisplay 0;