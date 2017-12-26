/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_rec.sqf
*       ...
*
*/
	private ["_text","_array","_info","_nameList"];
	    disableSerialization;
	    _text = ctrlText 1400;
	    hintSilent str _text;
	    _array = player getVariable "DA3F_Save_Msg";
	    _info=[];
	    for "_a" from 0 to (count _array -1) do
	    	{
	    		_nameList = (_array select _a)select 0;
	    		_info pushBack _nameList;
	    	};
    	{
    		_line = _x;
			//_cut = _line splitString "";
    	} forEach _info;