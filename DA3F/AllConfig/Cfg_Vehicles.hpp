/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Config.hpp
*       ???
*
*/
/*
Pour la configuration de tes shops véhicules passe par :
\DA3F\Shops\fn_Cfg_ShohVehinit.sqf
*/
/*
_text   = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
_number   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_FatigueActive");
_array   = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_listMrk");
*/
class DA3F_Cfg_Mrk_ShopsVeh {
MrkSp[] =
    {
        {"DA3F_Mrk_Sp_loc_0","Armée de l'air"},
        {"DA3F_Mrk_Sp_loc_1","Caserne de repos"},
        {"DA3F_Mrk_Sp_loc_2","Armée de terre"},
        {"DA3F_Mrk_Sp_loc_3","La marine - 41e flote d'Altis"}
    };
};

class DA3F_ShopsVeh {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */

    class WhiteList_Air {
        WhiteVeh[]  =   {
        "I_C_Plane_Civil_01_F",
        "C_Heli_light_01_ion_F",
        "B_Heli_Light_01_F"
        };
        WhiteSpe[]  =   {"PiloteP","Derogation"};
    };
    class Base_Terminal {
        side[] = {""};
        conditions = ""; //DA3F_Sp_Pilote
        vehicles[] = 
            {
                {"Car",
                    {"B_Quadbike_01_F",250,50,"€",""},
                    {"I_C_Van_02_transport_F",1100,500,"€",""},
                    {"I_C_Van_02_vehicle_F",1100,500,"€",""},
                    {"I_MRAP_03_F",1500,500,"€",""},
                    {"I_G_Offroad_01_F",1400,200,"€",""},
                    {"I_C_Offroad_02_unarmed_F",950,200,"€",""},
                    {"B_MRAP_01_hmg_F",5400,200,"€",""},
                    {"O_Truck_03_fuel_F",2400,200,"€",""},
                },
                {"Air",
                    {"I_C_Plane_Civil_01_F",3200,200,"€",""},
                    {"C_Heli_light_01_ion_F",3200,200,"€",""},
                    {"B_Heli_Light_01_F",3200,100,"€",""},
                    {"B_Heli_Light_01_dynamicLoadout_F",25000,100,"€","DA3F_Sp_Pilote"},
                    {"B_Heli_Transport_01_F",35000,100,"€","DA3F_Sp_Pilote"},
                    {"B_Heli_Transport_03_F",47000,100,"€","DA3F_Sp_Pilote"},
                    {"B_T_VTOL_01_infantry_F",52000,100,"€","DA3F_Sp_Pilote"},
                    {"B_T_VTOL_01_vehicle_F",52000,100,"€","DA3F_Sp_Pilote"},
                    {"B_T_VTOL_01_armed_F",75000,100,"€","DA3F_Sp_Pilote"},
                }/*
                ,
                {"Custom",
                    {"C_Heli_light_01_ion_F",3200,200,"€",""},
                    {"B_Heli_Light_01_F",3200,100,"€",""},
                    {"I_MRAP_03_F",1500,500,"€",""},
                    {"I_G_Offroad_01_F",1400,200,"€",""},
                    {"I_Truck_02_fuel_F",25000,200,"€",""},
                }*/
            };
        };

    class Base_Athira {
        side[] = {""};
        conditions = "";
        vehicles[] = 
            {
                {"Car",
                    {"B_Quadbike_01_F",250,50,"€",""},
                    {"I_C_Van_02_transport_F",1100,500,"€",""},
                    {"I_C_Van_02_vehicle_F",1100,500,"€",""},
                    {"I_MRAP_03_F",1500,500,"€",""},
                    {"I_G_Offroad_01_F",1400,200,"€",""},
                    {"I_C_Offroad_02_unarmed_F",950,200,"€",""},
                    {"B_MRAP_01_hmg_F",5400,200,"€",""},
                },
                {"Air",
                    {"I_C_Plane_Civil_01_F",3200,200,"€",""},
                    {"C_Heli_light_01_ion_F",3200,200,"€",""},
                    {"B_Heli_Light_01_F",3200,100,"€",""},
                    {"B_Heli_Light_01_dynamicLoadout_F",25000,100,"€","DA3F_Sp_PPro"},
                    {"B_Heli_Transport_01_F",35000,100,"€",""},
                    {"B_Heli_Transport_03_F",47000,100,"€",""},
                    {"B_T_VTOL_01_infantry_F",52000,100,"€",""},
                    {"B_T_VTOL_01_vehicle_F",52000,100,"€",""},
                    {"B_T_VTOL_01_armed_F",75000,100,"€",""},
                },
                {"Custom",
                    {"C_Heli_light_01_ion_F",3200,200,"€",""},
                    {"B_Heli_Light_01_F",3200,100,"€",""},
                    {"I_MRAP_03_F",1500,500,"€",""},
                    {"I_G_Offroad_01_F",1400,200,"€",""},
                    {"I_Truck_02_fuel_F",25000,200,"€",""},
                }
            };
        };
    
    };


/*
    _veh getVariable "DA3F_ID_Veh" // select 0 = ItemVirtSpace |  select 1 = Carburant 
*/

class DA3F_Cfg_Veh {
    
    class Default {
        ItemVirtSpace = 80;
        Carburant    = "Diesel"; // Type de carburant utilisé par le véhicule
        conditions = "";
        textures[] = {};
    };

    class B_MRAP_01_hmg_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class I_C_Van_02_vehicle_F
    {
        ItemVirtSpace       = 200; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class I_C_Van_02_transport_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class B_Truck_01_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class O_Truck_02_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class O_Truck_03_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class O_T_Truck_03_fuel_ghex_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class O_G_Van_01_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class B_G_Van_01_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class I_Truck_02_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class I_G_Van_01_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class C_Van_01_fuel_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class C_IDAP_Truck_02_water_F
    {
        ItemVirtSpace       = 250; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[]          = {};
    };

    class I_MRAP_03_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[] = {
                    { "Black", "civ",{"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"},""},
                    { "Orange Custom", "civ",{"#(argb,8,8,3)color(0.9,0.3,0.05,1)"},""}
        };
    };
    
    class I_G_Offroad_01_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[] = {
                    { "Black", "civ",{"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"},""},
                    { "Orange Custom", "civ",{"#(argb,8,8,3)color(0.9,0.3,0.05,1)"},""}
        };
    };
    
    class B_Heli_Light_01_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[] = {
                    { "Black", "civ",{"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"},""},
                    { "Orange Custom", "civ",{"#(argb,8,8,3)color(0.9,0.3,0.05,1)"},""}
        };
    };
    
    class C_Heli_light_01_ion_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[] = {
                    { "Black", "civ",{"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"},""},
                    { "Orange Custom", "civ",{"#(argb,8,8,3)color(0.9,0.3,0.05,1)"},""}
        };
    };
    
    class B_Heli_Transport_03_F
    {
        ItemVirtSpace       = 100; // Nombre d'emplacement du coffre virtuel
        OtherName           = ""; // Nom de l'objet
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
        textures[] = {
                    { "Black", "civ",{"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"},""},
                    { "Orange Custom", "civ",{"#(argb,8,8,3)color(0.9,0.3,0.05,1)"},""}
        };
    };
};