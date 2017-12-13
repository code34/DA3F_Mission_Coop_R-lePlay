/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_macros.hpp
*		Déclaration des macros de la mission
*
*/
#define Bases_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Base_stats" >> Class >> SETTING)
#define DA3F_Cfg(TYPE,SETTING) TYPE(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> SETTING)
#define Items_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Items_virt" >> Class >> SETTING)
#define MNS_Gvar_Items(itemName) missionNamespace getVariable format ["DA3F_Item_%1",itemName]
#define MNS_Svar_Items(itemName,val) missionNamespace setVariable [format ["DA3F_Item_%1",itemName],val]