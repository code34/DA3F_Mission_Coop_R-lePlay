/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Teleport.sqf
*		Teleport unit
*
*/
private ["_unit", "_inipos"];
closeDialog 0;
_unit = _this select 0;
if (isNil "_unit") then
    [{
        [1,"L'administrateur vous autorise une téléportation<br/>cliquez ou vous souhaitez être TP"]call DA3F_fnc_hint;
        openMap true;
        _inipos = getpos player;
        ValideTP= false;
        onMapSingleClick "player setpos _pos;ValideTP= true;onMapSingleClick ''; true";
        waitUntil
        {
            sleep .3;
            ValideTP
        };
        ValideTP=false;
        ValideTP=nil;
        openMap false;
    },{
        [1,"cliquez ou vous souhaitez faire le TP"]call DA3F_fnc_hint;
        openMap true;
        DA3F_unit = _unit;
        _inipos = getpos DA3F_unit;
        ValideTP= false;
        onMapSingleClick "DA3F_unit setpos _pos;ValideTP= true;onMapSingleClick ''; true";
        waitUntil
        {
            sleep .3;
            ValideTP
        };
        ValideTP = false;
        ValideTP = nil;
        openMap false;
    }];
