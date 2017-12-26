/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Cfg_Specialisation.hpp
*       Création des spécialisations
*       format sous le quel appeler les Spe en variable :
*       DA3F_Sp_ + Variable de la license (var)
*       Exemple class 1erClasse :
*       indicatif : (DA3F_Sp_) + var : (1Clss) | DA3F_Sp_1Clss 
*       Ajouter spécialité : DA3F_Sp_1Clss = true; 
*       Retirer spécialité : DA3F_Sp_1Clss = false;
*
*/

class DA3F_Cfg_Rank {

    class Inde
    {
        var                 = "Inde";                         // Variable de la license
        displayname         = "Sans armée";                         // Nom de la license
        requiLvl            = 0;                              // requiLvl de la spe
        Desc                = "Vous n'êtes dans aucune armée";   // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";     // Voir si on garde ???
    };

    class 1erClasse
    {
        var                 = "1Clss";                         // Variable de la license
        displayname         = "1ère Classe";                         // Nom de la license
        requiLvl            = 1;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        spe[]               = {};     // Spécialisation possible avec le grade
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";     // Voir si on garde ???
    };

    class Caporal
    {
        var                 = "Capo";                         // Variable de la license
        displayname         = "Caporal";                         // Nom de la license
        requiLvl            = 2;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";     // Voir si on garde ???
    };

    class sergeant
    {
        var                 = "serg";                         // Variable de la license
        displayname         = "Sergeant";                         // Nom de la license
        requiLvl            = 3;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa";     // Voir si on garde ???
    };

    class lieutenant
    {
        var                 = "lieu";                         // Variable de la license
        displayname         = "Lieutenant";                         // Nom de la license
        requiLvl            = 4;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa";     // Voir si on garde ???
    };

    class captain
    {
        var                 = "capi";                         // Variable de la license
        displayname         = "capitaine";                         // Nom de la license
        requiLvl            = 5;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa";     // Voir si on garde ???
    };

    class major
    {
        var                 = "major";                         // Variable de la license
        displayname         = "Major";                         // Nom de la license
        requiLvl            = 6;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa";     // Voir si on garde ???
    };

    class colonel
    {
        var                 = "colo";                         // Variable de la license
        displayname         = "Colonel";                         // Nom de la license
        requiLvl            = 7;                              // requiLvl de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa";     // Voir si on garde ???
    };

    class general
    {
        var                 = "Gen";                         // Variable de la license
        displayname         = "Général";                         // Nom de la license
        requiLvl            = 8;                              // requiLvl de la spe
        Desc                = "Vous est maintenant Général ! Félicitation pour votre carrière";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa";     // Voir si on garde ???
    };

    class etatMaj
    {
        var                 = "Et_Maj";                         // Variable de la license
        displayname         = "Etat Major";                         // Nom de la license
        requiLvl            = 9;                              // requiLvl de la spe
        Desc                = "Vous est maintenant dans l'état major ! Félicitation pour votre carrière. Vous êtes arrivé au rang le plus haut !";                               // Description de la spécialisation
        icon                = "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa";     // Voir si on garde ???
    };
};