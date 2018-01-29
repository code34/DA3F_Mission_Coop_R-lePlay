/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       configuration.sqf
*
*/

if !((currentWeapon (vehicle player)) in ["Rangefinder","Laserdesignator"]) exitWith {};

		if !(cameraView isEqualTo "GUNNER") exitWith {
			switch (currentWeapon (vehicle player)) do {
			    case "Rangefinder": {
					hintSilent format ["Regarde dans ton télémètre",nil];
			    };
			    case "Laserdesignator": {
					hintSilent format ["Regarde dans ton désignateur",nil];
			    };
			};
		};

switch (DA3F_IsArrowActived) do {
    case true: {
    hint "Détection désactivé";
    	onEachFrame {};
    	deleteVehicle arrow;
    	arrow = nil;
	7 cutText ["","PLAIN"];
	DA3F_IsArrowActived = false;
    };
    case false: {
    hint "Détection activé";
	DA3F_IsArrowActived = true;
    	arrow = "Sign_Arrow_F" createVehicle [0,0,0];
		onEachFrame {
			_ins = lineIntersectsSurfaces [
				AGLToASL positionCameraToWorld [0,0,0],
				AGLToASL positionCameraToWorld [0,0,1000],
				player
			];
			if (count _ins == 0) exitWith {arrow setPosASL [0,0,0]};
			arrow setPosASL (_ins select 0 select 0);
			arrow setVectorUp (_ins select 0 select 1);
//MCF_HUD_Kill
	7 cutRsc ["MCF_HUD_Kill","PLAIN"];
		private _ui 	= uiNamespace getVariable "MCF_HUD_Kill";
		private _Txt	= _ui displayCtrl 3123500;
		private _obj	= typeOf(_ins select 0 select 2);
		private _dist	= [round(player distance(_ins select 0 select 2))]call DA3F_fnc_numberText;

		if (_dist isEqualTo "10,000,000,000") then {
			_dist = "Search"
		};

		if (_obj isEqualTo "") then [{
			_obj = "Search"
		},{
			_obj = getText(ConfigFile >> "CfgVehicles" >> _obj >> "DisplayName");
		}];
		//	hintSilent format ["%1 à %2m", typeOf(_ins select 0 select 2), round(player distance(_ins select 0 select 2))];

			_Txt ctrlSetStructuredText parseText format ["<t color='#018CD7' shadom='1' size='1' >%1 <br/> %2m<br/>%3<t/>",
			_obj,
			_dist
			];
			_posTxt = ctrlPosition _Txt;
			_Txt ctrlSetPosition [_posTxt select 0,(_posTxt select 1) + 0.25,_posTxt select 2,_posTxt select 3];
			_Txt ctrlCommit 0;
		};
    };
};