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

    class Spawn_Base_recrutement
    {
        marker              = "DA3F_Spawn_0";               // Nom du marker *
        displayname         = "Centre de recrutement";           // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "Ici commence votre histoire";                           // Titre .. peut rester vide 
        Descrip             = "C'est à partir de cette base que vous recevrez votre affectation";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Armee_air
    {
        marker              = "DA3F_Spawn_1";               // Nom du marker *
        displayname         = "Armée de l'air";                   // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "Bataillon 747";                           // Titre .. peut rester vide 
        Descrip             = "Ceci est le centre opérationnel de l'armée de l'air";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Armee_terre
    {
        marker              = "DA3F_Spawn_2";               // Nom du marker *
        displayname         = "Armée de terre";             // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "11e Régiment du DA3F";             // Titre .. peut rester vide 
        Descrip             = "Ceci est le centre opérationnel de l'armée de terre";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_La_marine
    {
        marker              = "DA3F_Spawn_3";               // Nom du marker *
        displayname         = "La marine";  // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "41e flote d'Altis";                           // Titre .. peut rester vide 
        Descrip             =  "Ceci est le port d'attache de la marine";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

    class Spawn_Inde
    {
        marker              = "DA3F_Spawn_4";               // Nom du marker *
        displayname         = "Indépendance";          // Nom du spawn .. peut rester vide (Nom de la class sera par défault)
        Title               = "Serez-vous prêt ??";                           // Titre .. peut rester vide 
        Descrip             = "L'armée, l'autorité, c'est pas pour vous... Mais serez vous survivre dans cet environnement ? Vos actions en vers les autres seront décisive pour votre survie...";                           // Description de la zone ..  peut rester vide
        Sp_Radius           = 0;                           // Radius autour du marker dans le quel le joueur sera tp
        icon                = "icons\ico_ItemsDefault.paa";  // Chemin de l'image .. peut rester vide
    };

};