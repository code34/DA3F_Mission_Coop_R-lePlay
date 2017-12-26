/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_ActionVeh.sqf
*		Menu interaction (Windows) du véhicule
*
*/
disableSerialization;

_data = lbData[1500,(lbCurSel 1500)];

if (_data isEqualTo "") exitWith {};

switch (_data) do {

    case "Identifier": {
        []spawn DA3F_fnc_IdentifVeh;
    };

    case "Coffre": {
        []call DA3F_fnc_InventoryVirtVeh;
    };

    case "Réparation": {
    	_this spawn {
    		_activRep = false;
    		_veh = vehicle DA3F_TarObj;
    		//_dmg = damage _veh;
    	if (DA3F_IsAction) exitWith {[1,"Tu te calme tout de suite et tu attends la fin de l'action !!<br/><br/>Non mais ho !! C'est pas vrai ça ..."]call DA3F_fnc_hint;};
    	if (DA3F_Sp_meca) then
    		[{
    		DA3F_IsAction = true;
    		closeDialog 0;
				_rep = ["Réparation",0.5]spawn DA3F_fnc_progresse;
				waitUntil {sleep .5;scriptDone _rep};
				_veh setDamage 0;
    		DA3F_IsAction = false;
		},{
			if (_veh getHitPointDamage "HitEngine" > 0.7) then {_activRep = true};
			if (_veh getHitPointDamage "HitLFWheel" > 0.97) then {_activRep = true};
			if (_veh getHitPointDamage "HitLF2Wheel" > 0.97) then {_activRep = true};
			if (_veh getHitPointDamage "HitRFWheel" > 0.97) then {_activRep = true};
			if (_veh getHitPointDamage "HitRF2Wheel" > 0.97) then {_activRep = true};

				if (_activRep) then [{
    		DA3F_IsAction = true;
    		closeDialog 0;
					_rep = ["Réparation",0.9]spawn DA3F_fnc_progresse;
					waitUntil {sleep .5;scriptDone _rep};
					//_veh setDamage (_dmg - 0.2);
					{
						 _veh setHitPointDamage [_x,((_veh getHitPointDamage _x) - 0.2)];
					} forEach ["HitEngine","HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel"];
    		DA3F_IsAction = false;
				},{
					[1,"Tu dois faire appel à un mécano pour réparer le véhicule totalement"]call DA3F_fnc_hint;
				}];
			}];
   		};
   	};
};
