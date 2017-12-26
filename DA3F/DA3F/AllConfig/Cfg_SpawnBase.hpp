/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Cfg_Items.hpp
*       Création des items virtuel
*
*/

class DA3F_Cfg_SpawnBase {

    class Spawn_Aeroport_Terminal
    {
        marker              = "DA3F_Spawn_1";               // Nom du marker *
        displayname         = "Terminal";                   // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "747";                           // Titre .. peut rester vide 
        Descrip             = "La zone est sous notre contrôle mais nous ne sommes pas à l'abris de voir des troupes ennemis venir nous rendre visite";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Base_secondaire
    {
        marker              = "DA3F_Spawn_2";               // Nom du marker *
        displayname         = "Base de soutient";           // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "Une base ou presque...";                           // Titre .. peut rester vide 
        Descrip             = "C'est d'ici que les opérations débute";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Caserne_du_cap
    {
        marker              = "DA3F_Spawn_3";               // Nom du marker *
        displayname         = "Caserne du cap";             // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "Ou sont les femmes ?";                           // Titre .. peut rester vide 
        Descrip             = "Il faut bien un peu de repos, la caserne est la pour ça";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Athira_Base
    {
        marker              = "DA3F_Spawn_4";               // Nom du marker *
        displayname         = "Base d'opération d'Athira";  // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "La planque";                           // Titre .. peut rester vide 
        Descrip             = "Petit camps permettant d'assurer une permanence dans l'OUEST de l'île";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Aeroport_contest
    {
        marker              = "DA3F_Spawn_5";               // Nom du marker *
        displayname         = "aéroport contesté";          // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "L'ennemi nous guête";                           // Titre .. peut rester vide 
        Descrip             = "Attention cette zone est à l'ennemi soyez prudant en mettant les pieds là-bas !";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 200;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

};