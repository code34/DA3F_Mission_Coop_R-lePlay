/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_Target.sqf
*       ...
*
*/
private ["_type","_expediteur","_text","_historik"];
_type = _this select 0;
switch (_type) do {
    case 0:
    {
    	_expediteur = _this select 1;
    	_text 		= _this select 2;
    	_historik	= player getVariable "DA3F_Save_Msg";
    	hint parseText format ["<t color='#FEFEFE' size='1.1' >Message reçu de :<t/><br/><t color='#00F700' size='1.2' >%1<t/>",name _expediteur];
    	_historik pushBack [name _expediteur,_text];
    	player setVariable ["DA3F_Save_Msg",_historik,false];
    };
};