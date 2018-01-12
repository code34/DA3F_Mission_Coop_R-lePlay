/*
*
*       Dev'Arma 3 France
*       Community Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Globalsound.sqf
*		Son global sur un objet
*
*/
params[["_obj",objNull,[objNull]],["_sound","",[""]]];
	if (isNull _obj) exitWith {};
	if (_sound isEqualTo "") exitWith {};
	if (player distance _obj > 1000) exitWith {};

	_obj say3D _sound;