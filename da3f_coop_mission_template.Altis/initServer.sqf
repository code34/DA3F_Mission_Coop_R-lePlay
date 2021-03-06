/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       initServer.sqf
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
*
*/


if (!(_this select 0)) exitWith {}; //Not server
[] call compile preprocessFileLineNumbers "\da3f_cprp_serverside\init.sqf";
	[]spawn DA3F_fnc_Spawn_Mrk_Units;
	[]call DA3F_fnc_init_Base;

	[]spawn
	{
		{
			_mrk = format ["DA3F_Spawn_%1", _foreachindex];
				if !(_x isEqualTo _mrk) then
					{
					_x setMarkerAlpha 0;
				};
		} forEach allMapMarkers;
	};

[]spawn{
Crate_List = ["Citerne_Terminal_1","Citerne_Terminal_2","Citerne_Terminal_3","Coffre_Terminal_1","Silo_Terminal_1","Citerne_BaseOp_1","Citerne_BaseOp_2","Coffre_BaseOp_1","Silo_BaseOp_1"];
 publicVariable "Crate_list";
 [] remoteExecCall ["DA3F_fnc_SetData",2];
};
	execVM "DA3F\Ennemy\fn_Start_Mission.sqf";
