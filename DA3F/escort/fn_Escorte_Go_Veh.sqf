/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_Go_Veh.sqf
*		Escorte mis dans le véhicule le plus proche du joueurs
*
*/

private _veh = nearestObjects [player,["Air","Ship","Car","Tank","Support"],10]select 0;

	{
		if !(isNil{_x getVariable "DA3F_isRestain"}) then {
			if (_x getVariable "DA3F_isRestain") then {
				detach _x;
				sleep 0.1;
				_x switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
         		_x setVariable ["DA3F_isRestain",false,true];
				//[_x,false]call DA3F_fnc_menottage;
				sleep 0.1;
		  		_x moveInCargo [_veh, 1];
 _menotte = _x getVariable ["DA3F_GetMenotte","menotte_1"];
		  		[true,_menotte,1]call DA3F_fnc_Inv_UpDown_Items;
			};
		};
	} forEach attachedObjects player;

		(findDisplay 280118) closeDisplay 0;
