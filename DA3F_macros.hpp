/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_macros.hpp
*		Déclaration des macros de la mission
*
*/
#define Mission_Cfg(TYPE,NameMission,SETTING) TYPE(missionConfigFile >> "DA3F_Dyn_Mission" >> NameMission >> SETTING)
#define Real_NameVeh(Class) getText(ConfigFile >> "CfgVehicles" >> Class >> "DisplayName")
#define ClassVeh(Class) getText(ConfigFile >> "CfgVehicles" >> Class >> "vehicleClass")
#define ClassVeh_i(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgVehicles" >> Class >> SETTING)
#define Veh_Cfg(TYPE,ClassName,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Veh" >> ClassName >> SETTING)
#define Mrk_SpVeh_Cfg (getArray(missionConfigFile >> "DA3F_Cfg_Mrk_ShopsVeh" >> "MrkSp"))
#define Concess_Cfg(TYPE,Shop,SETTING) TYPE(missionConfigFile >> "DA3F_ShopsVeh" >> Shop >> SETTING)
#define Bases_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Base_stats" >> Class >> SETTING)
#define Ranks_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Rank" >> Class >> SETTING)
#define DA3F_Cfg(TYPE,SETTING) TYPE(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> SETTING)
#define Spawn_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_SpawnBase" >> Class >> SETTING)
#define Items_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Items_virt" >> Class >> SETTING)
#define Shops_Items_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Shop_virt" >> Class >> SETTING)
#define MNS_Gvar_Items(itemName) missionNamespace getVariable format ["DA3F_Item_%1",itemName]
#define MNS_Svar_Items(itemName,val) missionNamespace setVariable [format ["DA3F_Item_%1",itemName],val]
#define Spe_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Spe" >> Class >> SETTING)
#define MNS_Gvar_Spe(var) missionNamespace getVariable format ["DA3F_Sp_%1",var]