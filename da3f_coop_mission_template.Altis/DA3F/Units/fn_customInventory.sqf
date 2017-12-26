/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_customInventory.sqf
*
*/
[]spawn
{
	#include "..\..\DA3F_macros.hpp"
disableSerialization;

	waitUntil {!(isNull (findDisplay 602))};
		private _backG_Left = findDisplay 602 ctrlCreate ["RscText", 1000, findDisplay 602 displayCtrl 1000];
		private _ListeItem 	= findDisplay 602 ctrlCreate ["RscListbox", 1500, findDisplay 602 displayCtrl 1500];
		private _ListeUnit 	= findDisplay 602 ctrlCreate ["RscCombo", 2100, findDisplay 602 displayCtrl 2100];
		private _Edit 		= findDisplay 602 ctrlCreate ["RscEdit", 1400, findDisplay 602 displayCtrl 1400];
		private _Btn_give	= findDisplay 602 ctrlCreate ["RscButtonMenu", 2400, findDisplay 602 displayCtrl 2400];
		private _Btn_Valide = findDisplay 602 ctrlCreate ["RscButtonMenu", 2401, findDisplay 602 displayCtrl 2401];
		private _Btn_Intera = findDisplay 602 ctrlCreate ["RscButtonMenu", 2402, findDisplay 602 displayCtrl 2402];

	// Posistion
	_backG_Left 	ctrlSetPosition [0.012031 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.185625 * safezoneW, 0.506 * safezoneH];
	_ListeItem 		ctrlSetPosition [0.0171877 * safezoneW + safezoneX, 0.258 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.22 * safezoneH];
	_ListeUnit 		ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.5 * safezoneH + safezoneY, 0.128906 * safezoneW, 0.033 * safezoneH];
	_Edit 			ctrlSetPosition [0.15125 * safezoneW + safezoneX, 0.5 * safezoneH + safezoneY, 0.0360937 * safezoneW, 0.033 * safezoneH];
	_Btn_give 		ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.555 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.055 * safezoneH];
	_Btn_Valide 	ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.621 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.055 * safezoneH];
	_Btn_Intera 	ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.687 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.055 * safezoneH];

	_ListeUnit 	ctrlCommit 0;
	_backG_Left ctrlCommit 0;
	_ListeItem 	ctrlCommit 0;
	_Edit 		ctrlCommit 0;
	_Btn_give 	ctrlCommit 0;
	_Btn_Valide ctrlCommit 0;
	_Btn_Intera ctrlCommit 0;

	// Color background
	_backG_Left 	ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_ListeItem 		ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_Edit 			ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_Btn_give 		ctrlSetBackgroundColor [0.2,0.85,-1,1];
	_Btn_Valide 	ctrlSetBackgroundColor [0.5,0.3,0.1,1];
	_Btn_Intera 	ctrlSetBackgroundColor [0.7,0.25,0.2,1];

	// Text
	_Btn_give 		ctrlSetText "Donner";
	_Btn_Valide 	ctrlSetText "Utiliser";
	_Btn_Intera 	ctrlSetText "Application";
	_Edit 			ctrlSetText "1";

DA3F_fnc_DlClick={
if (isNil "DA3F_Dbl_clik") then [{DA3F_Dbl_clik = false;
_wait = time + 1;
waitUntil {time >= _wait};
DA3F_Dbl_clik = nil;
},{
	_this call DA3F_fnc_Use;
	DA3F_Dbl_clik = nil;
}];
};
	_ListeItem 	ctrladdEventHandler ["lbselchanged",{_this spawn DA3F_fnc_DlClick}];
//	_ListeUnit 	ctrladdEventHandler ["lbselchanged",{_this call {hintSilent format ["%1\n%2",ctrlIDC (_this select 0), (_this select 1)]}}];
	_Btn_give 	ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Give}];
	_Btn_Valide ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Use}];
	_Btn_Intera ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Appli}];

	_invVirtUntis	= player getVariable "DA3F_InvVirt";
	_arrItems		= _invVirtUntis select 0;
	{
		_item		= _x select 0;
		_Nrbitem	= _x select 1;
		_nameItem 	= Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
		_add 		= _ListeItem lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _ListeItem 	lbSetPictureRight [(lbSize _ListeItem)-1,_icon];
		lbSetData [1500,(lbSize 1500)-1,str(_x)];
	} forEach _arrItems;

	{
		if (isPlayer _x) then {
			_add 	= _ListeUnit lbAdd format ["%1", name _x];
			lbSetData [2100,(lbSize 2100)-1,str(_x)];
		};
	} forEach (nearestObjects [player,["man"],10]);

	waitUntil {!(isNull (findDisplay 602))};
};


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Pompote Le Despote, v1.063, #Wuficu)
////////////////////////////////////////////////////////
/*
class backG_Left: RscText
{
	idc = 1000;
	x = 0.072031 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.506 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.5};
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0.0771877 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.22 * safezoneH;
};
class RscEdit_1400: RscEdit
{
	idc = 1400;
	x = 0.21125 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
class btn_Give: RscButtonMenu
{
	idc = 2400;
	text = "Donner"; //--- ToDo: Localize;
	x = 0.0771875 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.055 * safezoneH;
	colorBackground[] = {0.2,0.85,-1,1};
};
class btn_use: RscButtonMenu
{
	idc = 2401;
	text = "Utiliser"; //--- ToDo: Localize;
	x = 0.0771875 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.055 * safezoneH;
	colorBackground[] = {0.5,0.3,0.1,1};
};
class Btn_interaction: RscButtonMenu
{
	idc = 2402;
	text = "Application"; //--- ToDo: Localize;
	x = 0.0771875 * safezoneW + safezoneX;
	y = 0.687 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.055 * safezoneH;
	colorBackground[] = {0.7,0.25,0.2,1};
};
class RscCombo_2100: RscCombo
{
	idc = 2100;
	x = 0.0771875 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.033 * safezoneH;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

