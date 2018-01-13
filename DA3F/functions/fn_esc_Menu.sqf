/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_statusBar.sqf
*       Menu ECHAP
*
*/
disableSerialization;
while {true} do {
    waitUntil {!(isNull (findDisplay 49))};
    	if !(createDialog "DA3F_menu_Esc") exitWith {};
    		_display = (findDisplay 261117);

_line_1 = (_display displayCtrl 1100);
_line_2 = (_display displayCtrl 1101);
_line_3 = (_display displayCtrl 1102);
_line_1 ctrlSetStructuredText parseText format ["<a href='http://www.devarma3france.fr/' align='center' size='0.7' color='#3177EA'>Site Dev'Arma 3 France</a>", nil]; // Site
_line_2 ctrlSetStructuredText parseText format ["<a href='https://www.facebook.com/groups/ArmaIsNotDead/' align='center' size='0.7' color='#FEFEFE'>Facebook : Arma Is Not Dead</a>", nil]; // Fb
_line_3 ctrlSetStructuredText parseText format ["<a href='https://www.paypal.me/LeBriCodeur' align='center' size='0.7' color='#FF0000'>Soutenir le projet</a>", nil]; // PayPal

_line_1 ctrlSetTooltip "http://www.devarma3france.fr/";
_line_1 ctrlSetTooltipColorBox [0.1,0.2,0.8,0.9];
_line_1 ctrlSetTooltipColorShade [-1,-1,-1,1];
_line_1 ctrlSetTooltipColorText [0.1,0.2,0.8,0.9];

_line_2 ctrlSetTooltip "https://www.facebook.com/groups/ArmaIsNotDead/";
_line_2 ctrlSetTooltipColorBox [1,1,1,0.9];
_line_2 ctrlSetTooltipColorShade [-1,-1,-1,1];
_line_2 ctrlSetTooltipColorText [1,1,1,0.9];

_line_3 ctrlSetTooltip "Soutenir le projet en faisant un don sur : https://www.paypal.me/LeBriCodeur";
_line_3 ctrlSetTooltipColorBox [0.9,0.2,0.1,0.9];
_line_3 ctrlSetTooltipColorShade [-1,-1,-1,1];
_line_3 ctrlSetTooltipColorText [0.9,0.2,0.1,0.9];
    waitUntil {isNull (findDisplay 49) || isNull _display};
    if (!isNull (_display)) then [{
    	_display closeDisplay 1;
    	(findDisplay 49) closeDisplay 1;
    },{
    	(findDisplay 49) closeDisplay 1;
    	_display closeDisplay 1;
	}];
};