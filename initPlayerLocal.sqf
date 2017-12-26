/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       initPlayerLocal.sqf
*		/////////////////\\\\\\\\\\\\\\\\\
*       Mission Template for community fr Arma 3
*		Version 0.0.1
*		Dev'Communautaire.
*		Open source by Aroun Le BriCodeur (MCF GaminG) | [GNU GENERAL PUBLIC LICENSE]
*		merci de partager le travail fait sur la mission sur le forum de notre site:
*		thank you for sharing the work done on the mission on the forum of our site:
*		http://devarma3france.fr
*		Si tu souhaite me soutenir de cette manière :
*		https://www.paypal.me/LeBriCodeur
*
*/
DA3F_IsInitialisation = false;
[]spawn
{
	cutText ["","BLACK"];
	[]execVM "DA3F\configuration.sqf";
};
//[]call DA3F_fnc_init_Units;
0=""spawn DA3F_fnc_esc_Menu;