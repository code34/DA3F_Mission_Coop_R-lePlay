/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Coms_Appli.sqf
*       Ouverture de l'appli de messagerie
*
*/

_this spawn
    {
    closeDialog 0;
    disableSerialization;
        if !(createDialog "Gui_Coms_Connex") exitWith {};
       private _edit = ((findDisplay 1071217)displayCtrl 1400);
        if (player getVariable "DA3F_New_Co") then
            [{
                _edit ctrlSetText format["Identification",name player];
                sleep 0.8;
                _edit ctrlSetText format["Bonjour",name player];
                sleep 0.8;
                _edit ctrlSetText format["%1",name player];
                sleep 1.5;
                closeDialog 0;
                []call DA3F_fnc_Coms_Apps;
            },{
            [1,"Dans l'attente de pouvoir éditer votre mot de passe celui par défaut est le suivant :<br/>1234<br/>Validez en cliquant sur la flèche droite"]call DA3F_fnc_hint;
        }];
    };