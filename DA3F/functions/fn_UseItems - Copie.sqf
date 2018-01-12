/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Globalsound.sqf
*		Son global sur un objet
*       [_obj,_sound] remoteexeccall ["DA3F_fnc_Globalsound",-2];
*
*/
params[
["_obj", objNull, [objNull]],
["_sound", "", [""]]
];

if (isNull _obj OR _sound isEqualTo "") exitWith {};
if (player distance _obj > 250) exitWith {};
_obj say3D _sound;