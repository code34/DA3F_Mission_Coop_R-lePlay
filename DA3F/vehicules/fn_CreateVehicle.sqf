/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_CreateVehicle.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
disableSerialization;

_Data   = lbData[1500,lbCurSel 1500];
_Data   = call compile _Data;
    _classN = _Data select 0;
    _plak   = _Data select 1;
    _fuel   = _Data select 2;
    _pos    = _Data select 3;
    _dmg    = _Data select 4;
    _invV   = _Data select 5;
        _veh = _classN createVehicle [0,0,500];
        _veh allowDamage false;
        _veh setFuel _fuel;
        _side = switch (playerSide) do {case independent: {"Indep"};case west: {"west"};};
        [1,(getPlayerUID player),player,_side,ClassVeh(_classN),_plak] remoteExecCall ["DB_fnc_GetVehInGarage",2];
        _infos = [(getPlayerUID player),(name player),_plak];
        _veh setVariable ["DA3F_VehInfo",_infos,true];
        _veh setVariable ["DA3F_InvVirtVeh",_invV,true];
        if (typeName _pos isEqualTo "STRING") then
            [{
                _veh setPos getMarkerPos _pos;
            },{
                if (_pos isEqualType []) then {
                      _veh setPos _pos;
                };
            }];
        _veh allowDamage true;
if !(_dmg isEqualTo []) then {
    {
        [_veh,_x,(_dmg select _foreachindex)] call BIS_fnc_setHitPointDamage;
    } forEach ((getAllHitPointsDamage _veh)select 0);
};

        clearWeaponCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;

            _veh addEventHandler ["GetIn",{
                    _this spawn{
                    //hint format ["%1  %2  %3 ", typeOf (_this select 0), _this select 1, _this select 2];
                    _className  = typeOf (_this select 0);
                    _unit       = (_this select 2);
                    _typeVeh    = ClassVeh(_className);
                    _exit       = false;

                    if (_typeVeh isEqualTo "Air") then {
                        if ((_this select 1) isEqualTo "driver" && !DA3F_Sp_Pilote) then {
                            _exit       = true;
                    //  [1,"Tu n'est pas pilote"]call DA3F_fnc_hint;
                        };
                    };
                    if (_exit) exitWith {
                        [1,format["%1<br/>Tu n'est pas pilote",name _unit]]call DA3F_fnc_hint;
                        (driver (_this select 0)) action ["getout", (_this select 0)];
                        };
                    };
                }];
/*
        _veh addEventHandler ["Killed",{
        params
        [
            ["_veh",objNull,[objNull]],
            ["_killer",objNull,[objNull]]
        ];

_infos = _veh getVariable "DA3F_VehInfo";
_uid        = _infos select 0;
_proprio    = _infos select 1;
_plak       = _infos select 2;
[_uid,_plak] remoteExecCall ["DA3F_fnc_vehicleDelete",2];
}];
*/
    //    player setVariable ["yolo",_veh,false];
        closeDialog 0;
    /*
        act_yolo = player addAction ["Poser mon véhicule",{
        detach (player getVariable "yolo");
        player removeAction act_yolo;
        act_yolo = nil;
    },"",0,true,false,"",""];*/
