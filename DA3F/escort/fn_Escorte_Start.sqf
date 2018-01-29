/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_Start.sqf
*		début de l'escorte
*
*/

if (isNil{cursorObject getVariable "DA3F_isRestain"}) exitWith {};
	if !(cursorObject getVariable "DA3F_isRestain") exitWith {};
		cursorObject attachTo [player,[0,1.4,0.1]];
		cutText ["Otage en escorte","PLAIN DOWN",1];
		player setVariable ["DA3F_IsEscorting",cursorObject,false];
		(findDisplay 280118) closeDisplay 0;