/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Cfg_DynMission.hpp
*       Configuration des missions dynamique 
*       Version : 0.1 / Tests
*
*/

class DA3F_Dyn_Mission {

    class Site_Crash
    {
        position[]          = 
            {
                {20925.8,19704.9},
                {2296.94,22184.1},
                {11040,8592.79},
                {18780.3,10186.5}
            };

        title               = "Site du crash";
        Description         = "Un crash a eu lieu<br/>Les renseignement nous livre que l'ennemi serait déjà sur place et a déployé un avant-post sur le site du crash";
        icon                = ""; // icons\ico_ItemsDefault.paa
        Max_units           = 35; // + nombre de joueurs
        vehicles_Active     = 1; // 0 = Pas de vehicules / 1 = vehicules présent
        Max_Vehicles        = 3;
        condition[]         = 
        {
            2, // -1 = random condition | 1 = Mort / 2 = Objet / etc
            {
            "Mort", // Mort des unités ennemis (définissez un valeur sur 'Min_Units' si utilisé)
            "Objet", // Action ajouté sur un objet permettant la validation de la mission (clear mission 5 min après)
            "Cible" // une cible parmis les ennemis sera votre objectif
            }; // ??? juste au cas ou ^^
        }; // ??? juste au cas ou ^^
        Objet_Exec[]        =
        {
            "Envoyer les infos de la boîte noire",
            {
                "[""Upload"",0.7,true] spawn DA3F_fnc_Progresse;",
                ""
            };
        };
        Min_Units           = 3; // Nombre d'unité ennemis max vivante pour validé la victoire (donc quand il reste 9 bots vivant la mission en victoir ) 
        Recompense[]        = 
        {
        -1,    // -1 = random recompense | 1 = cash / 2 = veh / etc
            {
                {"cash",
                    {
                        10000,
                        15000,
                        20000
                    },
                    "€"
                },
                {"veh",
                    {
                        "I_MRAP_03_hmg_F", // Strider HMG
                        "I_Truck_02_covered_F" // Zamak camo couvert
                    }
                },
                {"items",
                    {
                        {"Carbu_Brute",2},
                        {"Poudre_Noir",2}
                    }
                };
            };
        };

       Batiment[]       =
       {
            "Land_Cargo_Patrol_V2_F",
            "Land_BagBunker_Tower_F",
            "Land_Cargo_HQ_V3_F",
            "Land_CanvasCover_01_F"
       };     
    };

    class RechercheObserv
    {
        position[]          = 
            {
                {9211.19,19291},
                {7898.82,14614.1},
                {14550.5,23180.8},
                {18780.3,10186.5}
            };

        title               = "Recherche et Observation";
        Description         = "L'ennemi a monté un avant post dans une zone inattendu<br/>Les renseignement nous livre pense que une ligne de la blacklist serait sur place";
        icon                = ""; // icons\ico_ItemsDefault.paa
        Max_units           = 35; // + nombre de joueurs
        vehicles_Active     = 0; // 0 = Pas de vehicules / 1 = vehicules présent
        Max_Vehicles        = 3;
        condition[]         = 
        {
            3, // -1 = random condition | 1 = Mort / 2 = Objet / etc
            {
            "Mort", // Mort des unités ennemis (définissez un valeur sur 'Min_Units' si utilisé)
            "Objet", // Action ajouté sur un objet permettant la validation de la mission (clear mission 5 min après)
            "Cible" // une cible parmis les ennemis sera votre objectif
            }; // ??? juste au cas ou ^^
        }; // ??? juste au cas ou ^^
        Objet_Exec[]        =
        {
            "Infiltrer le réseau",
            {
                "[""Mouchard"",1.1,true] spawn DA3F_fnc_Progresse;",
                ""
            };
        };
        Min_Units           = 3; // Nombre d'unité ennemis max vivante pour validé la victoire (donc quand il reste 9 bots vivant la mission en victoir ) 
        Recompense[]        = 
        {
        1,    // -1 = random recompense | 1 = cash / 2 = veh / etc
            {
                {"cash",
                    {
                        25000,
                        30000,
                        35000
                    },
                    "Klix"
                },
                {"veh",
                    {
                        "I_MRAP_03_hmg_F", // Strider HMG
                        "I_Truck_02_covered_F" // Zamak camo couvert
                    }
                },
                {"items",
                    {
                        {"Carbu_Brute",5},
                        {"Poudre_Noir",2}
                    }
                };
            };
        };

       Batiment[]       =
       {
            "Land_Cargo_Patrol_V2_F",
            "Land_BagBunker_Tower_F",
            "Land_Cargo_HQ_V3_F",
            "Land_CanvasCover_01_F"
       };     
    };

    class InfoPrioritaire
    {
        position[]          = 
            {
                {9211.19,19291},
                {7898.82,14614.1},
                {14550.5,23180.8},
                {18780.3,10186.5}
            };

        title               = "Il nous faut cette info !";
        Description         = "Les renseignements nous indiquent avoir localisé un signal codé qui ne répond pas à notre chiffrement<br/> Ils nous demande de nous rendre sur place pour récolter plus d'informations et faire cesser l'émission de cette transmission";
        icon                = "\A3\ui_f\data\map\Diary\signal_ca.paa"; // icons\ico_ItemsDefault.paa
        Max_units           = 35; // + nombre de joueurs
        vehicles_Active     = 1; // 0 = Pas de vehicules / 1 = vehicules présent
        Max_Vehicles        = 3;
        condition[]         = 
        {
            2, // -1 = random condition | 1 = Mort / 2 = Objet / etc
            {
            "Mort", // Mort des unités ennemis (définissez un valeur sur 'Min_Units' si utilisé)
            "Objet", // Action ajouté sur un objet permettant la validation de la mission (clear mission 5 min après)
            "Cible" // une cible parmis les ennemis sera votre objectif
            }; // ??? juste au cas ou ^^
        }; // ??? juste au cas ou ^^
        Objet_Exec[]        =
        {
            "Mettre fin à la transmission",
            {
                "[""Redirection des IP :"",0.9,true] spawn DA3F_fnc_Progresse;",
                //"hint ""T'es trop fort !!\n t'as pas stoppé la transmission...\n Tu viens d'envoyer une balise d'urgence...\nCela veut dire que on va avoir de la visite très bientôt""",
                ""
            };
        };
        Min_Units           = 3; // Nombre d'unité ennemis max vivante pour validé la victoire (donc quand il reste 9 bots vivant la mission en victoir ) 
        Recompense[]        = 
        {
        2,    // -1 = random recompense | 1 = cash / 2 = veh / etc
            {
                {"cash",
                    {
                        2500,
                        3000,
                        3500
                    },
                    "Klix"
                },
                {"veh",
                    {
                        "I_MRAP_03_hmg_F", // Strider HMG
                        "I_MBT_03_cannon_F", // Kum (blindé)
                        "I_G_Offroad_01_armed_F" // pickup armé
                    }
                },
                {"items",
                    {
                        {"Carbu_Brute",2},
                        {"Poudre_Noir",2}
                    }
                };
            };
        };

       Batiment[]       =
       {
            "BlockConcrete_F",
            "Land_Dome_Small_F",
            "Land_Communication_F",
            "Land_TTowerBig_1_F",
            "Land_TTowerBig_2_F",
            "Land_TTowerBig_1_ruins_F",
            "Land_Cargo_Patrol_V2_F",
            "Land_BagBunker_Tower_F",
            "Land_Cargo_HQ_V3_F",
            "Land_CanvasCover_01_F"
       };     
    };
};