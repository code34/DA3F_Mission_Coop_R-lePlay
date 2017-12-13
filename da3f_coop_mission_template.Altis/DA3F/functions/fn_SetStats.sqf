/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SetStats.sqf
*       gestion de la faim et de la soif
*
*/
[] spawn {
private _time_loops = 300; // 5 min
private _name_mission = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
for "_w" from 0 to 1 step 0 do {
sleep _time_loops;
private _value_faim = (1 + (round (random 5))); // valeur conso de faim
private _value_soif = (2 + (round (random 10))); // valeur conso de soif
private _damg = damage player; // valeur conso de soif

	if (DA3F_Faim > 0) then [{
		DA3F_Faim = DA3F_Faim - _value_faim;
			if (DA3F_Faim < 15) then {
				hint format ["%1 : %2 Faites attention à votre faim !",_name_mission, name player];
				systemChat format ["%1 : %2 Faites attention à votre faim !",_name_mission, name player];
			};
},{
		if (DA3F_Faim <= 0) then {
			DA3F_Faim = 0;
				player setDamage (_damg + 0.05);
				systemChat format ["%1 : %2 vous mourrez de faim !",_name_mission, name player];
			};
		}];
sleep (15 + (random 15));
	if (DA3F_Soif > 0) then [{
		DA3F_Soif = DA3F_Soif - _value_soif;
			if (DA3F_Soif < 15) then {
				hint format ["%1 : %2 Faites attention à votre soif !",_name_mission, name player];
				systemChat format ["%1 : %2 Faites attention à votre soif !",_name_mission, name player];
			};
},{
		if (DA3F_Soif <= 0) then {
			DA3F_Soif = 0;
				player setDamage (_damg + 0.05);
				systemChat format ["%1 : %2 vous mourrez de soif !",_name_mission, name player];
			};
		}];
		call DA3F_fnc_SaveStats;
	};
};