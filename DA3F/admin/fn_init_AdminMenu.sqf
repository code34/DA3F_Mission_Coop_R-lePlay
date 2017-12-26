/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_init_AdminMenu.sqf
*		Admin menu V1
*
*/
disableSerialization;
if !(createDialog "DA3F_AdminMenu") exitWith {};
	_display = (findDisplay 2212172);

	// Liste joueurs
	{
		_unit 	= _x;
		_name 	= name _unit;
		_uid	= getPlayerUID _unit;
		_dist	= round(player distance _unit);
		_armeEnMain = currentWeapon _unit;
		_realNameWeap = getText(configFile >> "CfgWeapons" >> _armeEnMain >> "displayname");
		_menu	= format ["%1", _name,_realNameWeap,_dist];
		_add 	= lbAdd [1500,_menu];
		lbSetData [1500,(lbSize 1500)-1,str[_uid,_armeEnMain]];
	} forEach playableUnits;

	// Liste interactions
	{
		_add=lbAdd[1501,_x];
		lbSetData [1501,(lbSize 1501)-1,_x];
	} forEach
	[
		"Message All",
		"Téléport unit",
		"Remboursement",
		"Message",
		"Arsenal",
		"Heal",
		"God Mod",
		"Restauration (Faim/soif)",
		"Désarmer",
		"Restraindre",
		"Parachuter",
		"Plouf (Tp dans l'eau)",
		"Blesser",
		"Kill"
	];