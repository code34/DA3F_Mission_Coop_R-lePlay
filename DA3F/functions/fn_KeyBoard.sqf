/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_KeyBord.sqf
*       Attribution des actions pour les raccourcis clavier
*
*/

private ["_script","_key"];

Mcf_One_Touche = 0;
_ctrl = _this select 0;
_key = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
// hintSilent format ["%1", _key]; // Verif keys
_WinKeysAction = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

[]spawn
{
	_pause = time + 1;
	waitUntil {time >= _pause};
};
//Vault handling...
if((_key in (actionKeys "GetOver") || _key in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
	};
if(DA3F_IsAction) exitWith {
	if(!DA3F_Stop_Action && _key in _interruptionKeys) then {DA3F_Stop_Action = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction Windows gauche (pour modifier cela ce passe via Controls -> Custom -> User Action 10)
	if(!DA3F_IsAction) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn DA3F_fnc_WinKeysAction;
			waitUntil {scriptDone _handle};
			DA3F_IsAction = false;
		};
	};
	true;
};
   switch (_key) do
   		{
   		case 24: {
   			if (_shift) then
   				{
		   		[]spawn{
		   			{
					    if (_x animationPhase "Door_1_rot" isEqualTo 1 or _x animationPhase "Door_2_rot" isEqualTo 1) then {

						    if ((count (nearestObjects [getPos _x,["car","air"],8]))>0) then [{
							[1,"Fermeture de la barrière impossible"]call DA3F_fnc_hint;
						    },{
						        _x animate ["Door_1_rot", 0];
						        _x animate ["Door_2_rot", 0];
							}];
					    }
					    else
					    {
						        _x animate ["Door_1_rot",1];
						        _x animate ["Door_2_rot",1];
					    };
					}forEach (nearestObjects [player, ["Land_BarGate_F","Land_Net_Fence_Gate_F"], 15]);
		   		};
   			};
   		};
   		/*
   		case 1: {
   			if (!isNull (findDisplay 261117));
   				(findDisplay 261117) closeDisplay 2;
   		};
   		*/

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _WinKeysAction: {
        if (!DA3F_IsAction) then {
            [] spawn  {
                private "_handle";
			_handle = [] spawn DA3F_fnc_WinKeysAction;
                waitUntil {scriptDone _handle};
                DA3F_IsAction = false;
            };
        };
    };

   		case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn DA3F_fnc_jumpFnc; //Local execution
			_handled = true;
		};
	};

    // Sound
    /*
    case _mapKey: {
    []call DA3F_fnc_countUnitOpenMap;
    };
    */
    // Sound
    case 10: {
    []spawn DA3F_fnc_SoundVolume;
    };
// F3 for Admin mission
case 61: {
if (getPlayerUID player in DA3F_Admin) then [{
	[]call DA3F_fnc_init_AdminMenu;
	[0,format["%1 :: Admin menu ouverture",name player]]call DA3F_fnc_hint;
},{
	[1,format["Seul les administrateurs ont accès à ce menu",name player]]call DA3F_fnc_hint;
}];
};

// keys ² | Menu player
case 41: {
	[1,format["Player interaction<br/>Boujour,<br/>%1<br/>Menu Temporaire en cours de maj (Maj : Avoir tout dans le menu 'i' et réaménagement du menu en lui même pour bientôt ... )",name player]]call DA3F_fnc_hint;
	if !(dialog) then [{
		[]call DA3F_fnc_Units_Interaction;
	},{
		closeDialog 0;
	}];
};
// F
	case 44: {};

// H


    //Holster / recall weapon. (Shift + H)
    case 35: {
       		if ((!_shift) && (_alt)) then
			{
				[]call DA3F_fnc_EjectAir;
			};
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            DA3F_WeaponPlayer = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "DA3F_WeaponPlayer" && {!(DA3F_WeaponPlayer isEqualTo "")}) then {
            if (DA3F_WeaponPlayer in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon DA3F_WeaponPlayer;
            };
        };
    };

 // 20 = T | 25 = P
 /*
	case 25:
		{
   		if ((!_shift) && (!_alt)) then
			{
				switch (playerSide) do {
				    case west: {
				    	private _mdp = DA3F_Pc_Red getVariable "DA3F_Red_MAF";
				    	if (isNil "_mdp") then [{
    					    		hint "Votre équipe ne détient pas le mot de passe";
					    	},{
	    					    	hint format ["Le mot de passe est :\n%1", _mdp];
	    					    }];
				    };
				    case east: {
				    	private _mdp = DA3F_Pc_Blu getVariable "DA3F_Blu_MAF";
				    	if (isNil "_mdp") then [{
    					    		hint "Votre équipe ne détient pas le mot de passe";
					    	},{
	    					    	hint format ["Le mot de passe est :\n%1", _mdp];
	    					    }];
				    };

				    default {
				     	hint "Seul les joueurs peuvent consulter cette information";
				    };
				};
			};
		};
	*/
	};
_handled