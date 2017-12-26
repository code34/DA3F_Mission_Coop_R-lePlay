/*
*
*       Dev'Arma 3 France
*       Mission Template
*			[DA3F] Aroun Le BriCodeur
*		fn_Delete_Units.sqf
*       Spawn Patrouille ennemy
*
*/
_this spawn {
_DA3F_MaxDistancePlayer   = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_MaxDistancePlayer");
_rebel = (_this select 0);
	_units = {(_x distance getPos _rebel < _DA3F_MaxDistancePlayer)} count playableUnits;
	if (_units isEqualTo 0) then
		[{
			deleteVehicle _rebel;
		},{
			uisleep (30*2);
			[_rebel]call DA3F_fnc_Delete_Units;
		}];
	};