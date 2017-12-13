/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ActTarget.sqf
*       Switch des actions du remoteExec
*
*/
private ["_type","_obj","_cash"];
_type = (_this select 0);
switch (_type) do
    {
    case 0: {
    		_obj = (_this select 1);
    		_obj addAction ["<t color='#F59800' size='1.2' >Ramasser le cash<t/>",
    	{
    		_cash = (_this select 0) getVariable "DA3F_DeadCash";
    		DA3F_Cash = DA3F_Cash + _cash;
    		deleteVehicle (_this select 0);
    		[1,format ["Vous venez de Ramasser <br/>%1€", _cash]]call DA3F_fnc_hint;
    	}];
    };
    // Switch Spécialisation
    case 1: {
        _spe    = _this select 1;
        _bool   = _this select 2;
        ["Pilote",true]call DA3F_fnc_SwitchSpe;
    };
    // Give monney
    case 2: {
        _val    = _this select 1;
        _name   = _this select 2;
        DA3F_Cash = DA3F_Cash + _val;
        [1,format ["%1<br/>vous a donné<br/>%2€", _name,_val]]call DA3F_fnc_hint;
    };
    // Give items
    case 3:
        {
            _val    = _this select 1;
            _item   = _this select 2;
            _ItemN  = _this select 3;
            _ItemP  = _this select 4;
            _expedit= _this select 5;
            _name   = name _expedit;
            _nrb    = missionNamespace getVariable format ["DA3F_Item_%1",_item];
            _nrb = _nrb + _val;
            if ((DA3F_Items_Inv + _ItemP) > DA3F_Max_Items_Inv) exitWith
                {
                    [3,_val,_item,_ItemN,_ItemP,player] remoteExecCall ["DA3F_fnc_ActTarget",_expedit];
                    [1,format["Les items vous sont rendu<br/>%1<br/>n'a pas assez de place",name player]] remoteExecCall ["DA3F_fnc_hint",_expedit];
                    [1,format["Tu manque de place",nil]]call DA3F_fnc_hint;
                };
            DA3F_Items_Inv = DA3F_Items_Inv + _ItemP;
            missionNamespace setVariable [format ["DA3F_Item_%1",_item],_nrb];
            [1,format ["%1<br/>vous a donné<br/>%2 %3", _name,_nrb,_ItemN]]call DA3F_fnc_hint;
        };
    };