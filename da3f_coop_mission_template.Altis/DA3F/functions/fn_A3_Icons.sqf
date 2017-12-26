/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_A3_Icons.sqf
*		Utilisation des items virtuel
*
*/
_path = switch (_this select 0) do {
    case "dead": {"\A3\ui_f\data\map\Respawn\icon_dead_ca.paa"};
    case "veh": {"\A3\ui_f\data\map\VehicleIcons\pictureLogic_ca.paa"};
    case "para": {"\A3\ui_f\data\map\VehicleIcons\pictureParachute_ca.paa"};
    case "heli": {"\A3\ui_f\data\map\VehicleIcons\iconHelicopter_ca.paa"};
    case "signal": {"\A3\ui_f\data\map\Diary\signal_ca.paa"};

    default {"\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa"};
};
_path