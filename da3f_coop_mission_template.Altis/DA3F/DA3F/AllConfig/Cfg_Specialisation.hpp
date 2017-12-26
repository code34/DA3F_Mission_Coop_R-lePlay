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

class DA3F_Cfg_Spe {

    class 1erClasse
    {
        var                 = "1Clss";                         // Variable de la license
        displayname         = "1ère Classe";                         // Nom de la license
        Price_Buy           = -1;                             // Prix d'achat de la license  (-1 non visible dans le menu)
        Price_Sell          = -1;                               // Prix de vente de la license (-1 non visible dans le menu)
        devise              = "€";                              // Devise de la spe
        Desc                = "Vous voilà 1ère Classe ! Une longue route vous attends";                               // Description de la spécialisation
        icon                = "icons\ico_ItemsDefault.paa";     // Voir si on garde ???
    };

    class General
    {
        var                 = "Gen";                         // Variable de la license
        displayname         = "Général";                         // Nom de la license
        Price_Buy           = -1;                             // Prix d'achat de la license  (-1 non visible dans le menu)
        Price_Sell          = -1;                               // Prix de vente de la license (-1 non visible dans le menu)
        devise              = "€";                              // Devise de la spe
        Desc                = "Vous est maintenant Général ! Félicitation pour votre carrière";                               // Description de la spécialisation
        icon                = "icons\ico_ItemsDefault.paa";     // Voir si on garde ???
    };

    class Pilote
    {
        var                 = "Pilote";                         // Variable de la license
        displayname         = "Pilote";                         // Nom de la license
        Price_Buy           = 1500;                             // Prix d'achat de la license (-1 non visible dans le menu)
        Price_Sell          = 250;                               // Prix de vente de la license (-1 non visible dans le menu)
        devise              = "€";                              // Devise de la spe
        Desc                = "Vous devrez assurer une permanence de vol pour les autres unités";                               // Description de la spécialisation
        icon                = "icons\ico_ItemsDefault.paa";     // Voir si on garde ???
    };

    class Armurier
    {
        var                 = "ArmeM";                          // Variable de la license
        displayname         = "Armurier";                       // Nom de la license
        Price_Buy           = 950;                               // Prix d'achat de la license (-1 non visible dans le menu)
        Price_Sell          = 220;                               // Prix de vente de la license (-1 non visible dans le menu)
        devise              = "€";                              // Devise de la spe
        Desc                = "Vous devrez vous occuper de la logistique des troupes";                               // Description de la spécialisation
        icon                = "icons\ico_ItemsDefault.paa";     // Voir si on garde ???
    };
};