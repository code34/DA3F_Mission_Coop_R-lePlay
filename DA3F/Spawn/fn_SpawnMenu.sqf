/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnMenu.sqf
*       Menu de spawn
*
*/
[]spawn {
private ["_display","_DA3F_listMrk","_spawn","_info","_spawn","_nameSpawn","_add"];

disableSerialization;
if !(createDialog "DA3F_SpawnMenu") exitWith {};
  if (DA3F_IsRespawn) then {
  call DA3F_fnc_RespawnUnit;
};
  cutText ["","BLACK",1];
_display        = (findDisplay 181117);
_DA3F_listMrk   = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Spawn_Ennemy" >> "DA3F_listMrk");
_spawn          = 0;
_info           = "";
_AllMrk         = [];

for "_a" from 0 to (count _DA3F_listMrk -1) do
  {
    _mrk = (_DA3F_listMrk select _a)select 0;
    _AllMrk pushBack _mrk;
  };

  {
    _spawn = _spawn + 1;
    _nameSpawn = markerText _x;
      if (isNil "_nameSpawn" Or _nameSpawn isEqualTo "") then
        {
          _nameSpawn = format ["Spawn n° - %1", _spawn];
        };
    _add=lbAdd[1500,_nameSpawn];
    lbSetData [1500,(lbSize 1500)-1,_x];
  } forEach _AllMrk;
// hint str _AllMrk; // Surveillence array
[(findDisplay 181117)]spawn{
disableSerialization;
waitUntil {isNull (_this select 0)};
cutText ["","BLACK IN",2];
  };
};