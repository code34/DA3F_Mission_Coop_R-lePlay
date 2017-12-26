/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Units_Interaction.sqf
*       Affichage du menu joueur
*
*/
#include "..\..\DA3F_macros.hpp"
private ["_display","_items_Inv_player","_listeNearUnits","_txt"];
disableSerialization;
if !(createDialog "DA3F_menu_joueur") exitWith {};
_display            = (findDisplay 420000);
_items_Inv_player   = [];
_listeNearUnits     = nearestObjects [player,["Man"],6];
_arrayNearUnits     = [];
_txt                = "";
((findDisplay 420000)displayCtrl 2010)ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='left' >Aucune spécialisations<t/>",nil];

        /* affichage des items virtuel */
    _invVirt    = player getVariable "DA3F_InvVirt";
    _arrVirt    = _invVirt select 0;
    _MaxPoids   = _invVirt select 1;

    {
        _item       = _x select 0;
        _Nrbitem    = _x select 1;
        _NameItems  = Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
            _ret        = format ["%2 X %1", _NameItems,_Nrbitem];
            _add        = lbAdd[1501,_ret];
            lbSetData[1501,(lbSize 1501)-1,_item];
            _ctrl       = ((findDisplay 420000)displayCtrl 1501);
            _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
    } forEach _arrVirt;
/*
    {
    	_varItems	= (configName _x);
        _NameItems 	= getText	(_x >> "displayname");
        _devise 	= getText	(_x >> "devise");
        _Prix_Achat = getNumber	(_x >> "Price_Buy");
        _Prix_Vente = getNumber	(_x >> "Price_Sell");
        _icon	 	= getText	(_x >> "icon");

        _nrbItem 		= missionNamespace getVariable format ["DA3F_Item_%1",_varItems];
        if ((_nrbItem)>0) then
        	{
    		    _ret 		= format ["%2 X %1", _NameItems,_nrbItem];
    		    _add		= lbAdd[1501,_ret];
    			_ctrl 		= ((findDisplay 420000)displayCtrl 1501);
    		    _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
    		    _items_Inv_player pushBack _varItems;
        	};
    } forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));
*/
                /* affichage des spécialisations */
        {
            _ID_Spe     = (configName _x);
            _var        = getText   (_x >> "var");
            _NameSpe    = getText   (_x >> "displayname");
            _devise     = getText   (_x >> "devise");
            _Prix_Achat = getNumber (_x >> "Price_Buy");
            _Prix_Vente = getNumber (_x >> "Price_Sell");
            _icon       = getText   (_x >> "icon");
            _desc       = getText   (_x >> "Desc");
            _Verif      = missionNamespace getVariable format ["DA3F_Sp_%1",_var];
            if (_Verif) then
                {
                _txt = _txt + format ["%1<br/>",_NameSpe];
                };
        } forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Spe"));

                    /* Liste des unités autour du joueur */
            {
                _arrayNearUnits pushBack _x;
                _add=lbAdd[2100,name _x];
                _add=lbAdd[2101,name _x];
            } forEach _listeNearUnits;

                        /* Liste des actions */
                {
                	_add=lbAdd[1500,_x]
                } forEach [
                "Save position",
                "Messagerie",
                "Sauvegarder mes données" // Faites attention à ne pas mettre de virgule sur le dernier élément du tableau
                ];

   ((findDisplay 420000)displayCtrl 2010)ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='left' >Liste de vos spécialisations :<t/><br/><t color='#FEFEFE' size='1.2' align='Right' >%1<t/><br/>",_txt];
missionNamespace setVariable ["DA3F_arrayNearUnits",_arrayNearUnits];
missionNamespace setVariable ["DA3F_Items_Inv_Unit",_items_Inv_player];