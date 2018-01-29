/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_Stop.sqf
*		fin de l'escorte
*
*/
 params
 [
 	["_target", objNull, [objNull]]
 ];

	[_target,false,player] remoteExecCall ["DA3F_fnc_Escorte_menottage",_target];
    hint "Cible menotté";
          [_target,"AmovPercMstpSnonWnonDnon_Ease"]spawn{
          _unit = _this select 0;
          _anime = _this select 1;
          sleep 0.1;
            while {_unit getVariable "DA3F_isRestain"} do {
              if !(animationState _unit isEqualTo _anime) then {
                _unit switchMove _anime;
              };
            };
          };

			if (DA3F_Item_menotte_1 >= 1) then {
			[false,"menotte_1",1]call DA3F_fnc_Inv_UpDown_Items;
			cursorObject setVariable ["DA3F_GetMenotte","menotte_1",true];
			};

			if (DA3F_Item_menotte_2 >= 1) then {
			[false,"menotte_2",1]call DA3F_fnc_Inv_UpDown_Items;
			cursorObject setVariable ["DA3F_GetMenotte","menotte_2",true];
			};
