/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ShopItemsVirt.sqf
*
*/
disableSerialization;
_index      = _this select 1;
_spe        = DA3F_All_Spe select _index;
_DescSpe    = getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "Desc");
_Price_Sell = getNumber	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "Price_Sell");
_devise		= getText	(MissionConfigFile >> "DA3F_Cfg_Spe" >> _spe >> "devise");
if (_DescSpe isEqualTo "") then [{
    _DescSpe = "Aucune description";
        ((findDisplay 10812172)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Center' >Description de la spécialisation<t/><br/><t color='#FEFEFE' size='1' align='Center' >%1<t/><br/><t color='#2A9DBE' size='1' align='Center' >Prix de revente<t/><br/><t color='#FEFEFE' size='1' align='Center' >%2%3<t/>",_DescSpe,_Price_Sell,_devise];
    },{
        ((findDisplay 10812172)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#2A9DBE' size='1.2' align='Center' >Description de la spécialisation<t/><br/><t color='#FEFEFE' size='1' align='Center' >%1<t/><br/><t color='#2A9DBE' size='1' align='Center' >Prix de revente<t/><br/><t color='#FEFEFE' size='1' align='Center' >%2%3<t/>",_DescSpe,_Price_Sell,_devise];
    }];