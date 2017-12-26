/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       Cfg_Items.hpp
*       Création des items virtuel
*
*/
class DA3F_Cfg_Items_virt {

    class Obj_water
    {
        displayname         = "Petite(s) bouteille(s) d'eau"; // Nom de l'objet
        devise              = "€";                      // Devise de l'objet
        Price_Buy           = 10;                       // Prix d'achat
        Price_Sell          = 5;                        // Prix de vente
        Stats               = 20;                       // value de l'objet
        Poids               = 1;                       // value de l'objet
        icon                = "icons\ico_Items_water.paa";        // Chemin de l'image pour l'objet
    };

    class Obj_burger
    {
        displayname         = "Ration(s) alimentaire";              // Nom de l'objet
        devise              = "€";                      // Devise de l'objet
        Price_Buy           = 25;                       // Prix d'achat
        Price_Sell          = 10;                       // Prix de vente
        Stats               = 25;                       // value de l'objet
        Poids               = 1;                       // value de l'objet
        icon                = "icons\ico_Items_water.paa";        // Chemin de l'image pour l'objet
    };

    class Poudre_Noir
    {
        displayname         = "Poudre Noir";             // Nom de l'objet
        devise              = "€";                      // Devise de l'objet
        Price_Buy           = 23;                       // Prix d'achat
        Price_Sell          = 11;                       // Prix de vente
        Stats               = -1;                       // value de l'objet
        Poids               = 1;                       // value de l'objet
        icon                = "icons\ico_Items_water.paa";        // Chemin de l'image pour l'objet
    };

    class Carbu_Brute
    {
        displayname         = "Carburant";             // Nom de l'objet
        devise              = "€";                      // Devise de l'objet
        Price_Buy           = 50;                       // Prix d'achat
        Price_Sell          = 11;                       // Prix de vente
        Stats               = -1;                       // value de l'objet
        Poids               = 2;                       // value de l'objet
        icon                = "icons\ico_Items_water.paa";        // Chemin de l'image pour l'objet
    };
};