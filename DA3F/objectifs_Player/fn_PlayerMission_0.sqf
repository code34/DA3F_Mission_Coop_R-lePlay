/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_PlayerMission_0.sqf
*
*		Otage
*
*/

if (DA3F_Mission_Active) exitWith {
	    [1,format ["Tu as déjà une mission en cours !",nil]]call DA3F_fnc_hint;
	};
_All_Pos = [];
// retirez le commentaire pour ajouter des positions manuellement
// _arr_pos = [[19393.4,13238.3,0]];

	{
		_All_Pos pushBack (_x select 0);
	} forEach (getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Spawn_Ennemy" >> "DA3F_listMrk"));
if !(isNil "_arr_pos") then {
	_All_Pos = _All_Pos + _arr_pos;
};
DA3F_Mission_Active = true;

DA3F_Get_finalPos={
_Init_pos = _this select 0;
//if (_Init_pos isEqualType "") then {_Init_pos = getMarkerPos _Init_pos};
_All_Pos = [];
	{
		_All_Pos pushBack (_x select 0);
	} forEach (getArray(missionConfigFile >> "DA3F_CfgMission" >> "DA3F_Spawn_Ennemy" >> "DA3F_listMrk"));
_verif = true;
private ["_posDesti"];
while {_verif} do {
    _posDesti = selectRandom(_All_Pos);
	if (_posDesti isEqualType []) then {
	    if ((_Init_pos distance _posDesti) > 2000) then {
	    	_verif = false;
	    };
    };

	if (_posDesti isEqualType "") then {
	    if ((_Init_pos distance (getMarkerPos _posDesti)) > 2000) then {
	    	_posDesti =  getMarkerPos _posDesti;
	    	_verif = false;
	    };
    };
};
_posDesti
};

DA3F_Go_House={
	_unit 		= _this select 0;
	_pos 		= _this select 1;
	_houseList 	= nearestObjects [_pos, ["house"], 350];

		{
			_house=_x;
			_buildingPos=_house buildingpos 0;

			if (STR _buildingPos == "[0,0,0]")
				then {
				_houseList=_houseList-[_X];
					};
		}foreach _houseList;

 private _currentHouse= selectRandom _houseList;
 private _n 		= 0;
 private _search 	= true;
 private _positions = 0;
_exit = false;

 WHILE {_search} do {
 if (isNil "_currentHouse") exitWith {_exit = true};
	_housePos = _currentHouse buildingpos _n;

		if (str _housePos == "[0,0,0]")
			then [{
					_search=false;
					_positions=_n;
				},{
					_n=_n+1;
				}];
	sleep 0.01;
			};

if (_exit) exitWith {};
	_position=floor (random _positions);
	_housePos=_currentHouse buildingpos _position;
	_unit setPos _housePos;
};


	_pos=selectRandom(_All_Pos);

private _grp = createGroup civilian;
private _type_Otage = selectRandom(["C_Man_Paramedic_01_F","C_man_polo_4_F","C_man_p_beggar_F","C_Journalist_01_War_F","C_man_w_worker_F"]);
private ["_markerstr"];
	switch (typeName _pos) do {
	    case "ARRAY": {
	    [1,format ["Un civil est en difficulté sur la position:<br/> %1", mapGridPosition _pos]]call DA3F_fnc_hint;
			_type_Otage createUnit [_pos, _grp,"DA3F_otage = this;"];
			[DA3F_otage,_pos]spawn DA3F_Go_House;
			_markerstr = createMarkerLocal [format["Mrk_DA3F_%1", _pos], getPos DA3F_otage];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_dot";
			_markerstr setMarkerTextLocal "! alerte civil !";
			_markerstr setMarkerColorLocal "ColorRed";
	    };
	    case "STRING": {
	    _pos = getMarkerPos _pos;
	    [1,format ["Un civil est en difficulté sur la position:<br/> %1", mapGridPosition _pos]]call DA3F_fnc_hint;
			_type_Otage createUnit [_pos,  _grp,"DA3F_otage = this;"];
			[DA3F_otage,_pos]spawn DA3F_Go_House;
			_markerstr = createMarkerLocal [format["Mrk_DA3F_%1", _pos], getPos DA3F_otage];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_dot";
			_markerstr setMarkerTextLocal "! alerte civil !";
			_markerstr setMarkerColorLocal "ColorRed";
	    };
	};
DA3F_otage setVariable ["DA3F_isRestain",false,true];
DA3F_otage setVariable ["DA3F_isAttached",false,true];
waitUntil {sleep 0.2;!(isNil "DA3F_otage")};
/*
	if (DA3F_Active_debug) then {
		systemChat format ["%1 |-| %2", _All_Pos,_pos];
	};
*/

_final_Pos = [_pos]call DA3F_Get_finalPos;
		_mrk_PosDesti = createMarkerLocal [format["Mrk_DA3F_Desti_%1", _final_Pos], _final_Pos];
		_mrk_PosDesti setMarkerShapeLocal "ICON";
		_mrk_PosDesti setMarkerTypeLocal "hd_dot";
		_mrk_PosDesti setMarkerTextLocal "Destination";
		_mrk_PosDesti setMarkerColorLocal "ColorGreen";
//[DA3F_otage] joinSilent (grpNull);
DA3F_otage disableAI "Move";

waitUntil {sleep 0.2;(DA3F_otage distance _final_Pos) < 6 || !(alive player) || !(alive DA3F_otage)};
DA3F_Mission_Active = false;
{
	deleteMarker _x;
} forEach [_markerstr,_mrk_PosDesti];

_sounds = selectRandom([
"a3\missions_f_beta\data\sounds\firing_drills\drill_finish.wss",
"a3\missions_f_beta\data\sounds\firing_drills\checkpoint_clear.wss"
]);
playSound3D [format["%1",_sounds], player, false, getPosASL player, 1, 1, 0];
_distance_Win = ceil(_final_Pos distance _pos);
if !(alive player) exitWith {};
if !(alive DA3F_otage) exitWith {
	[1,"Prochaine fois tâche de garder l'escorte en vie"]call DA3F_fnc_hint;
	[0,format ["%1 vient de perdre son otage", name player]] remoteExecCall ["DA3F_fnc_hint",-2];
};
	[1,"Vous êtes arrivé à destination"]call DA3F_fnc_hint;

            [0,format ["%1 vient de terminer une mission otage", name player]] remoteExecCall ["DA3F_fnc_hint",-2];
		waitUntil {speed (vehicle player)< 1};
	cutText ["Fin de mission","PLAIN",1];
private _recompense = (500 + (ceil random 1500) + _distance_Win);
DA3F_Cash = DA3F_Cash + _recompense;
	[1,format["Prime de mission : <br/>%1€",[_recompense]call DA3F_fnc_numberText]]call DA3F_fnc_hint;
[]spawn {
DA3F_otage action ["Eject",vehicle player];
	if (captive DA3F_otage) then {
		DA3F_otage setCaptive false;
	};
	_arr = crew (vehicle player);
	_arr = _arr - [DA3F_otage];
	sleep 1;
	DA3F_otage enableAI "Move";
	DA3F_otage forceWalk true;
	DA3F_otage action ["Salute",DA3F_otage];
	sleep 2;
	private _deletePos = [((getPos DA3F_otage)select 0)+ ceil random 150,((getPos DA3F_otage)select 1)+ ceil random 150];
	DA3F_otage moveTo _deletePos;
	_wait = 0;
	private _otage = DA3F_otage;
	DA3F_otage = nil;
	waitUntil {sleep 1; _wait = _wait + 1;_otage distance _deletePos <= 10 || _wait > 120};
	deleteVehicle _otage;
};
/*
			"C_man_polo_4_F" createUnit [_pos, _grp,"DA3F_otage = this;

				DA3F_otage addAction [""<t color='#E31400' >Capturer<t/>"",{
				(_this select 0) attachTo [player,[0,2,0.1]];
				(_this select 0) switchMove ""AmovPercMstpSsurWnonDnon"";
					hint ""Otage en escorte"";
				player setVariable [""DA3F_DetachOtage_1"",player addAction [""<t color='#E29100' >Mettre dans le véhicule<t/>"",{
					detach DA3F_otage;
					DA3F_otage switchMove ""AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"";
					player removeAction (player getVariable ""DA3F_DetachOtage_1"");
					player setVariable [""DA3F_DetachOtage_1"",nil];
					_veh = nearestObjects [player,[""Air"",""Ship"",""Car"",""Tank"",""Support""]]select 0;
					DA3F_otage moveInCargo [_veh, 1];

						player setVariable [""DA3F_DetachOtage_3"",player addAction [""<t color='#E29100' >Sortir du véhicule<t/>"",{
							detach DA3F_otage;
							DA3F_otage switchMove ""AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"";
							player removeAction (player getVariable ""DA3F_DetachOtage_1"");
							player setVariable [""DA3F_DetachOtage_1"",nil];
							_veh = nearestObjects [player,[""Air"",""Ship"",""Car"",""Tank"",""Support""]]select 0;
							DA3F_otage moveInCargo [_veh, 1];

						},nil,899,true,false,"""",""_target distance _this < 4""],false];

				},nil,899,true,false,"""",""_target distance _this < 4""],false];
				player setVariable [""DA3F_DetachOtage_2"",player addAction [""<t color='#E35300' >Stopper l'escorte<t/>"",{
					detach DA3F_otage;
					DA3F_otage switchMove ""AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"";
					player removeAction (player getVariable ""DA3F_DetachOtage_2"");
					player setVariable [""DA3F_DetachOtage_2"",nil];
				},nil,899,true,false,"""",""_target distance _this < 4""],false];
				},nil,900,true,false,"""",""_target distance _this < 4 && !(animationState _this isEqualTo 'AmovPercMstpSsurWnonDnon')""];"];
*/