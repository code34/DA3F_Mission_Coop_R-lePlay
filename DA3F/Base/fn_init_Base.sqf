/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_init_Base.sqf
*		Initialisation des bases
*
*/
/*
[]spawn{
		_master		= "Pc_Base_1";
    	_result  	= [["1","2"],["1","2","3"]];
    	_varMaster = compile format ["%1 %2 hint str(%1 %3)",_master,"setVariable [format [""DA3F_Stat_%1"",_master],_result,true];","getVariable 'DA3F_Stat_Pc_Base_1'"];
    	call _varMaster;
    };
*/
private ["_master", "_result", "_varMaster", "_stocks", "_NameClass", "_sides", "_name_base", "_marker", "_containers_Max", "_citernes_Max", "_silos_Max", "_Max_Carbut", "_Max_Items", "_Max_Silos", "_icon", "_arr_All_Stock", "_Coffres", "_searchBox", "_obj", "_side"];
{
	_stocks = [];
	_NameClass	= (configName _x);
	_sides	 	= getArray	(_x >> "side");
	_name_base	= getText	(_x >> "displayname");
	_marker	= getText	(_x >> "marker");
	_master	= getText	(_x >> "Name_Obj_Stat_Base");
	_stocks append (getArray	(_x >> "Obj_Stock_Items"));
	_stocks append (getArray	(_x >> "Obj_Stock_Carbu"));
	_stocks append (getArray	(_x >> "Obj_Stock_Silos"));
	_containers_Max = getNumber	(_x >> "containers_Max");
	_citernes_Max	= getNumber	(_x >> "citernes_Max");
	_silos_Max	= getNumber	(_x >> "Silos_Max");
	_Max_Carbut	= getNumber	(_x >> "Stock_Max_Carbut");
	_Max_Items	= getNumber	(_x >> "Stock_Max_Items");
	_Max_Silos	= getNumber	(_x >> "Stock_Max_Silos");
	_icon	 	= getText	(_x >> "icon");

	_arr_All_Stock = [];
	{
		_arr_All_Stock pushBack (_x select 0);
	} forEach _stocks;

	_Coffres = nearestObjects [getMarkerPos _marker,_arr_All_Stock,350];
	_searchBox = [];
	{
		_obj = _x;
		_obj setVariable ["DA3F_StockItems",[[],0],true];
		_obj setVariable ["DA3F_MaxStock",_Max_Items,true];
		_obj setVariable ["DA3F_ClassParent",_NameClass,true];
		{
			_side = _x;
			_obj setVariable ["DA3F_Side",_side,true];
		} forEach _sides;
		_searchBox pushBack _obj;
	} forEach _Coffres;
	_varMaster = compile format ["%1 %2",_master,"setVariable [""DA3F_Stat_PC"",_searchBox,true];"];
	call _varMaster;
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Base_stats"));