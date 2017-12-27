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
				lbSetData[1500,(lbSize 1500)-1,str[_pos,_txt]];
			} forEach DA3F_Save_Pos;
		}];
fnc_DA3F_ShowInfoPos={
	disableSerialization;
	_data = lbData[ctrlIDC(_this select 0),(_this select 1)];
	_arrInfo = call compile format ["%1", _data];
	_pos = _arrInfo select 0;
	_NamePos = _arrInfo select 1;
	[1,format ["Nom de la save :<br/> %2<br/><br/>position GPS :<br/> %1", _pos,_NamePos]]call DA3F_fnc_hint;
};