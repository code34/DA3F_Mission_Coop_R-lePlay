/*
*
*       Dev'Arma 3 France
*       Mission Template
*       Original Author :
*			BangaBob
*       Edited by :
*			[DA3F] Aroun Le BriCodeur
*		fn_Spawn_Mrk_Units.sqf
*       Spawn Patrouille ennemy
*
*/
private ["_rebel","_mrk","_dist","_units","_numRebelMap","_val_Units"];
//DA3F_MaxUnitsInMap = 60;
_DA3F_UnitsInCity = [];
//DA3F_MaxDistancePlayer = 1500;

private _DA3F_MaxUnitsInMap = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_MaxUnitsInMap");
private _listMrk = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Spawn_Ennemy" >> "DA3F_listMrk");
_listMrk 	= _listMrk - ["respawn_guerrila",800];
for "_i" from 0 to 1 step 0 do
	{
	for "_a" from 0 to (count _listMrk -1) do
		{
	_mrk = (_listMrk select _a)select 0;
	_dist = (_listMrk select _a)select 1;
	_units = {(_x distance getMarkerPos _mrk < _dist)} count playableUnits;
	_numRebelMap = east countSide allUnits;
		if (_units > 0 && _numRebelMap < _DA3F_MaxUnitsInMap && ((random 100)< 65)) then
			{
				{
					if ((side _x)isEqualTo east) then {
						_DA3F_UnitsInCity pushBack _x;
					};
				} forEach (nearestObjects [(getMarkerPos _mrk),["man"],_dist]);
				if ((count _DA3F_UnitsInCity)< 20) then
					{
					_Type = ["Motorized_MTP","Support"];
						_randType = _Type call BIS_fnc_selectRandom;
						_spUnits = switch (_randType) do
						{
							case (_Type select 0):
							{
								"OIA_MotInf_AA";
							};

							case (_Type select 1):
							{
								"OI_support_ENG";
							};
						};
						_randTeamUnits = ["OIA_InfSquad_Weapons","OIA_InfAssault"] call BIS_fnc_selectRandom;


						_val_Units 	= (5 + (ceil (random 5)) + _units);
						_randomCalcul = ceil random 4;
						_randomPos	= switch (_randomCalcul) do {
						    case 1: {
						    	[(((getMarkerPos _mrk)select 0) + (random (_dist/2))),(((getMarkerPos _mrk)select 1)+ (random (_dist/2)))];
						    };
						    case 2: {
						    	[(((getMarkerPos _mrk)select 0) + (random (_dist/2))),(((getMarkerPos _mrk)select 1)- (random (_dist/2)))];
						    };
						    case 3: {
						    	[(((getMarkerPos _mrk)select 0) - (random (_dist/2))),(((getMarkerPos _mrk)select 1)+ (random (_dist/2)))];
						    };
						    case 4: {
						    	[(((getMarkerPos _mrk)select 0) - (random (_dist/2))),(((getMarkerPos _mrk)select 1)- (random (_dist/2)))];
						    };

						    default {
						     	getMarkerPos _mrk;
						    };
						};

						bots_reco = [_randomPos, east, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> _randType >> _spUnits)] call BIS_fnc_spawnGroup;
						bots_DA3F 	= [_randomPos, east,_val_Units] call BIS_fnc_spawnGroup;

						if !(_mrk in ["DA3F_SpUnitsCity_32"])then
							{
								_da3f=[_mrk]spawn DA3F_fnc_Spawn_House_Units;
						};

					[0,format["Des unités de la rebellions ont été aperçu en position %1 . Restez sur vor gardes !",mapGridPosition _randomPos]]remoteExecCall["DA3F_fnc_hint",0];
					private _prime	 	= 750 + round (random 750);
							{
								_x setVariable ["DA3F_BotRandom",true,true];
								_x setVariable ["DA3F_PrimeKill",[round(random _prime),"€"],true];
								_x addMPEventHandler ["mpkilled",{_this call DA3F_fnc_moneyEH;}];
								[_x]call DA3F_fnc_Delete_Units;
							} forEach (units group (leader bots_DA3F) + (units group (leader bots_reco)));

							{
								(leader _x) setVariable ["DA3F_BotRandom",true,true];
								(leader _x) setVariable ["DA3F_PrimeKill",[round(random (_prime*2)),selectRandom["€","Klix"]],true];
								//[bots_DA3F]execVM "DA3F\DA3F_Rebellions\patrol.sqf";
									[_x]call DA3F_fnc_patrol;
							}foreach [bots_reco,bots_DA3F];
								uisleep (150 + (random 150));
					};
			_DA3F_UnitsInCity = [];
	uisleep (60 + (random 60));
			};
		};
	uisleep (5 + (random 15));
	};
