/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_inv_UseItem.sqf
*		Utilisation item via inventaire I
*		[]call DA3F_fnc_inv_UseItem;
*/

    End_Action = false;
        _idc = ctrlIDC (_this select 0);
        _selectedIndex = _this select 1;
         _data = lbData [_idc, _selectedIndex];
/*
        _data = format ["Data\n%1\n________\n",lbData [_idc, _selectedIndex]];
        _text = format ["Text\n%1\n________\n",lbText [_idc, _selectedIndex]];
        _value = format ["Value\n%1\n________\n",lbValue [_idc, _selectedIndex]];
        //_pic = format ["Picture\n%1\n________\n",lbPicture [_idc, _selectedIndex]];
		_selected = format ["%1",((findDisplay 602)displayCtrl _idc) lbIsSelected _selectedIndex];
		_selectd = format ["%1",lbSelection  ((findDisplay 602)displayCtrl _idc)];
        _arr = getArray(configfile >> "CfgInventory" >> "SlotTypes" >> "RightHand");
        hint format["Inventaire: \n%1\n%2\n%3\n%4\n%5\n%6\n\n%7\n%8\n\n%9",_selectedIndex,_data,_text,_value,_selected,_selectd,_arr,_idc,[] call BIS_fnc_invSlotType];

*/
        if (isNil "DA3F_Dbl_clik") then [{
        	DA3F_Dbl_clik = false;
			_wait = time + 0.3;
			waitUntil {time >= _wait};
			DA3F_Dbl_clik = nil;
		},{
        if !(_data isEqualTo "") then [{
        	player removeItem format ["%1", lbData [_idc, _selectedIndex]];
        },{
		private _txt = lbText [_idc, _selectedIndex];
			{
			private _compar = _x;
			if (_compar isEqualTo "FirstAidKit") then
				{
					_compar = "1ers secours";
					closeDialog 0;
					if (vehicle player isEqualTo player) then [{
						_handle = ["Soin",0.08,false] spawn DA3F_fnc_Progresse;
					waitUntil {sleep .3; scriptDone _handle};
					},{
						_handle = ["Soin",0.12,false] spawn DA3F_fnc_Progresse;
					waitUntil {sleep .3; scriptDone _handle};
				}];
			};

					if !(End_Action) exitWith
						{
							systemChat format ["%1 Utilisé !",_compar];
							player setDamage 0;
							if ([_compar,_txt] call BIS_fnc_inString) then
								{
									player removeItem format ["%1", (items player) select _selectedIndex];
							};
						};
			}forEach (items player);
	    }];
	DA3F_Dbl_clik = nil;
}];
        false