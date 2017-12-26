/*
    File: fn_vehicleDelete.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Doesn't actually delete since we don't give our DB user that type of
    access so instead we set it to alive=0 so it never shows again.
*/
private ["_pid","_plak"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_plak = [_this,1,"",[""]] call BIS_fnc_param;

if (_pid isEqualTo "" || _plak isEqualTo "") exitWith {};
_unit = owner _unit;

_query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plak='""%2""'",_pid,_plak];

_thread = [_query,1] call DB_fnc_asyncCall;