_exit = false;
disableSerialization;
//_title    = "Upload";
_title  = (_this select 0);
_loop   = (_this select 1);
_bool   = (_this select 2);
if (isNil "_bool") then {_bool = false};
5 cutRsc ["DA3F_progress","PLAIN"];
_ui = uiNamespace getVariable "DA3F_progress";
_progressBar = _ui displayCtrl 3138201;
_titleText = _ui displayCtrl 3138202;
_titleText ctrlSetStructuredText parseText format["%2 (1%1)","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0085;

while {true} do {
    sleep _loop;
    if(isNull _ui) then {
        5 cutRsc ["DA3F_progress","PLAIN"];
        _ui = uiNamespace getVariable "DA3F_progress";
        _progressBar = _ui displayCtrl 3138201;
        _titleText = _ui displayCtrl 3138202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
_titleText  ctrlSetStructuredText parseText format["<t size='1px' color='#FA320A'>%3 </t><t size='0.8px' color='#A2FA0A'>(%1%2)...</t>",round(_cP * 100),"%",_title];
//  _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if(_cP >= 1 OR !alive player) exitWith {};
    if(speed player > 2) exitWith     {_exit = true};
    if(speed player < -2) exitWith     {_exit = true};
//  if(life_interrupted) exitWith   {};
};

// Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
    if(_exit) exitWith {[1,"Tu ne dois pas bouger"]call DA3F_fnc_hint;End_Action = true};
    if!(alive player) exitWith {[1,"Tu ne dois pas bouger"]call DA3F_fnc_hint;End_Action = true};
//[1,"Fin de l'envoi<br/>Il est temps de rentrer notre mission est fini"]call DA3F_fnc_hint;
if (_bool) then {
    DA3F_Valide_Missio = true;
    publicVariable "DA3F_Valide_Missio";
    };