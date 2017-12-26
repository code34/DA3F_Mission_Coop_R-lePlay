/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_NearVeh.sqf
*
*/
#include "..\..\DA3F_macros.hpp"
_timeDelVehinMrkSp = DA3F_Cfg(getNumber,"DA3F_MaxTimeDelVeh");
    _SP_OQP = false;
    _nearOtherVeh = nearestObjects [_this select 0,["car","air","ship"],6];
    if (count _nearOtherVeh > 0) then [{
            [1,format["Un véhicule occupe le spawn<br/>Il sera détruit dans : <br/> %1min<br/>Si il reste sur le spawn",[_timeDelVehinMrkSp,"MM:SS"]call bis_fnc_secondsToString]]call DA3F_fnc_hint;
            _vehGenant = _nearOtherVeh select 0;
            if (_timeDelVehinMrkSp < 15) then {_timeDelVehinMrkSp = 15};
            _vehGenant setVariable ["DA3F_TimeDel",_timeDelVehinMrkSp,false];
            _vehGenant spawn {
            _pos_1 = getPos _this;
            _timeDelVehinMrkSp = _this getVariable "DA3F_TimeDel";
            sleep _timeDelVehinMrkSp;
            _pos_2 = getPos _this;
            if (_pos_1 distance _pos_2 <= 0.2) then
                {
                    deleteVehicle _this;
                };
            };
        _SP_OQP = false;
        },{
        _SP_OQP = true;
        }];
    _SP_OQP