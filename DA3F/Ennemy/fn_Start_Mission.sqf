/*
*
*		[DA3F] Aroun Le BriCodeur
*		Mission Template
*		fn_Start_Mission.sqf
*		Mission dynamique (configuration : DA3F\AllConfig\Cfg_DynMission.hpp)
*
*/
if !(isServer) exitWith {}; // Dégage de la client !
#include "..\..\DA3F_macros.hpp"
private ["_condi","_Condition","_vicTyp"];
_AllMission = [];
{
	_AllMission pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Dyn_Mission"));
	/* Selection de la mission */
DA3F_NameClass_Mission 	= selectRandom _AllMission;
	/* Récupération des infos (Message aux joueurs) */
_random_iko = true;
_img 		= Mission_Cfg(getText,DA3F_NameClass_Mission,"icon");
_title 		= Mission_Cfg(getText,DA3F_NameClass_Mission,"title");
_Descrip	= Mission_Cfg(getText,DA3F_NameClass_Mission,"Description");
_position 	= Mission_Cfg(getArray,DA3F_NameClass_Mission,"position");
_pos 		= selectRandom(_position);
_Condition	= Mission_Cfg(getArray,DA3F_NameClass_Mission,"condition");
DA3F_Valide_Missio = false;
publicVariable "DA3F_Valide_Missio";
hintSilent str _Condition;
DA3F_futureDA3F_NameClass_Mission = time + (20*60);

	if ((_Condition select 0) isEqualTo -1) then
		[{
			_condi = selectRandom(_Condition select 1);
		},{
			_condi = (_Condition select 1) select ((_Condition select 0) -1);
		}];
_vicTyp		= switch (_condi) do {case "Mort": {"Faites le ménage sur la zone"};case "Objet": {"Trouver l'ordinateur"};case "Cible": {"Tuez le VIP"};
};
diag_log format ["DA3F - Dynamique mission : %1 [victoire type : %2 (%3)]", DA3F_NameClass_Mission,_vicTyp,_condi];
_msg		= "";
if (_random_iko) then {
_iko = selectRandom["dead","heli","signal"];
_img = [_iko]call DA3F_fnc_A3_Icons;
};

if (_img isEqualTo "") then
	[{
		_msg	=  _msg + format ["<t color='#F44100' size='1.5' >%1<t/><br/><br/><t color='#FEFEFE' size='1.1' >%2<br/><br/>Position GPS :<br/>%3<br/><br/>Objectifs :<br/><t/><t color='#C9341F' size='1.8' >%4<t/>",_title,_Descrip,(mapGridPosition _pos),_vicTyp];
	},{
		_msg	=  _msg + format ["<img size='4' image='%1' /><br/><br/><t color='#F44100' size='1.5' >%2<t/><br/><br/><t color='#FEFEFE' size='1.1' >%3<br/><br/>Position GPS :<br/>%4<br/><br/>Objectifs :<br/><t/><t color='#C9341F' size='1.8' >%5<t/>",_img,_title,_Descrip,(mapGridPosition _pos),_vicTyp];
	}];
[1,format ["%1", _msg]]remoteExecCall["DA3F_fnc_hint",-2];
//hint parseText format ["%1", _msg];

	/* Configuration de la mission */
_Max_units 	= Mission_Cfg(getNumber,DA3F_NameClass_Mission,"Max_units");
_vehAct 	= Mission_Cfg(getNumber,DA3F_NameClass_Mission,"vehicles_Active");
_Max_Veh 	= Mission_Cfg(getNumber,DA3F_NameClass_Mission,"Max_Vehicles");
_Victoir 	= Mission_Cfg(getArray,DA3F_NameClass_Mission,"Recompense");
_build 		= Mission_Cfg(getArray,DA3F_NameClass_Mission,"Batiment");
_Objet_Exec	= Mission_Cfg(getArray,DA3F_NameClass_Mission,"Objet_Exec");
// Position sur la quelle spawn le vehicule de récompense en cas de spawn occupé
_pos_defaut	= [14204.9,16351.1]; // Base terminal
_All_type 	= [];
_all_team	= [];
_all_build 	= [];
_stock 		= [];
_clearAll	= [];
		/*

			Spawn ennemis

		*/
	{
		_All_type pushBack (configName _x);
	} forEach ("true" configClasses (configfile >> "CfgGroups" >> "East" >> "OPF_F"));

	_All_type = _All_type - ["SpecOps"];
	_TypeGrp=(selectRandom(_All_type));

		if (_vehAct isEqualTo 1) then
			[{
				{
					_all_team pushBack (configName _x);
				} forEach ("true" configClasses (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> _TypeGrp));
			},{
				{
					_all_team pushBack (configName _x);
				} forEach ("true" configClasses (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry"));
			}];

				_mrk = createMarker [format ["%1", _pos],_pos];
				_mrk setMarkerShape "ICON";
				_mrk setMarkerType "hd_dot";
				_mrk setMarkerColor "ColorOrange";
				_mrk setMarkerText format ["%1 - %2",_title,_vicTyp];

				bots_reco = [_pos, east, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> _TypeGrp >> (selectRandom(_all_team)))] call BIS_fnc_spawnGroup;

				_TypeGrp=(selectRandom(_All_type));

	if (_vehAct isEqualTo 1) then
		[{
			{
				_all_team pushBack (configName _x);
			} forEach ("true" configClasses (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> _TypeGrp));
		},{
			{
				_all_team pushBack (configName _x);
			} forEach ("true" configClasses (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry"));
		}];

			bots_DA3F = [_pos, east, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> _TypeGrp >> (selectRandom(_all_team)))] call BIS_fnc_spawnGroup;

			_enmy = {
						alive _x &&
						_x distance _pos < 350 &&
						(side _x) isEqualTo east
					}count allUnits;
						if (_enmy < 10) then
						[{
							bots_Infant	= [_pos, east,(15 + (count playableUnits))] call BIS_fnc_spawnGroup;
						},{
							bots_Infant	= [_pos, east,(5 + (count playableUnits))] call BIS_fnc_spawnGroup;
						}];

						{
							_x allowDamage false;
						} forEach (nearestObjects [_pos,["Car","Tank"],400]);


		_prime		= 750;
			{
				_clearAll pushBack _x;
				_x setVariable ["DA3F_BotRandom",true,true];
				_x setVariable ["DA3F_PrimeKill",[(round random _prime),selectRandom["€","Klix"]],true];
				_x addMPEventHandler ["mpkilled",{_this call DA3F_fnc_moneyEH;}];
			//	[_x]call DA3F_fnc_Delete_Units;
			} forEach (units group (leader (bots_DA3F)) + (units group (leader (bots_reco)))+ (units group (leader (bots_Infant))));

			{
				(leader (_x)) setVariable ["DA3F_BotRandom",true,true];
				(leader (_x)) setVariable ["DA3F_PrimeKill",[(round random (_prime*2)),selectRandom["€","Klix"]],true];
				//[bots_DA3F]execVM "DA3F\DA3F_Rebellions\patrol.sqf";
					[_x]call DA3F_fnc_patrol;
			}foreach [bots_reco,bots_DA3F,bots_Infant];

			/*

				Spawn batiments

			*/
	_fnc_pos=
	{
		private _pos = (_this select 0);
		private _radius = (_this select 1);
		private _pos_1 = [(_pos select 0) + ceil(random _radius),(_pos select 1) + ceil(random _radius)];
		private _pos_2 = [(_pos select 0) - ceil(random _radius),(_pos select 1) - ceil(random _radius)];
		private _pos_3 = [(_pos select 0) - ceil(random _radius),(_pos select 1) + ceil(random _radius)];
		private _pos_4 = [(_pos select 0) + ceil(random _radius),(_pos select 1) - ceil(random _radius)];
		private _Allpos	= [_pos_1,_pos_2,_pos_3,_pos_4];
		_pos = selectRandom _Allpos;
		_pos;
	};

/*
// "Car"
	"Land_Wreck_UAZ_F",
	"Land_Wreck_Car_F",
	"Land_Wreck_Car2_F",
	"Land_Wreck_Van_F",
	"Land_Wreck_Skodovka_F",
*/
	if (DA3F_NameClass_Mission isEqualTo "Site_Crash") then
		{
		_model	= selectRandom
			[
				"B_T_VTOL_01_armed_F",
				"O_Heli_Attack_02_dynamicLoadout_F",
				"O_Heli_Transport_04_F"
			];

				_epave = _model createVehicle ([_pos,5] call _fnc_pos);
				_clearAll pushBack _epave;
				// Permet de rendre n'importe quel model en épave... Merci les load ^^
				_epave setDamage 1;
				_epave enableSimulation false;
				_epave setVariable ["DA3F_Mission_Buid",true,true];
				_fire_E = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
				_clearAll pushBack _fire_E;
				_fire_E setVariable ["DA3F_Mission_Buid",true,true];
				_fire_E attachTo [_epave,[0,1,-1]];
				detach _fire_E;
				[_epave,40,-62]call bis_fnc_setPitchBank;
				_getpitch = _epave call bis_fnc_getPitchBank;
				//systemChat format ["%1", _getpitch];

					for "_z" from 0 to 4 do
						{
						if (_z isEqualTo 0) then
							[{
							 _fire = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
							_fire setVariable ["DA3F_Mission_Buid",true,true];
							_clearAll pushBack _fire;
							_fire attachTo [_epave,[0,-1,-1]];
							detach _fire;
							},{
							 _fire = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
							_fire setVariable ["DA3F_Mission_Buid",true,true];
							_Npos	= [(getPos _epave),10] call _fnc_pos;
							_fire setPos _Npos;
							}];
						};
		};


		{
			_x allowDamage true;
		} forEach (nearestObjects [_pos,["Car","Tank"],400]);

			for "_a" from 0 to ((count _build)*3) do
				{
					_ClassName 	= selectRandom(_build);
					_Npos	= [getMarkerPos _mrk,(10 + round(random 40))] call _fnc_pos;
					waitUntil {!(isNil "_Npos")};
					_pos = _Npos;
					_Npos = nil;
		    		_check 	= nearestObjects [_pos,(["house","landvehicles","man"] + _build),25];

		    			if ((count _check) > 0) then
		    				{
		    				_Adddist = 0;
								waitUntil
								{
								_Npos	= [_pos,(10 + (round(random 40)) + _Adddist)] call _fnc_pos;
								_Adddist = _Adddist + 10;
								(count(nearestObjects [_Npos,(["house","landvehicles","man"] + _build),25])isEqualTo 0)
								};
								_pos = _Npos;
		    				};

		    				if (surfaceIsWater _pos) then {
		    					waitUntil
		    					{
		    						_Npos	= [_pos,(10 + round(random 40))] call _fnc_pos;
		    					!(surfaceIsWater _Npos)
		    					};
		    					_pos = _Npos;
		    				};

					_bati	= _ClassName createVehicle _pos;
					(Position _bati) params["_Ax","_y","_alti"];
					if (_alti > 0) then {
						_bati setPosATL [_Ax,_y,-0.5];
					};
					_all_build pushBack _bati;
					_clearAll pushBack _bati;
					_bati setVariable ["DA3F_Mission_Buid",true,true];
					//_bati setPosASLW getPosASLW _bati;
					_stock pushBack _pos;
					_bati setdir (random 359);
				};

			/*
				Condition de victoire
			*/

			switch (_condi) do
			{
			    case "Mort":
			    {
					waitUntil
					{
						_unitInPos = {
							alive _x &&
							_x distance (_stock select 0) < 350 &&
							(side _x) isEqualTo east &&
							!(isnil{_x getVariable "DA3F_BotRandom"})
						}count allUnits;
						(_unitInPos < (Mission_Cfg(getNumber,DA3F_NameClass_Mission,"Min_Units")))
					};
							DA3F_Valide_Missio = true;
							publicVariable "DA3F_Valide_Missio";
			    };

			    case "Objet":
			    {
			    	_near_obj 	= nearestObjects [(_stock select 0),["Land_BagBunker_Tower_F","Land_Cargo_HQ_V3_F","Land_CanvasCover_01_F"],350];
			    	_obj	= _near_obj select (floor(random(count _near_obj -1)));
			    	_PC 	= "Land_Laptop_device_F" createVehicle [0,0,50];
					_clearAll pushBack _PC;
			    	_PC attachTo [_obj,[0,0,0.1]];
			    	detach _PC;
			    	[4,_PC] remoteExecCall ["DA3F_fnc_ActTarget",-2];
			    };

			    case "Cible":
			    {
			    	_near_Target	= nearestObjects [(_stock select 0),["man"],350];
			    	_Target			= _near_Target select (floor(random(count _near_Target -1)));
			    	DA3F_Dead_list	= _Target;
			    	publicVariable "DA3F_Dead_list";
			    	_Target setVariable [format["DA3F_Target_%1",DA3F_NameClass_Mission],true,true];
			    	[5,player,"DA3F_WhatYourName",name _Target,false] remoteExecCall ["DA3F_fnc_ActTarget",-2];
			    	sleep ((2*60) + random 60);
			    	_title 		= "Information complémentaire";
					_Descrip 	= format ["Le nom de votre cible vient de tomber !!<br/> il sagit de <br/><br/><t color='#C9341F' size='1.8' >%1<t/>",name _Target];
			    	_img = ["signal"]call DA3F_fnc_A3_Icons;
					[1,format ["<img size='4' image='%1' /><br/><br/><t color='#F44100' size='1.5' >%2<t/><br/><br/><t color='#FEFEFE' size='1.1' >%3<t/>",_img,_title,_Descrip]]remoteExecCall["DA3F_fnc_hint",-2];
				    	[_Target] spawn
				    	{
			    			_cible 	 = (_this select 0);
			    			_Gpos 	 = getPos _cible;
		    					_mrk = createMarker [format ["%1", _Gpos],_Gpos];
								_mrk setMarkerShape "ICON";
								_mrk setMarkerType "Empty";
							//	_mrk setMarkerText format ["%1", name _cible];
					    		_cible setVariable ["DA3F_mrk_trgt",_mrk,true];
					    	//	cibleTar = _cible;

			    	[6,_cible] remoteExecCall ["DA3F_fnc_ActTarget",-2];
					    	waitUntil
					    	{
					    		_mrk setMarkerPos getPos _cible;
					    		!(alive _cible);
							};
							deleteMarker _mrk;
							DA3F_Valide_Missio = true;
							publicVariable "DA3F_Valide_Missio";
						};
			    };
			};

	/*

		Récompense

	*/

diag_log format ["DA3F - Dynamique mission : %1", DA3F_NameClass_Mission];
diag_log format ["DA3F - Dynamique mission : %1 Attente de victoire", diag_tickTime];
waitUntil
{
	DA3F_Valide_Missio
	Or
	time >= DA3F_futureDA3F_NameClass_Mission
};

		private _nearUnitsInZone = [];
	_units = {_nearUnitsInZone pushBack _x; alive _x && isPlayer _x && _x distance getMarkerPos _mrk < 500} count playableUnits;
	if (_units > 0 && !DA3F_Valide_Missio) then {
		    		[1,format ["Le temps de mission est allongé de 10min",nil]]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		    		[0,format ["Le temps de mission est allongé de 10min",nil]]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		    		sleep (10*60);
	};
diag_log format ["DA3F - Dynamique mission : %1 Condition OK time ou accompli", diag_tickTime];
	if !(DA3F_Valide_Missio) exitWith
		{
			sleep (5 + random 5);
			_rad = 200;
			_force = false;
			_wait = [_mrk,_clearAll,_stock,_rad,_force] spawn DA3F_fnc_ClearZone;
			waitUntil {sleep .3;scriptDone _wait};
			[]spawn{
			DA3F_Valide_Missio = false;
			publicVariable "DA3F_Valide_Missio";
			sleep (2*60);
			diag_log format ["DA3F - Dynamique mission : %1 New mission load", diag_tickTime];
			execVM "DA3F\Ennemy\fn_Start_Mission.sqf";
			};
			true;
		};

	_type_Victory 	= _Victoir select 0;
	_arr_Victory 	= _Victoir select 1;
		private ["_Victory","_Devise_Gain_victory"];
			if (_type_Victory isEqualTo -1) then
				[{
					_Victory = selectRandom(_arr_Victory);
				},{
					_Victory = _arr_Victory select (_type_Victory -1);
				}];

	_Get_Type_victory = _Victory select 0;
	_arr_Gain_victory = _Victory select 1;
	if (_type_Victory isEqualTo 1) then {
		_Devise_Gain_victory = _Victory select 2;
	};

		switch (_Get_Type_victory) do
		{
		    case "cash":
		    {
		    	_gain = selectRandom(_arr_Gain_victory);
		    	[7,1,_gain,_Devise_Gain_victory] remoteExecCall ["DA3F_fnc_ActTarget",_nearUnitsInZone];
		    };

		    case "veh":
		    {
		    	_pos	= _stock select 0;
		    	_gain 	= selectRandom(_arr_Gain_victory);
		    	_veh	= _gain createVehicle [0,0,5000];
		    	_veh allowDamage false;
		    	_near = nearestObjects [_pos,(["house","landvehicles","man"] + _build),10]select 0;
		    	if (isNil "_near") then
		    		[{
		    			_veh setPos [(_pos select 0) + (random 10),(_pos select 1) + (random 10),0.1];
		    				[1,format ["Un véhicule est disponible sur le site",nil]]call DA3F_fnc_hint;
		    		[1,format ["Un véhicule est disponible sur le site",nil]]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		    				_veh setVariable ["DA3F_Save_Me_Please",true,true];
		    		},{
	    			_veh setPos _pos_defaut;
		    		[1,format ["Un véhicule est a été déposé à la base<br/>position GPS<br/>%1",mapGridPosition(_pos_defaut)]]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		    		}];
		    	//[1,"Un véhicule est disponible sur le site"]remoteExecCall["DA3F_fnc_hint",-2];
		    	_veh allowDamage true;
		    };

		    case "items":
		    {
		    	_gain 		= selectRandom(_arr_Gain_victory);
		    	[7,2,_gain] remoteExecCall ["DA3F_fnc_ActTarget",_nearUnitsInZone];
		    };
		};

		[1,"Vous disposez de + ou - 3 min avant le nettoyage de la zone"]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		[0,"Vous disposez de + ou - 3 min avant le nettoyage de la zone"]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
			sleep ((2*60) + random (2*60));
			_rad = 200;
			_force = true;
		[1,"Nettoyage de la zone dans 10 sec"]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		[0,"Nettoyage de la zone dans 10 sec"]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
			sleep 10;
			_wait = [_mrk,_clearAll,_stock,_rad,_force] spawn DA3F_fnc_ClearZone;
			waitUntil {sleep .3;scriptDone _wait};
		[1,"Nettoyage de la zone"]remoteExecCall["DA3F_fnc_hint",_nearUnitsInZone];
		[0,"Nettoyage de la zone de mission"]remoteExecCall["DA3F_fnc_hint",-2];
		[]spawn{
		DA3F_Valide_Missio = false;
		publicVariable "DA3F_Valide_Missio";
		sleep (2*60);
			diag_log format ["DA3F - Dynamique mission : %1 New mission load", diag_tickTime];
		execVM "DA3F\Ennemy\fn_Start_Mission.sqf";
		};