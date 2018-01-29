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
		private _backG_Left  = findDisplay 602 ctrlCreate ["RscText", 1000, findDisplay 602 displayCtrl 1000];
		private _backG_Right = findDisplay 602 ctrlCreate ["RscText", 1001, findDisplay 602 displayCtrl 1001];
		private _list_Coffre = findDisplay 602 ctrlCreate ["RscListbox", 1502, findDisplay 602 displayCtrl 1502];
		private _txtInfo	 = findDisplay 602 ctrlCreate ["RscStructuredText", 1200, findDisplay 602 displayCtrl 1200];
		private _ListeItem 	 = findDisplay 602 ctrlCreate ["RscListbox", 1500, findDisplay 602 displayCtrl 1500];
		private _ListeUnit 	 = findDisplay 602 ctrlCreate ["RscCombo", 2100, findDisplay 602 displayCtrl 2100];
		private _ListeUCash	 = findDisplay 602 ctrlCreate ["RscCombo", 2101, findDisplay 602 displayCtrl 2101];
		private _ListeDeviz	 = findDisplay 602 ctrlCreate ["RscCombo", 2102, findDisplay 602 displayCtrl 2102];
		private _Edit 		 = findDisplay 602 ctrlCreate ["RscEdit", 1400, findDisplay 602 displayCtrl 1400];
		private _EditCash	 = findDisplay 602 ctrlCreate ["RscEdit", 1401, findDisplay 602 displayCtrl 1401];
		private _Btn_give	 = findDisplay 602 ctrlCreate ["RscButtonMenu", 2400, findDisplay 602 displayCtrl 2400];
		private _Btn_Valide  = findDisplay 602 ctrlCreate ["RscButtonMenu", 2401, findDisplay 602 displayCtrl 2401];
		private _List_Intera = findDisplay 602 ctrlCreate ["RscListbox", 1501, findDisplay 602 displayCtrl 1501];
		private _Btn_Givecah = findDisplay 602 ctrlCreate ["RscButtonMenu", 2403, findDisplay 602 displayCtrl 2403];
		private _Btn_Prendre = findDisplay 602 ctrlCreate ["RscButtonMenu", 2404, findDisplay 602 displayCtrl 2404];
		private _Btn_Depot	 = findDisplay 602 ctrlCreate ["RscButtonMenu", 2405, findDisplay 602 displayCtrl 2405];
            ((findDisplay 602) displayCtrl 631) ctrlSetEventHandler ["LBSelChanged", "_this spawn DA3F_fnc_inv_UseItem"];//uniform
      //      ((findDisplay 602) displayCtrl 632) ctrlSetEventHandler ["LBSelChanged", "_this spawn fnc_test"];//uniform
            ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBSelChanged", "_this spawn DA3F_fnc_inv_UseItem"];//uniform
            ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBSelChanged", "_this spawn DA3F_fnc_inv_UseItem"];//vest
            ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBSelChanged", "_this spawn DA3F_fnc_inv_UseItem"];//backpack
	// Posistion
	_txtInfo	 	ctrlSetPosition [0.80948 * safezoneW + safezoneX, 0.396 * safezoneH + safezoneY, 0.177187 * safezoneW, 0.21 * safezoneH];
	_backG_Right 	ctrlSetPosition [0.80555 * safezoneW + safezoneX, 0.1808 * safezoneH + safezoneY, 0.18375 * safezoneW, 0.43 * safezoneH];
	_list_Coffre 	ctrlSetPosition [0.0171877 * safezoneW + safezoneX, 0.1908 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.14 * safezoneH];
	_backG_Left 	ctrlSetPosition [0.012031 * safezoneW + safezoneX, 0.1808 * safezoneH + safezoneY, 0.185625 * safezoneW, 0.644 * safezoneH];
	_ListeItem 		ctrlSetPosition [0.0171877 * safezoneW + safezoneX, 0.345 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.14 * safezoneH];
	_ListeUCash 	ctrlSetPosition [0.815 * safezoneW + safezoneX, 0.206 * safezoneH + safezoneY, 0.164062 * safezoneW, 0.028 * safezoneH];
	_ListeDeviz 	ctrlSetPosition [0.815 * safezoneW + safezoneX, 0.304 * safezoneH + safezoneY, 0.164062 * safezoneW, 0.028 * safezoneH];
	_ListeUnit 		ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.53 * safezoneH + safezoneY, 0.128906 * safezoneW, 0.033 * safezoneH];
	_Edit 			ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.493 * safezoneH + safezoneY, 0.0360937 * safezoneW, 0.033 * safezoneH];
	//_Edit 			ctrlSetPosition [0.15125 * safezoneW + safezoneX, 0.53 * safezoneH + safezoneY, 0.0360937 * safezoneW, 0.033 * safezoneH];
	_EditCash		ctrlSetPosition [0.828125 * safezoneW + safezoneX, 0.248 * safezoneH + safezoneY, 0.137812 * safezoneW, 0.042 * safezoneH];
	_Btn_give 		ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.575 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.04 * safezoneH];
	_Btn_Valide 	ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.621 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.04 * safezoneH];
	_List_Intera 	ctrlSetPosition [0.0171875 * safezoneW + safezoneX, 0.687 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.135 * safezoneH];
	_Btn_Givecah 	ctrlSetPosition [0.80948 * safezoneW + safezoneX, 0.346 * safezoneH + safezoneY, 0.177187 * safezoneW, 0.042 * safezoneH];
	_Btn_Prendre 	ctrlSetPosition [0.0551875 * safezoneW + safezoneX, 0.493 * safezoneH + safezoneY, 0.063 * safezoneW, 0.031 * safezoneH];
	_Btn_Depot 	ctrlSetPosition [0.128 * safezoneW + safezoneX, 0.493 * safezoneH + safezoneY, 0.063 * safezoneW, 0.031 * safezoneH];
	{
		_x ctrlCommit 0;
	} forEach [
	_ListeUnit,
	_backG_Left,
	_backG_Right,
	_ListeItem,
	_ListeUCash,
	_ListeDeviz,
	_Edit,
	_EditCash,
	_Btn_give,
	_Btn_Valide,
	_List_Intera,
	_Btn_Givecah,
	_txtInfo,
	_Btn_Prendre,
	_Btn_Depot,
	_list_Coffre
	];

	// Color background
	_txtInfo 		ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_backG_Left 	ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_backG_Right 	ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_list_Coffre 	ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_ListeItem 		ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_ListeUnit	 	ctrlSetBackgroundColor [-1,-1,-1,0.8];
	_ListeUCash 	ctrlSetBackgroundColor [-1,-1,-1,0.8];
	_ListeDeviz 	ctrlSetBackgroundColor [-1,-1,-1,0.8];
	_Edit 			ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_EditCash 		ctrlSetBackgroundColor [-1,-1,-1,0.5];
	_Btn_give 		ctrlSetBackgroundColor [0.2,0.85,-1,1];
	_Btn_Valide 	ctrlSetBackgroundColor [0.5,0.3,0.1,1];
	_List_Intera 	ctrlSetBackgroundColor [-1,-1,-1,1];
	_Btn_Givecah 	ctrlSetBackgroundColor [0.6,0.1,0.5,1];
	_Btn_Prendre	ctrlSetBackgroundColor [0.1,0.8,0.3,1];
	_Btn_Depot		ctrlSetBackgroundColor [0.2,0.8,0.3,1];
	// Color Text
	_EditCash 		ctrlSetTextColor [-1,1,-1,0.9];
	_list_Coffre 	ctrlSetTextColor [0.1,0.4,0.85,0.9];
	_ListeItem 		ctrlSetTextColor [0.1,0.4,0.85,0.9];
	_List_Intera	ctrlSetTextColor [-1,1,-1,0.9];
	_Btn_Prendre	ctrlSetTextColor [0.8,0.3,0.1,0.9];
	_Btn_Depot		ctrlSetTextColor [0.8,0.3,0.1,0.9];

	// Text
	_Btn_Prendre	ctrlSetText "Prendre";
	_Btn_Depot 		ctrlSetText "Déposer";
	_Btn_Givecah	ctrlSetText "Donner";
	_Btn_give 		ctrlSetText "Donner";
	_Btn_Valide 	ctrlSetText "Utiliser";
	_Edit 			ctrlSetText "1";
	_EditCash 		ctrlSetText "1";
	_txtInfo		ctrlSetStructuredText parseText format ["<t color='#F44100' align='left' size='1' >Cash :<t/><t color='#FEFEFE' align='right' size='1' >%1€<t/><br/><br/><t color='#F44100' align='left' size='1' >Bank :<t/><t color='#FEFEFE' align='right' size='1' >%2€<t/><br/><br/><t color='#F44100' align='left' size='1' >Klix :<t/><t color='#FEFEFE' align='right' size='1' >%3<img size='0.65' image='%4' /><t/>",
		[DA3F_Cash]call DA3F_fnc_numberText,
		[DA3F_Bank]call DA3F_fnc_numberText,
		[DA3F_WCash]call DA3F_fnc_numberText,
		DA3F_Cfg(getText,"DA3F_IconCustomDevise")
		];


	_ListeItem 	ctrladdEventHandler ["lbselchanged",{_this spawn DA3F_fnc_inv_DoubleClick}];
