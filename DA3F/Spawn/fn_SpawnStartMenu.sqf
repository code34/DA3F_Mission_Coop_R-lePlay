/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SpawnStartMenu.sqf
*       Menu de spawn
*
*/
[]spawn {
if (isNil "DA3F_IsRespawn") then {
waitUntil {!(isNil "DA3F_IsRespawn")};
};
private ["_display","_DA3F_listMrk","_spawn","_info","_spawn","_nameSpawn","_add"];
disableSerialization;
closeDialog 0;
if !(createDialog "DA3F_NewStartMenu") exitWith {};
  if (DA3F_IsRespawn) then {
  call DA3F_fnc_RespawnUnit;
};
  cutText ["","BLACK",1];
_display        = (findDisplay 1091217);
_name_mission   = getText(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_NameMission");
//(_display displayCtrl 1100) ctrlSetStructuredText parseText format ["<b><t color='#FE3800' align='center' size='1'>%1<t/></b>",_name_mission];
_DA3F_listMrk   = getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Spawn");
_spawn          = 0;
_info           = "";
_AllMrk         = [];

((findDisplay 1091217) displayCtrl 1100) ctrlSetStructuredText parseText format ["<t color='#0082BA' align='left' size='1.1'>Attente des infos<t/>",nil];
(findDisplay 1091217) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Impossible de quitter le menu
for "_a" from 0 to (count _DA3F_listMrk -1) do
  {
    _mrk = (_DA3F_listMrk select _a)select 0;
    _InfosResume = (_DA3F_listMrk select _a)select 1;
    _InfosDescription = (_DA3F_listMrk select _a)select 2;
    _radius = (_DA3F_listMrk select _a)select 2;
    _AllMrk pushBack [_mrk,_InfosResume,_InfosDescription,_radius];
  };


//_Spawn_list = [];
{
    _NameClass    = (configName _x);
    _NameMarker   = getText (_x >> "marker");
    _nameSpawn    = getText (_x >> "displayname");
    _condition    = getText (_x >> "condition");
    _titre        = getText (_x >> "Title");
    _Description  = getText (_x >> "Descrip");
    _radius       = getNumber (_x >> "Sp_Radius");
    _icon         = getText (_x >> "icon");
    _txtMrk       = markerText _NameMarker;
  {
    if (_x isEqualTo "") then {
      _x = "Aucune info"
    };
  } forEach [_nameSpawn,_titre,_Description];
//_Spawn_list pushBack _NameClass;
//_AllMrk pushBack [_NameMarker,_titre,_Description,_radius];
if !(_condition isEqualTo "") then [{
    _condition = call compile format ["%1",_condition];
    if (_condition) then {
    _add=lbAdd[1500,format ["%1 - %2", _nameSpawn,_titre]];
    lbSetData[1500,(lbSize 1500)-1,_NameClass];
      _ctrl     = ((findDisplay 1091217)displayCtrl 1500);
      _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon]; //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
    };
},{
    _add=lbAdd[1500,format ["%1 - %2", _nameSpawn,_titre]];
    lbSetData[1500,(lbSize 1500)-1,_NameClass];
      _ctrl     = ((findDisplay 1091217)displayCtrl 1500);
      _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_icon];
}];

} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_SpawnBase"));
//missionNamespace setVariable ["DA3F_SpawnList",_Spawn_list];

/*
  {
    _spawn = _spawn + 1;
    _marker = (_x select 0);
    _InfosResume = (_x select 1);
    _InfosDescription = (_x select 2);
    _radius = (_x select 3);
    _nameSpawn = markerText _marker;
      if (isNil "_nameSpawn" Or _nameSpawn isEqualTo "") then
        {
          _nameSpawn = format ["Spawn n° - %1 - %2", _spawn,_InfosResume];
        };
    _add=lbAdd[1500,format ["%1 - %2", _nameSpawn,_InfosResume]];
  } forEach _AllMrk;
*/
  {
    _add=lbAdd[2100,_x]
  } forEach ["Au sol","Dans les airs"];
  {
    _add=lbAdd[2101,_x]
  } forEach ["200","300","400","500"];
// hint str _AllMrk; // Surveillence array
//missionNamespace setVariable ["DA3F_Mrk_Sp",_AllMrk];
[(findDisplay 1091217)]spawn{
disableSerialization;
waitUntil {isNull (_this select 0)};
cutText ["","BLACK IN",2];
  };
};

/*
***************************************************
                SPAWN MENU
                NEW VERSION
***************************************************
*//*
_Spawn_list = [];
{
    _NameClass    = (configName _x);
    _NameMarker   = getText (_x >> "marker");
    _nameSpawn    = getText (_x >> "displayname");
    _titre        = getText (_x >> "Title");
    _Description  = getText (_x >> "Descrip");
    _radius       = getNumber (_x >> "Sp_Radius");
    _icon         = getText (_x >> "icon");
    _txtMrk       = markerText _NameMarker;
  {
    if (_x isEqualTo "") then {
      _x = "Aucune info"
    };
  } forEach [_nameSpawn,_titre,_Description];
_Spawn_list pushBack _NameMarker;
    _AllMrk pushBack [_mrk,_InfosResume,_InfosDescription,_radius];

    _add=lbAdd[1500,format ["%1 - %2", _nameSpawn,_titre]];
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_SpawnBase"));
missionNamespace setVariable ["DA3F_SpawnList",_Spawn_list];*/
