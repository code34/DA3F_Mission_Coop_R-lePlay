/*
*
*       Dev'Arma 3 France
*       Mission template
*       [DA3F] Aroun Le BriCodeur
*       fn_DepotCash.sqf
*       Fichier temporaire pour permettre de déposer son cash
*
*/
_this spawn {
if (DA3F_Cash > 0) then [{
	DA3F_Bank = DA3F_Bank + DA3F_Cash;
	DA3F_Cash = 0;
	[1,"dépôt de votre cash"]call DA3F_fnc_hint;
},{
	[1,"Pour faire un dépôt c'est mieux d'avoir du cash"]call DA3F_fnc_hint;
}];
};