//	_ListeUnit 	ctrladdEventHandler ["lbselchanged",{_this call {hintSilent format ["%1\n%2",ctrlIDC (_this select 0), (_this select 1)]}}];
	_Btn_give 	ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Give}];
	_Btn_Valide ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Use}];
	_List_Intera ctrladdEventHandler ["lbselchanged",{_this call DA3F_fnc_inv_Valide_ActionListBox}];
	_Btn_Givecah ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_GiveCash}];
	_Btn_Prendre ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Inv_Stock_echange_Items}];
	_Btn_Depot ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_Inv_Stock_echange_Items}];
	/*
	_Btn_Prendre ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_transfert_Inventory}];
	_Btn_Depot ctrladdEventHandler ["buttonclick",{_this call DA3F_fnc_transfert_Inventory}];
	*/

	{
		if (isPlayer _x) then {
			_add 	= _ListeUnit lbAdd format ["%1", name _x];
			lbSetData [2100,(lbSize 2100)-1,str(_x)];
			_add 	= _ListeUCash lbAdd format ["%1", name _x];
			lbSetData [2101,(lbSize 2101)-1,str(_x)];
		};
	} forEach (nearestObjects [player,["man"],10]);

	{
		_add = _ListeDeviz lbAdd format ["%1", _x];
	} forEach ["€","Klix"];

	{
			_add 	= _List_Intera lbAdd format ["%1", _x];
			lbSetData [1501,(lbSize 1501)-1,_x];
	} forEach
		[
			"Aide",
			"Messagerie",
			"Save Posistion",
			"Syncro de vos données"
		];
