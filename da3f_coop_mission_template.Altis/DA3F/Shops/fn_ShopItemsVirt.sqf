/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShopItemsVirt.sqf
*
*/
disableSerialization;

if !(createDialog "Gui_Shop_Items_Virt") exitWith {};
_display = (findDisplay 1081217);
((_display)displayCtrl 1100) ctrlSetStructuredText parseText format ["<t color='#0CE109' size='1.2' align='center' >Boutique<t/>",nil];
_All_Items = [];
_All_Items_inv = [];
{
	_varItems	= (configName _x);
    _NameItems 	= getText	(_x >> "displayname");
    _devise 	= getText	(_x >> "devise");
    _Prix_Achat = getNumber	(_x >> "Price_Buy");
    _Prix_Vente = getNumber	(_x >> "Price_Sell");
    _icon	 	= getText	(_x >> "icon");
    _ret 		= format ["%2%3 - %1", _NameItems,_Prix_Achat,_devise];
    _add		= lbAdd[1500,_ret];
	_ctrl 		= ((findDisplay 1081217)displayCtrl 1500);
    _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
    _All_Items pushBack _varItems;
    //_All_Items pushBack (format ["DA3F_Item_%1",_varItems]);
    _nrbItem 		= missionNamespace getVariable format ["DA3F_Item_%1",_varItems];
    if ((_nrbItem)>0) then
    	{
		    _ret 		= format ["%3 X %1 - Prix Vente Total : %2%4", _NameItems,(_Prix_Vente * _nrbItem),_nrbItem,_devise];
		    _add		= lbAdd[1501,_ret];
			_ctrl 		= ((findDisplay 1081217)displayCtrl 1501);
		    _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
		    _All_Items_inv pushBack _varItems;
    	};
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));
missionNamespace setVariable ["DA3F_AllItems",_All_Items];
missionNamespace setVariable ["DA3F_AllItems_Inv",_All_Items_inv];