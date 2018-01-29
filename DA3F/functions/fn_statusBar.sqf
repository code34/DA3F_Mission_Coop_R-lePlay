/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_statusBar.sqf
*       HUD player
*
*/

//waitUntil {DA3F_IsInitialisation};
_west = playersNumber west ; _east = playersNumber east ; _civ = playersNumber civilian ; hint format ["West:%1 East:%2, Civ:%3", _west, _east, _civ];
private ["_DA3F_Adresse_TS","_DA3F_NameMission","_rscLayer","_counter"];
disableSerialization;
_DA3F_Adresse_TS 	= getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Adresse_TS");
_DA3F_NameMission 	= getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
_rscLayer = "MCFStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["MCFStatusBar","PLAIN"];
	uisleep 2;
	/* ! Ne pas retirer Cette ligne ! */
	_DA3F_Original_Author 	= getText(missionConfigFile >> "DA3F_CfgAroun" >> "Aroun_Infos" >> "DA3F_Original_Author");
	systemChat format["Mission By %1 :: ts3.devarma3france.fr:12517",_DA3F_Original_Author]; // Ne pas retirer

	_counter = 360; // Temps en seconde avant reboot (Pas utiliser dans la barre actuel ajoutez %10 ) [Ne pas modif time uisleep !!]
	while {true} do
	{
		uisleep (1 + random 1);
		_DA3F_Faim = (round(DA3F_Faim));
		_DA3F_Soif = (round(DA3F_Soif));
		_DA3F_Damg = (round((damage player)*100));
		_counter = _counter - 1;
		if ((uiNamespace getVariable "MCFStatusBar") isEqualTo objNull) exitWith {[]spawn DA3F_fnc_statusBar};
		((uiNamespace getVariable "MCFStatusBar")displayCtrl 1000)ctrlSetText
    format["%9 : %1 | Fps: %2 | Argent: %3€ |  Banque: %11€  | Position: %4 | Faim : %5%7 | Soif : %6%7 | Morts total : %8",
		    _DA3F_Adresse_TS,
		    round diag_fps,
		    [DA3F_Cash] call DA3F_fnc_numberText,
		    mapGridPosition player,
		    _DA3F_Faim,
		    _DA3F_Soif,
		    "%",
		    CountKillUnits,
		    _DA3F_NameMission,
		    [_counter,"HH:MM:SS"]call bis_fnc_secondsToString,
		    [DA3F_Bank] call DA3F_fnc_numberText
    	];
	};















/*
_McfPic = "textures\logos\MCFWhite2.paa";
[
    '<img align=''right'' size=''3.8'' shadow=''3'' color=''#FECEBF''  image='+(str(_McfPic))+' />',
    safeZoneX+0.93,
    safeZoneY+safeZoneH-0.18,
    99999,
    0,
    0,
    3050
] spawn bis_fnc_dynamicText;
*/