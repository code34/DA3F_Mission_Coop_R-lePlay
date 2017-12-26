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
#define true 1
#define false 0

class DA3F_Cfg_Veh {
    
    class I_MRAP_03_F
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 15000; // Prix d'achat
        Price_Sell          = 5000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
    
    class I_G_Offroad_01_F
    {
        OtherName           = "4X4"; // Nom de l'objet
        Price_Buy           = 12500; // Prix d'achat
        Price_Sell          = 3250; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
    
    class B_Heli_Light_01_F
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 25000; // Prix d'achat
        Price_Sell          = 11000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
    
    class C_Heli_light_01_ion_F
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 25000; // Prix d'achat
        Price_Sell          = 11000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
    
    class DA3F_Hunter
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 15000; // Prix d'achat
        Price_Sell          = 5000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };

    class DA3F_Strider
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 15000; // Prix d'achat
        Price_Sell          = 5000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };

    class B_Heli_Transport_03_F
    {
        OtherName           = ""; // Nom de l'objet
        Price_Buy           = 35000; // Prix d'achat
        Price_Sell          = 15000; // Prix de vente
        Carburant           = "Diesel"; // Type de carburant utilisé par le véhicule
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
    class DA3F_Obj_burger
    {
        var                 = "burger_1"; // Variable de l'objet
        displayname         = "Humburger"; // Nom de l'objet
        Price_Buy           = 25; // Prix d'achat
        Price_Sell          = 10; // Prix de vente
        Stats               = 25; // value de l'objet
        icon                = "icons\water.paa"; // Chemin de l'image pour l'objet
    };
};