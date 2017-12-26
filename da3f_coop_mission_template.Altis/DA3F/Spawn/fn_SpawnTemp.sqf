/*
*
*       Dev'Arma 3 France
*       The Survivors Rp
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnTemp.sqf
*       Téléportation du joueur sur le spawn sélectionné
*
*/
disableSerialization;
if !(createDialog "DA3F_menu_SpTemp") exitWith {};
	_display = (findDisplay 2611172);
	_cnt = (count DA3F_Save_Pos);

		if (_cnt isEqualTo 0) then [{
			_add=lbAdd[1500,"Aucune sauvgarde"];
		},{
			{
				_pos = _x select 0;
				_txt = _x select 1;
				_pos = mapGridPosition _pos;
				_ret = format ["Pos. GPS : %1 - Nom de la save : %2",_pos,_txt];
				_add=lbAdd[1500,_ret];
			} forEach DA3F_Save_Pos;
		}];