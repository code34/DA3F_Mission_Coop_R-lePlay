
/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_AddActionToBase.sqf
*		[]call DA3F_fnc_AddActionToBase;
*
*/

_Base_Allcoffre 	= [];
_Base_Allciterne 	= [];
_Base_AllSilo		= [];
{
	_NameClass		= (configName _x);
	_side	 		= getArray	(_x >> "side");
	_name_base 		= getText	(_x >> "displayname");
	_marker	 		= getText	(_x >> "marker");
	_master	 		= getText	(_x >> "Name_Obj_Stat_Base");
	_Stock_Items	= getArray	(_x >> "Obj_Stock_Items");
	_Stock_Carbu	= getArray	(_x >> "Obj_Stock_Carbu");
	_Stock_silo		= getArray	(_x >> "Obj_Stock_Silos");
	_containers_Max	= getNumber	(_x >> "containers_Max");
	_Max_Carbut	 	= getNumber	(_x >> "Stock_Max_Carbut");
	_Max_Items	 	= getNumber	(_x >> "Stock_Max_Items");
	_icon	 		= getText	(_x >> "icon");
	ArraySide		= [];
{
	switch (_x) do {case "west": {ArraySide pushBack west};case "GUER": {ArraySide pushBack independent};};
} forEach _side;

	for "_a" from 0 to (count _Stock_Items -1) do
		{
			_Base_Allcoffre pushBack ((_Stock_Items select _a)select 0)
		};

	for "_a" from 0 to (count _Stock_Carbu -1) do
		{
			_Base_Allciterne pushBack ((_Stock_Carbu select _a)select 0)
		};

	for "_a" from 0 to (count _Stock_silo -1) do
		{
			_Base_AllSilo pushBack ((_Stock_silo select _a)select 0)
		};

   	_ActionMaster = compile _master;
    _PC =	call _ActionMaster;
    if (isNil "_PC") exitWith {};
    _PC setVariable ["DA3F_ClassParent",_NameClass,true];
	_PC addAction ["Consulter les stats de la base",
		{
		#include "..\..\DA3F_macros.hpp"
		_classCiterne=[];
		_classCoffre=[];
		_classSilo=[];
		{
			_classCiterne pushBack (_x select 0);
		} forEach (Bases_Cfg(getArray,((_this select 0) getVariable "DA3F_ClassParent"),"Obj_Stock_Carbu"));
		{
			_classCoffre pushBack (_x select 0);
		} forEach (Bases_Cfg(getArray,((_this select 0) getVariable "DA3F_ClassParent"),"Obj_Stock_Items"));
		{
			_classSilo pushBack (_x select 0);
		} forEach (Bases_Cfg(getArray,((_this select 0) getVariable "DA3F_ClassParent"),"Obj_Stock_Silos"));
		disableSerialization;
		if !(createDialog "DA3F_MenuBaseGestion") exitWith {};
			_display = (findDisplay 131217);
			_txt = "";
			_cnt = 0;
			_cntC= 0;
			_cntI= 0;
			_AllCoffre 	= ((_this select 0) getVariable "DA3F_Stat_PC");
			_AllStockage_In_Base 	= [];

				//Real_NameVeh(Class);

				_BaseClass = ((_this select 0) getVariable "DA3F_ClassParent");
				_txt = _txt + "<t color='#FEFEFE' size='0.9' align='center' >Info sur la base<br/><br/>*********<br/><br/><t/>";
				{
					if ((typeOf _x) in _classCiterne) then
						{
							_box = "";
							_cntC = _cntC + 1;
							_info = _x getVariable "DA3F_StockItems";
							_BoxPoidsmax = _info select 1;
							_CfgPoidsmax = (Bases_Cfg(getNumber,_BaseClass,"Stock_Max_Carbut"));
							_box = _box + format ["Citerne n°%1 - %2/%3",_cntC, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + format ["Citerne n°%1 - %2/%3",_cntC, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + "<br/>*********<br/><br/>";
							_add=lbAdd[2102,_box];
							lbSetData[2102,(lbSize 2102)-1,str(_info)];
							_add=lbAdd[2103,_box];
							lbSetData[2103,(lbSize 2103)-1,str(_info)];
						};

						if ((typeOf _x) in _classCoffre) then
						{
							_box = "";
							_cnt = _cnt + 1;
							_info = _x getVariable "DA3F_StockItems";
							_BoxPoidsmax = _info select 1;
							_CfgPoidsmax = (Bases_Cfg(getNumber,_BaseClass,"Stock_Max_Items"));
							_box = _box + format ["Coffre n°%1 - %2/%3",_cnt, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + format ["Coffre n°%1 - %2/%3",_cnt, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + "<br/>*********<br/><br/>";
							_add=lbAdd[2102,_box];
							lbSetData[2102,(lbSize 2102)-1,str(_info)];
							_add=lbAdd[2103,_box];
							lbSetData[2103,(lbSize 2103)-1,str(_info)];
						};
						if ((typeOf _x) in _classSilo) then
						{
							_box = "";
							_cntI = _cntI + 1;
							_info = _x getVariable "DA3F_StockItems";
							_BoxPoidsmax = _info select 1;
							_CfgPoidsmax = (Bases_Cfg(getNumber,_BaseClass,"Stock_Max_Silos"));
							_box = _box + format ["Silo n°%1 - %2/%3",_cntI, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + format ["Coffre n°%1 - %2/%3",_cntI, _BoxPoidsmax, _CfgPoidsmax];
							_txt = _txt + "<br/>*********<br/><br/>";
							_add=lbAdd[2102,_box];
							lbSetData[2102,(lbSize 2102)-1,str(_info)];
							_add=lbAdd[2103,_box];
							lbSetData[2103,(lbSize 2103)-1,str(_info)];
						};
				} forEach _AllCoffre;

				((_display)displayCtrl 2010) ctrlSetStructuredText parseText format ["%1",_txt];

				{
					_add=lbAdd[2100,_x];
				} forEach ["Coffre","Citerne","Silo"];

	//	missionNamespace setVariable ["DA3F_Arr_AllStockage_in_base",_AllStockage_In_Base];

		},nil,10,false,false,"","playerSide in ArraySide && (_target distance _this) < 4"];
/*
	{
	_type = _x;
		switch (_type) do {
		    case "west":
		    {
		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Base_Allcoffre,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Base_Allciterne,350];
		    	_Silos 		= nearestObjects [getMarkerPos _marker,_Base_AllSilo,350];
		    	_searchBox  = [];
		    	_searchCarb = [];
		    	_yolo = 0;
		    	{
		    		if !(isNil {_x getVariable "DA3F_CoffreBase"}) then {
		    			_x addAction ["Consulter le coffre",{
		    			_contenu = ((_this select 0) getVariable "DA3F_CoffreBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_CoffreBase")select 1;
		    			[1,format ["Capacité du coffre :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo west && (_target distance _this) < 4"];
		    		};
		    	} forEach _Coffres;

		    	{
		    		if !(isNil {_x getVariable "DA3F_CiterneBase"}) then {
		    			_x addAction ["Consulter la citerne",{
		    			_contenu = ((_this select 0) getVariable "DA3F_CiterneBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_CiterneBase")select 1;
		    			[1,format ["Capacité de la citerne :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo west && (_target distance _this) < 4"];
		    		};
		    	} forEach _Citernes;

		    	{
		    		if !(isNil {_x getVariable "DA3F_SiloBase"}) then {
		    			_x addAction ["Consulter le silo",{
		    			_contenu = ((_this select 0) getVariable "DA3F_SiloBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_SiloBase")select 1;
		    			[1,format ["Capacité de la citerne :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo west && (_target distance _this) < 4"];
		    		};
		    	} forEach _Silos;
		    };

		    case "independent": {

		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Base_Allcoffre,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Base_Allciterne,350];
		    	_Silos 		= nearestObjects [getMarkerPos _marker,_Base_AllSilo,350];
		    	_searchBox  = [];
		    	_searchCarb = [];
		    	_yolo = 0;
		    	{
		    		if !(isNil {_x getVariable "DA3F_CoffreBase"}) then {
		    			_x addAction ["Consulter le coffre",{
		    			_contenu = ((_this select 0) getVariable "DA3F_CoffreBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_CoffreBase")select 1;
		    			[1,format ["Capacité du coffre :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo independent && (_target distance _this) < 4"];
		    		};
		    	} forEach _Coffres;

		    	{
		    		if !(isNil {_x getVariable "DA3F_CiterneBase"}) then {
		    			_x addAction ["Consulter la citerne",{
		    			_contenu = ((_this select 0) getVariable "DA3F_CiterneBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_CiterneBase")select 1;
		    			[1,format ["Capacité de la citerne :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo independent && (_target distance _this) < 4"];
		    		};
		    	} forEach _Citernes;

		    	{
		    		if !(isNil {_x getVariable "DA3F_SiloBase"}) then {
		    			_x addAction ["Consulter le silo",{
		    			_contenu = ((_this select 0) getVariable "DA3F_SiloBase")select 0;
		    			_MaxCapa = ((_this select 0) getVariable "DA3F_SiloBase")select 1;
		    			[1,format ["Capacité de la citerne :<br/>%1/%2", _contenu,_MaxCapa]]call DA3F_fnc_hint;
		    			},nil,10,false,false,"","playerSide isEqualTo independent && (_target distance _this) < 4"];
		    		};
		    	} forEach _Silos;
		    };

		    case "east": {
		    	// Vraiment ???
		    };
		};
	} forEach _side;
*/
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Base_stats"));
/*
missionNamespace setVariable ["DA3F_Arr_Coffre",_Base_Allcoffre];
missionNamespace setVariable ["DA3F_Arr_Citerne",_Base_Allciterne];
missionNamespace setVariable ["DA3F_Arr_Silo",_Base_AllSilo];
*/