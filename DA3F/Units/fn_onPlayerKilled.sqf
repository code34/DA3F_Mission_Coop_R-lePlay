/*
*
*       Dev'Arma 3 France
*       Mission Template
*       Bryan "Tonic" Boardwine /  [DA3F] Aroun Le BriCodeur
*       fn_onPlayerKilled.sqf
*       Mort du joueur
*
*/
#include "..\..\DA3F_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

_unit setVariable ["Revive",true,true];
DA3F_CamKilled  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
DA3F_CamKilled cameraEffect ["Internal","Back"];
createDialog "DA3F_DeathMenu";
DA3F_CamKilled camSetTarget _unit;
DA3F_CamKilled camSetRelPos [0,3.5,4.5];
DA3F_CamKilled camSetFOV .5;
DA3F_CamKilled camSetFocus [50,0];
DA3F_CamKilled camCommit 0;

(findDisplay 1811172) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];  //Impossible de quitter le menu

[_unit,_killer] spawn {
    private ["_maxTime","_RespawnBtn","_Timer","_Killed_Time"];
    _unit = (_this select 0);
    _killer = (_this select 1);
    disableSerialization;
    _RespawnBtn     = ((findDisplay 1811172) displayCtrl 2401);
    _BackLobby      = ((findDisplay 1811172) displayCtrl 2402);
    _Timer          = ((findDisplay 1811172) displayCtrl 1101);
    _InfoKiller     = ((findDisplay 1811172) displayCtrl 1100);
    _weapKil        = currentWeapon _killer;
    _nameWeap       = getText(configFile >> "CfgWeapons" >> _weapKil >> "displayname");
    _Killed_Time    = getNumber(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Infos" >> "DA3F_Time_Respawn");
    _BackLobby      ctrlEnable false;
    _RespawnBtn     ctrlEnable false;
    _InfoKiller ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY, 0.185625 * safezoneW,0.150 * safezoneH]; //
    _Timer ctrlSetPosition [0.335 * safezoneW + safezoneX,0.775 * safezoneH + safezoneY,0.33 * safezoneW,0.077 * safezoneH];
    _NameKiler = name _killer;
    if (_NameKiler isEqualTo "Error: No unit" || _NameKiler isEqualTo (name player)) then {
        _NameKiler = "Suicide";
    };
    _InfoKiller ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1.3' align='Left' >Tireur :<t/><t color='#E1090C' align='center' size='1.3' > %1<t/><br/><t color='#FEFEFE'  align='Left' size='1.3' >Distance :<t/><t color='#E1090C' align='center' size='1.3' > %2m<t/><br/><t color='#FEFEFE'  align='Left' size='1.3' >Arme :<t/><t color='#E1090C' align='center' size='1.3' > %3<t/><br/><t color='#FEFEFE' align='Left' size='1.3' >Position :<t/><t color='#E1090C' align='center' size='1.3' > %4<t/>",_NameKiler,round(_unit distance _killer),_nameWeap,mapGridPosition _killer];
    _InfoKiller ctrlCommit 1;
    _Timer ctrlCommit 1;
    sleep 1;
        if (_Killed_Time < 5) then {
            DA3F_RespawnTime = time + 5;
        } else {
            DA3F_RespawnTime = time + _Killed_Time;
        };

    waitUntil
        {
            _Timer ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='2.5' align='center' >Temps restant :<t/><t color='#E1090C' align='center' size='2.6' > %1<t/>",[(DA3F_RespawnTime - time),"MM:SS"] call BIS_fnc_secondsToString];
            round(DA3F_RespawnTime - time) <= 0 || isNull _unit
        };
            _RespawnBtn ctrlEnable true;
            _BackLobby ctrlEnable true;
            _Timer ctrlSetStructuredText parseText format ["<t color='#0CE109' size='2.5' align='center' >Vous pouvez respawn<t/>",nil];
    };

_unit spawn {

   private _inventory  = [];
   private _poids      = 0;

sleep 0.1;

    {
        if (MNS_Gvar_Items(configName _x) > 0) then {
            _inventory pushBack [(configName _x),MNS_Gvar_Items(configName _x)];
            _itemPoids = ([(configName _x)]call DA3F_fnc_Inv_Items_Poids) * (MNS_Gvar_Items(configName _x));
            _poids = _poids + _itemPoids;
            [false,(configName _x),MNS_Gvar_Items(configName _x)]call DA3F_fnc_Inv_UpDown_Items;
        };
    } forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));

    private _inventoryUnit = [_inventory,_poids];
    private _invDead = "Land_LuggageHeap_02_F" createVehicle [0,0,0];
if !(str _inventoryUnit isEqualTo "[[],0]") then {
_invDead attachTo [_this,[-1,0.5,-0.1],"Pelvis"];
detach _invDead;
_invDead setVariable ["DA3F_StockItems",_inventoryUnit,true];
    {
        _invDead disableCollisionWith _x;
    } forEach playableUnits;
    _invDead spawn {
    waitUntil {sleep 1;((_this getVariable "DA3F_StockItems")select 0) isEqualTo []};
    deleteVehicle _this;
};
};

if (DA3F_Cash <= 0 && DA3F_WCash <= 0) exitWith {};

_cash = "Land_Money_F" createVehicle [0,0,0];
_cash attachTo [_this,[1,0,0.1],"Pelvis"];
detach _cash;
_pepette = DA3F_Cash;
_klix = DA3F_WCash;
_cash setVariable ["DA3F_DeadCash",[_pepette,_klix],true];
// [0,_cash] remoteExec ["DA3F_fnc_ActTarget",-2];
[_cash, ["<t color='#F59800' size='1.2' >Ramasser le cash<t/>", {
            _cash = ((_this select 0) getVariable "DA3F_DeadCash")select 0;
            _Klix = ((_this select 0) getVariable "DA3F_DeadCash")select 1;
            DA3F_Cash = DA3F_Cash + _cash;
            DA3F_WCash = DA3F_WCash + _Klix;
            deleteVehicle (_this select 0);
            [1,format ["Vous venez de Ramasser <br/>%1€<br/>%2Klix", _cash]]call DA3F_fnc_hint;
        }]] remoteExec ["addAction", -2, _cash];
};

_unit spawn
    {
    waitUntil
        {
            if (speed _this isEqualTo 0) exitWith {true};
                DA3F_CamKilled camSetTarget _this;
                DA3F_CamKilled camSetRelPos [0,3.5,4.5];
                DA3F_CamKilled camCommit 0;
        };
    };
