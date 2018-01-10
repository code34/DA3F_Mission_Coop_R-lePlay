/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Pompe_interaction.sqf
*		Menu molette de la pompe de l'exploitation de petrole
*
*/

_this addAction ["<t color='#0193BF' size='1.1'>Lancer l'exploitation<t/>",DA3F_fnc_Expoitation_Petrol,nil,0,true,false,"","player distance _this < 4"];

_this addAction ["<t color='#0193BF' size='1.1'>Effectuer un chargement<t/>",DA3F_fnc_Expoitation_Petrol_Veh,nil,0,true,false,"","player distance _this < 4"];