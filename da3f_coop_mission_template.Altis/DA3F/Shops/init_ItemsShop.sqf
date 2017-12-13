/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       init_ItemsShop.sqf
*
*/
[]spawn {
sleep 3;
_ret = [];
{
	_variable   = getArray(missionConfigFile >> "DA3F_Cfg_Vir_Items" >> str(configName _x) >> "var");
    missionNamespace setVariable [format ["Obj_virt_%1",_variable],0];
    _ret pushBack (missionNamespace getVariable format ["Obj_virt_%1",_variable]);
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Vir_Items"));
hint str _ret;
systemChat str _ret;
};