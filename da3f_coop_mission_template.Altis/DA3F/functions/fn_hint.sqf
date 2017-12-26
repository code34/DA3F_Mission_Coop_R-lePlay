/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_hint.sqf
*       Message player
*
*/
private ["_type","_msg","_name_mission"];
_type			= (_this select 0);
_msg			= (_this select 1);
_name_mission 	= getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");

switch (_type) do {
    case 0: {
		systemChat format ["%1 : %2",_name_mission,_msg];
    };
    case 1: {
		hintSilent parseText format ["<t color='#FE3800' size='1.3'>%1<t/><br/><br/><t color='#FEFEFE' size='1.1'>%2<t/>",_name_mission,_msg];
    };
    case 2: {
    	titleText [format["%1 : %2",_name_mission,_msg],"PLAIN",0];
    };
    default {
     	hintSilent parseText format ["<t color='#FE3800' size='1.3'>%1<t/><br/><br/><t color='#FEFEFE' size='1.1'>%2<t/>",_name_mission,_msg];
    };
};