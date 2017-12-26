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
Note à tous :
Salut à toi et bienvenu sur ma mission.
Pour être clair j'autorise l'utilisation et la modification des fichiers.
La seul chose demandé est de ne pas toucher à mes crédits (Signatures, commentaires (Toutes les zones comme celle-ci qui servent à l'échange))
Merci de ne pas garder les sources pour toi si l'on te demande,
ce n'est pas protéger mon travail mais y mettre un frein, je partage pour tous merci de ne pas nuir à ma démarche.
Bon jeu à tous !
-Aroun- (Dev'Arma 3 France) / http://www.devarma3france.fr/
*/

/*
Exemple vous permettant de rappeler vos infos dans un script (Renseignez le chemin des class puis votre variable) :
_text       = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission"); // exemple pour le nom de la mission
_number     = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Max_save_Veh");
_array      = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_listMrk");
*/
#define true 1
#define false 0

class DA3F_CfgMission {
    class DA3F_Infos
    {
        DA3F_NameMission        = "Mission Template"; // Nom de votre mission (Utilisé dans différents messages)
        DA3F_Adresse_TS         = "TS3: ts3.devarma3france.fr:12517"; // Adresse de votre Teamspeak (affiché dans la status barre)
        DA3F_Cash_Start         = 800; // Cash de départ
        DA3F_Bank_Start         = 2000; // Bank de départ
        DA3F_Bouf_Start         = 100; // Niveau de faim de départ (Max 100)
        DA3F_Soif_Start         = 100; // Niveau de soif de départ (Max 100)
        DA3F_Time_Respawn       = 20; // Time avant respawn (en secondes)
        DA3F_Time_DelCorps      = 10; // Time avant que le corps soit supprimé (en minutes)
        DA3F_Max_save_Veh       = 5; // Nombre de véhicules que le joueurs peut save. restez sur des petites valeurs (Max 15 [à tester selon votre serveur]) sur la version sans BDD. 
        DA3F_WinCash            = 100; // Prime de mort 
        cash_Bonus              = 100; // Prime multiplié par tranche de 100 m au dessus de 100 m 
        DA3F_cash_Food          = 100; // Prime multiplié par tranche de 100 m au dessus de 100 m 
        DA3F_FatigueActive      = 0; // 
        DA3F_MaxUnitsInMap      = 60; // Maximum d'unités Opfor sur la map (Bots)
        DA3F_MaxDistancePlayer  = 1500; // Distance de détection pour la supression des bots (si pas de joueur pas de bots sa sert à rien !)
        /* Ajoutez ici les markers que vous souhaitez avoir dans le menu de spawn */
        DA3F_Spawn[]            = 
            {
            /*
                {
                    "Nom du marker",
                    "Résumé/Titre",
                    "Déscription de la zone",
                    Radius autour du marker (valeur randomisé) - Zone dans la quelle le joueur spawn. 0 = sur le marker
                },
            */
                {
                    "DA3F_Spawn_1",
                    "Base aéroporté",
                    "La zone est sous notre contrôle mais nous ne sommes pas à l'abris de voir des troupes ennemis venir nous rendre visite",
                    0
                },
                {
                    "DA3F_Spawn_2",
                    "Base de soutient",
                    "C'est d'ici que les opérations débute",
                    0
                },
                {
                    "DA3F_Spawn_3",
                    "Caserne du cap",
                    "Il faut bien un peu de repos, la caserne est la pour ça",
                    0
                },
                {
                    "DA3F_Spawn_4",
                    "Base d'opération d'Athira",
                    "Petit camps permettant d'assurer une permanence dans l'OUEST de l'île",
                    0
                },
                {
                    "DA3F_Spawn_5",
                    "aéroport contesté",
                    "Attention cette zone est à l'ennemi soyez prudant en mettant les pieds là-bas !",
                    200
                }
            }; 
    };

    class DA3F_Spawn_Ennemy
    {
        DA3F_listMrk[]=
        {
            {"DA3F_SpUnitsCity_0",800}, // 
            {"DA3F_SpUnitsCity_1",600}, // 
            {"DA3F_SpUnitsCity_2",800}, // 
            {"DA3F_SpUnitsCity_3",600}, //
            {"DA3F_SpUnitsCity_5",600}, //
            {"DA3F_SpUnitsCity_6",800}, // 
            {"DA3F_SpUnitsCity_7",800}, // 
            {"DA3F_SpUnitsCity_8",800}, //
            {"DA3F_SpUnitsCity_9",600}, // 
            {"DA3F_SpUnitsCity_10",600}, // 
            {"DA3F_SpUnitsCity_11",600}, // 
            {"DA3F_SpUnitsCity_12",600}, // 
            {"DA3F_SpUnitsCity_13",800}, // 
            {"DA3F_SpUnitsCity_14",800}, //
            {"DA3F_SpUnitsCity_15",800}, //
            {"DA3F_SpUnitsCity_16",800}, // 
            {"DA3F_SpUnitsCity_17",600}, //
            {"DA3F_SpUnitsCity_18",600}, // 
            {"DA3F_SpUnitsCity_19",600}, // 
            {"DA3F_SpUnitsCity_20",800}, //
            {"DA3F_SpUnitsCity_21",600}, // 
            {"DA3F_SpUnitsCity_22",600}, // 
            {"DA3F_SpUnitsCity_23",600}, // 
            {"DA3F_SpUnitsCity_24",600}, // 
            {"DA3F_SpUnitsCity_25",800}, //
            {"DA3F_SpUnitsCity_26",800}, // 
            {"DA3F_SpUnitsCity_27",600}, //
            {"DA3F_SpUnitsCity_28",600}, // 
            {"DA3F_SpUnitsCity_29",600}, //  
            {"DA3F_SpUnitsCity_30",600}, //
            {"DA3F_SpUnitsCity_31",600} // 
        };
    };
};

/*
*
*   Initialisation des items virtuel
*   (Pas encore mis en place)
*
*/
#include "Cfg_Specialisation.hpp"
#include "Cfg_Items.hpp"
#include "Cfg_SpawnBase.hpp"
#include "Cfg_Base_Stats.hpp"
/*
class DA3F_Cfg_Vir_Items {
    class DA3F_Obj_water
    {
        var                 = "Water_1"; // Variable de l'objet
        displayname         = "Petite bouteille d'eau"; // Nom de l'objet
        Price_Buy           = 10; // Prix d'achat
        Price_Sell          = 5; // Prix de vente
        Stats               = 20; // value de l'objet
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
*/
