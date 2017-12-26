/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       configuration.sqf
*
*/

    disableSerialization;
	_idc		= ctrlIDC (_this select 0);
    switch (_idc) do {
        case 2421: {
			_index 		= lbCurSel 1501;
			if (_index isEqualTo -1)exitWith {};
	    	_item		= lbData [1501,(_index)];
			[_item]call DA3F_fnc_UseItems;
			closeDialog 0;
        };

        case 2401: {
		    _indexItem 	= lbCurSel 1500;
		    if (_indexItem isEqualTo -1)exitWith {};
		    _arrItem	= compile(lbData [1500,(_indexItem)]);
		    _arrItem	= call _arrItem;
		    _item		= _arrItem select 0;
		    [_item]call DA3F_fnc_UseItems;
		    closeDialog 0;
        };

        case 1500: {
		    _indexItem 	= lbCurSel 1500;
		    if (_indexItem isEqualTo -1)exitWith {};
		    _arrItem	= compile(lbData [1500,(_indexItem)]);
		    _arrItem	= call _arrItem;
		    _item		= _arrItem select 0;
		    [_item]call DA3F_fnc_UseItems;
		    closeDialog 0;
        };
    };