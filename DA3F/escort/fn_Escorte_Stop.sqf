/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_Stop.sqf
*		fin de l'escorte
*
*/

	{
	  detach _x;
	  _x switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
      _x setVariable ["DA3F_isRestain",false,true];
      if (captive _x) then {
      	_x setCaptive false;
      };
	} forEach attachedObjects player;
		player setVariable ["DA3F_IsEscorting",nil,false];
		(findDisplay 280118) closeDisplay 0;
			cutText ["Escorte stoppé","PLAIN DOWN",1];