
/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_AddActionToBase.sqf
*		[]call DA3F_fnc_AddActionToBase;
*
*/
_Base_Allcoffre = [];
_Base_Allciterne = [];
{
	_NameClass		= (configName _x);
	_side	 		= getArray	(_x >> "side");
	_name_base 		= getText	(_x >> "displayname");
	_marker	 		= getText	(_x >> "marker");
	_master	 		= getText	(_x >> "Name_Obj_Stat_Base");
	_Stock_Items	= getArray	(_x >> "Obj_Stock_Items");
	_Stock_Carbu	= getArray	(_x >> "Obj_Stock_Carbu");
	_containers_Max	= getNumber	(_x >> "containers_Max");
	_Max_Carbut	 	= getNumber	(_x >> "Stock_Max_Carbut");
	_Max_Items	 	= getNumber	(_x >> "Stock_Max_Items");
	_icon	 		= getText	(_x >> "icon");

	{
		_Base_Allcoffre pushBack _x;
	} forEach _Stock_Items;

		{
			_Base_Allciterne pushBack _x;
		} forEach _Stock_Carbu;

   	_ActionMaster = compile _master;
    _PC =	call _ActionMaster;

	_PC addAction ["Consulter les stats de la base",
		{
			_txt = "";
			_cnt = 0;
			_AllCoffre 	= ((_this select 0) getVariable "DA3F_Stat_indep")select 0;
			_AllCiterne = ((_this select 0) getVariable "DA3F_Stat_indep")select 1;

				_txt = _txt + "Info sur la base<br/><br/>*********<br/><br/>";
				{
					_cnt = _cnt + 1;
					_info = _x getVariable "DA3F_CoffreBase";
					_txt = _txt + format ["Coffre n°%1 <br/>Capacité :<br/>%2/%3<br/>-----<br/>", _cnt,(_info select 0), (_info select 1)];
				} forEach _AllCoffre;

		_txt = _txt + "<br/>*********<br/><br/>";
		_cnt = 0;

				{
					_cnt = _cnt + 1;
					_info = _x getVariable "DA3F_CiterneBase";
					_txt = _txt + format ["Citerne n°%1 <br/>Capacité :<br/>%2/%3<br/>-----<br/>", _cnt,(_info select 0), (_info select 1)];
				} forEach _AllCiterne;

			[1,format ["%1",_txt]]call DA3F_fnc_hint;
		},nil,10,false,false,"","playerSide isEqualTo independent && (_target distance _this) < 4"];

	{
	_type = _x;
		switch (_type) do {
		    case "west":
		    {
		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Stock_Items,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Stock_Carbu,350];
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
		    };

		    case "independent": {

		    	_Coffres 	= nearestObjects [getMarkerPos _marker,_Stock_Items,350];
		    	_Citernes 	= nearestObjects [getMarkerPos _marker,_Stock_Carbu,350];
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
		    };

		    case "east": {
		    	/* Vraiment ??? */
		    };
		};
	} forEach _side;
} forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Base_stats"));
missionNamespace setVariable ["DA3F_Arr_Coffre",_Base_Allcoffre];
missionNamespace setVariable ["DA3F_Arr_Citerne",_Base_Allciterne];