/*
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
*/


{
    if (MNS_Gvar_Items(configName _x) > 0) then {
        _ListeItem lbAdd format ["[x%1] %2",MNS_Gvar_Items(configName _x),(getText(_x >> "displayName"))];
        _ListeItem lbSetData [(lbSize _ListeItem)-1,str([configName _x,MNS_Gvar_Items(configName _x)])];
        _icon = Items_Cfg(getText,configName _x,"icon");
        if (!(_icon isEqualTo "")) then {
            _ListeItem lbSetPicture [(lbSize _ListeItem)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items_virt"));

	_obj = nearestObjects [player,["B_Slingload_01_Cargo_F","Land_cmp_Tower_F","Land_Tank_rust_F","Land_dp_bigTank_F","Land_LuggageHeap_02_F","Land_cmp_Tower_F"],6]select 0;
	if (isNil "_obj") exitWith {};
	if (isNull _obj) exitWith {};
	if (isNull cursorObject) exitWith {};
		DA3F_TarObj = cursorObject;
	private _invVirtObj	= _obj getVariable "DA3F_StockItems";
//	DA3F_TarObj = _obj;
	if (isnil "_invVirtObj") then [{
		_add 		= _list_Coffre lbAdd format ["Aucun inventaire",nil];
	},{
	_arrItems		= _invVirtObj select 0;
	{
		_item		= _x select 0;
		_Nrbitem	= _x select 1;
		_nameItem 	= Items_Cfg(getText,_item,"displayname");
        _icon       = Items_Cfg(getText,_item,"icon");
		_add 		= _list_Coffre lbAdd format ["%1 X %2", _Nrbitem,_nameItem];
        _list_Coffre 	lbSetPictureRight [(lbSize _list_Coffre)-1,_icon];
		lbSetData [1502,(lbSize 1502)-1,str(_x)];
	} forEach _arrItems;
}];

	waitUntil {!(isNull (findDisplay 602))};
};