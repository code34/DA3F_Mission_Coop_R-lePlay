/*
    File: fn_insertVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the vehicle into the database
*/
private ["_query","_sql"];
params [
    "_uid",
    "_side",
    "_type",
    "_className",
    ["_color",-1,[0]],
    ["_plate","",[""]]
];

//Stop bad data being passed.
//if (_uid isEqualTo "" || _side isEqualTo "" || _type isEqualTo "" || _className isEqualTo "" || _color isEqualTo -1 || _plate isEqualTo "") exitWith {};
if (_uid isEqualTo "" || _side isEqualTo "" || _type isEqualTo "" || _className isEqualTo "" || _plate isEqualTo "") exitWith {};

_query = format ["INSERT INTO vehicles (side, classname, type, pid, alive, active, inventory, color, plak, gear, damage, fuel) VALUES ('%1', '%2', '%3', '%4', '1','1','""[[],0]""', '%5', '%6','""[]""','""[]""','1')",_side,_className,_type,_uid,_color,_plate];
[_query,1] call DB_fnc_asyncCall;