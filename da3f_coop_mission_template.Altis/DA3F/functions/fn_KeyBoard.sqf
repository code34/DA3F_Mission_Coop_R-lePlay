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
 //hintSilent str _key; // Verif keys
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
    []call DA3F_fnc_SoundVolume;
    };
// F3 for Admin mission
case 61: {
	hintSilent "En cours de dev...\nFonctionnalité administrateur à venir.";
};

// keys ² | Menu player
case 41: {
	[1,format["Player interaction<br/>Boujour,<br/>%1",name player]]call DA3F_fnc_hint;
	if !(dialog) then [{
		[]call DA3F_fnc_Units_Interaction;
	},{
		closeDialog 0;
	}];
};
// F
	case 44: {};

// H

	case 35:
		{
   		if ((_shift) && (!_alt)) then
			{
				[]call DA3F_fnc_EjectAir;
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