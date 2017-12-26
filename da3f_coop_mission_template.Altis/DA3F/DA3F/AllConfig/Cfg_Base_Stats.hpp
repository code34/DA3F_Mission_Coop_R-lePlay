/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Cfg_Base_Stats.hpp
*       Cfg des bases 
*
*/

class DA3F_Cfg_Base_stats {

    class Base_1
    {        
        displayname         = "Terminal - Centre d'opération";  // Nom de la base
        side[]              = {"west","independent"};           // Définissez le camps dont la base dépendra (l'un ou l'autre ou les 2)
        marker              = "DA3F_Spawn_1";                   // Nom du marker 
        Name_Obj_Stat_Base  = "Pc_Base_1";                      // Nom de variable de l'objet recevant l'action des stats (ordinateur sur la mission)
        Obj_Stock_Items[]   = {"B_Slingload_01_Cargo_F"};       // Mettez les objets sur la quel l'action de stockage d'items virtuel sera dispo
        Obj_Stock_Carbu[]   = {"Land_Tank_rust_F"};             // Mettez les objets sur la quel l'action de stockage de carburant sera dispo
        containers_Max      = 5;                                // Nombre de containers de stockage physique
        citernes_Max        = 3;                                // Nombre de citernes autorisé au stockage sur la base
        Stock_Max_Carbut    = 2500;                             // Stockage maximum de carburant par citerne
        Stock_Max_Items     = 120;                              // Stockage maximum d'items par objet de stockage
        icon                = "icons\ico_ItemsDefault.paa";     // Chemin de l'image .. peut rester vide
    };

    class Base_2
    {        
        displayname         = "Terminal - Centre d'opération";  // Nom de la base
        side[]              = {"west","independent"};               // Définissez le camps dont la base dépendra (l'un ou l'autre ou les 2)
        marker              = "DA3F_Spawn_2";                   // Nom du marker 
        Name_Obj_Stat_Base  = "Pc_Base_2";                      //  Nom de variable de l'objet recevant l'action des stats (ordinateur sur la mission)
        Obj_Stock_Items[]   = {"B_Slingload_01_Cargo_F"};       // Mettez les objets sur la quel l'action de stockage d'items virtuel sera dispo
        Obj_Stock_Carbu[]   = {"Land_Tank_rust_F"};             // Mettez les objets sur la quel l'action de stockage de carburant sera dispo
        containers_Max      = 2;                                // Nombre de containers de stockage physique
        citernes_Max        = 3;                                // Nombre de citernes autorisé au stockage sur la base
        Stock_Max_Carbut    = 800;                              // Stockage maximum de carburant sur la base
        Stock_Max_Items     = 150;                              // Stockage maximum d'items sur la base
        icon                = "icons\ico_ItemsDefault.paa";     // Chemin de l'image .. peut rester vide
    };
};