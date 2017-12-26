/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Shop_Specialisation.sqf
*
*/
disableSerialization;

if !(createDialog "Gui_Shop_Specialisation") exitWith {};
_display = (findDisplay 10812172);
((_display)displayCtrl 1100) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Left' >Liste des spécialisations<t/>",nil];
((_display)displayCtrl 1101) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Left' >Description :<t/>",nil];
((_display)displayCtrl 1102) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Left' >Vos spécialisations<t/>",nil];
((_display)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Center' >Attente de description<t/>",nil];
_All_Spe = [];
_All_Spe_Unit = [];
{
	_ID_Spe    	= (configName _x);
    _var        = getText   (_x >> "var");
    _NameSpe    = getText   (_x >> "displayname");
    _devise 	= getText	(_x >> "devise");
    _Prix_Achat = getNumber	(_x >> "Price_Buy");
    _Prix_Vente = getNumber	(_x >> "Price_Sell");
    _icon       = getText   (_x >> "icon");
    _desc       = getText	(_x >> "Desc");
    _ret 		= format ["%2%3 - %1", _NameSpe,_Prix_Achat,_devise];
    _Verif      = missionNamespace getVariable format ["DA3F_Sp_%1",_var];
    if !(_Prix_Achat isEqualTo -1) then {
        if !(_Verif) then {
            _add        = lbAdd[1500,_ret];
            _ctrl       = ((_display)displayCtrl 1500);
            _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
            _All_Spe pushBack _ID_Spe;
        };
    };
    //_All_Items pushBack (format ["DA3F_Item_%1",_varItems]);
    if (_Verif) then
    	{
		    _ret 		= format ["%1 - Prix Vente : %2%3", _NameSpe,_Prix_Vente,_devise];
            if !(_Prix_Vente isEqualTo -1) then {
		    _add		= lbAdd[1501,_ret];
			_ctrl 		= ((_display)displayCtrl 1501);
		    _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
            _All_Spe_Unit pushBack _ID_Spe;
            };
    	};
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Spe"));
missionNamespace setVariable ["DA3F_All_Spe",_All_Spe];
missionNamespace setVariable ["DA3F_All_Spe_Unit",_All_Spe_Unit];