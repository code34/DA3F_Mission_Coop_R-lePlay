/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SoundVolume.sqf
*       Switch du niveau sonor
*
*/

_name_mission   = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
switch (soundVolume) do {
        case (1): {
           0.5 fadeSound 0.8;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
        case (.8): {
           0.5 fadeSound 0.6;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
        case (.6): {
           0.5 fadeSound 0.4;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
        case (.4): {
           0.5 fadeSound 0.2;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
        case (.2): {
           0.5 fadeSound 0.1;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
        case (.1): {
           0.5 fadeSound 1;
           systemChat format ["%1 : Volume environnant %2%3",_name_mission, (soundVolume * 100),"%"];
        };
    };