/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_countUnitOpenMap.sqf
*       compte le nombre d'ennemis sur la carte
*
*/
		_info = 0;
		_info = east countSide allUnits;
		[1,format ["Actuellement sur la map :\n %1\nOpfor sur la map", _info]]call DA3F_fnc_hint;
