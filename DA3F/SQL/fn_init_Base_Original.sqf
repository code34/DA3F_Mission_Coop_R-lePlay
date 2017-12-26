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
{
	_NameClass		= (configName _x);
	_side	 		= getArray	(_x >> "side");
	_name_base 		= getText	(_x >> "displayname");
	_marker	 		= getText	(_x >> "marker");
	_master	 		= getText	(_x >> "Name_Obj_Stat_Base");
	_Stock_Items	= getArray	(_x >> "Obj_Stock_Items");
	_Stock_Carbu	= getArray	(_x >> "Obj_Stock_Carbu");
	_Stock_Silos	= getArray	(_x >> "Obj_Stock_Silos");
	_containers_Max	= getNumber	(_x >> "containers_Max");
	_citernes_Max	= getNumber	(_x >> "citernes_Max");
	_silos_Max		= getNumber	(_x >> "Silos_Max");
	_Max_Carbut	 	= getNumber	(_x >> "Stock_Max_Carbut");
	_Max_Items	 	= getNumber	(_x >> "Stock_Max_Items");
	_Max_Silos	 	= getNumber	(_x >> "Stock_Max_Silos");
	_icon	 		= getText	(_x >> "icon");

	_Arr_Stock_Items=[];
	_Arr_Stock_Carbu=[];
	_Arr_Stock_Silos=[];
		{
			_Arr_Stock_Items pushBack (_x select 0);
		} forEach _Stock_Items;

			{
				_Arr_Stock_Carbu pushBack (_x select 0);
			} forEach _Stock_Carbu;

				{
					_Arr_Stock_Silos pushBack (_x select 0);
				} forEach _Stock_Silos;

	{
	_type = _x;
		switch (_type) do {
		    case "west":
		    {
		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Arr_Stock_Items,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Arr_Stock_Carbu,350];
		    	_Silos 		= nearestObjects [getMarkerPos _marker,_Arr_Stock_Silos,350];
		    	_searchBox  = [];
		    	_searchCarb = [];
		    	_searchSilo = [];
		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _containers_Max) then {
		    		_x setVariable ["DA3F_CoffreBase",[0,_Max_Items,"coffre"],true];
		    		_searchBox pushBack _x;
		    		};
		    	} forEach _Coffres;

		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _citernes_Max) then {
		    		_x setVariable ["DA3F_CiterneBase",[0,_Max_Carbut,"citerne"],true];
		    		_searchCarb pushBack _x;
		    		};
		    	} forEach _Citernes;

		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _silos_Max) then {
		    		_x setVariable ["DA3F_SiloBase",[0,_Max_Silos,"silo"],true];
		    		_searchSilo pushBack _x;
		    		};
		    	} forEach _Silos;

		    	_result  	= [_searchBox,_searchCarb,_searchSilo,west];
		    	_varMaster = compile format ["%1 %2",_master,"setVariable [format [""DA3F_Stat_%1"",'west'],_result,true];"];
		    	call _varMaster;
		    };

		    case "GUER": {
		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Arr_Stock_Items,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Arr_Stock_Carbu,350];
		    	_Silos 		= nearestObjects [getMarkerPos _marker,_Arr_Stock_Silos,350];
		    	_searchBox  = [];
		    	_searchCarb = [];
		    	_searchSilo = [];
		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _containers_Max) then {
		    		_x setVariable ["DA3F_CoffreBase",[0,_Max_Items,"Coffre"],true];
		    		_searchBox pushBack _x;
		    		};
		    	} forEach _Coffres;

		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _citernes_Max) then {
		    		_x setVariable ["DA3F_CiterneBase",[round(random 50),_Max_Carbut,"Citerne"],true];
		    		_searchCarb pushBack _x;
		    		};
		    	} forEach _Citernes;

		    	_yolo = 0;
		    	{
		    		_yolo = _yolo + 1;
		    		if (_yolo <= _silos_Max) then {
		    		_x setVariable ["DA3F_SiloBase",[0,_Max_Silos,"Silo"],true];
		    		_searchSilo pushBack _x;
		    		};
		    	} forEach _Silos;

		    	_result  	= [_searchBox,_searchCarb,_searchSilo,independent];
		    	_varMaster = compile format ["%1 %2",_master,"setVariable [format [""DA3F_Stat_%1"",'indep'],_result,true];"];
		    	call _varMaster;
		    };

		    case "east": {
		    	/* Vraiment ??? */
		    };
		};
	} forEach _side;
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Base_stats"));

