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
_speed = speed cursorObject;
_handled = false;
// hintSilent format ["%1", _key]; // Verif keys
_WinKeysAction = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if((_key in (actionKeys "GetOver") || _key in (actionKeys "salute")) && {(player getVariable ["DA3F_isRestain",false])}) exitWith {
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
		   	  	[]spawn DA3F_fnc_open_barget;
   		    };
      };

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
		      if(_shift &&
            {animationState player != "AovrPercMrunSrasWrflDf"} &&
            {isTouchingGround player} &&
            {stance player == "STAND"} &&
            {speed player > 2} &&
            {(velocity player) select 2 < 2.5} &&
            {time - jumpActionTime > 1.5}) then
            {
        		  jumpActionTime = time; //Update the time.
			         [player,true] spawn DA3F_fnc_jumpFnc; //Local execution
			      _handled = true;
		        };
	   };

    case _mapKey: {
      // []call DA3F_fnc_countUnitOpenMap;
    };

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
    _this spawn {
      if !(dialog) then [{
        if (isNull cursorObject) exitWith {
          if (player getVariable "DA3F_Escorte") then {
            []spawn DA3F_fnc_Escort_Call_Menu;
          };
        };

        if ((cursorObject distance player )< 5) then {
          if (cursorObject getVariable "DA3F_isRestain")  then [{
            []spawn DA3F_fnc_Escort_Call_Menu;
        },{
          if (player getVariable "DA3F_Escorte") then {
              []spawn DA3F_fnc_Escort_Call_Menu;
          };
        }];
      };
	   },{
		  closeDialog 0;
	   }];
    };
  };

  // F
	case 44: {};

    // H | Holster / recall weapon. (Shift + H)
    case 35: {
       		if ((!_shift) && (_alt)) then
      			{
      				[]spawn DA3F_fnc_EjectAir;
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

	   	// C
	   	case 46:{
	   	//	execVM "DA3F\Target_DesignLaser\fn_CreateDel_Arrow.sqf";
	   		[]spawn DA3F_fnc_CreateDel_Arrow;
		};
   		// T
   		case 20:{
        []spawn {
   				DA3F_IsKeyActived = true;
   				DA3F_Target = cursorObject;
   				_wait = []spawn DA3F_fnc_DesignLaser_Mortier;
          waitUntil {scriptDone _wait};
          5 cutText ["","PLAIN"];
          DA3F_IsKeyActived = false;
          DA3F_cnt = 0.01;
//   				 waitUntil {sleep 0.1;!DA3F_IsKeyActived};
// 				   5 cutText ["","PLAIN"];
   			  };
	   	};
    //Restraining (Shift + R) |-| (Ctrl + R)
    case 19: {
    // Player

        if (_shift && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "DA3F_isRestain")} && {speed cursorObject < 1}) then {
         //   [cursorObject,true]call DA3F_fnc_Escorte_menottage;
					hint "Cible menotté";
            [cursorObject,true] remoteExecCall ["DA3F_fnc_Escorte_menottage",cursorObject];
        };

        if (_ctrlKey && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {alive cursorObject} && {cursorObject distance player < 3.5} && {(cursorObject getVariable "DA3F_isRestain")} && {speed cursorObject < 1}) then {
         //   [cursorObject,true]call DA3F_fnc_Escorte_menottage;
         hint "Cible démenotté";
            [cursorObject,false] remoteExecCall ["DA3F_fnc_Escorte_menottage",cursorObject];

            if (DA3F_Item_menotte_1 >= 1) exitWith {
            [false,"menotte_1",1]call DA3F_fnc_Inv_UpDown_Items;
            cursorObject setVariable ["DA3F_GetMenotte","menotte_1",true];
            false;
            };

            if (DA3F_Item_menotte_2 >= 1) exitWith {
            [false,"menotte_2",1]call DA3F_fnc_Inv_UpDown_Items;
            cursorObject setVariable ["DA3F_GetMenotte","menotte_2",true];
            false;
            };
        };
  // PNJ
          private _cursorObj = cursorObject;

          if (_shift && !(_cursorObj getVariable "DA3F_isRestain")) then {
            if !(_cursorObj isKindOf "Man") exitWith {};
              if (local _cursorObj) then [{
                    _cursorObj switchMove "AmovPercMstpSsurWnonDnon";
                    _cursorObj setVariable ["DA3F_isRestain",true,true];
                    player setVariable ["DA3F_Escorte",true,true];

                    if (DA3F_Item_menotte_1 >= 1) exitWith {
                    [false,"menotte_1",1]call DA3F_fnc_Inv_UpDown_Items;
                    _cursorObj setVariable ["DA3F_GetMenotte","menotte_1",true];
                    false;
                    };

                    if (DA3F_Item_menotte_2 >= 1) exitWith {
                    [false,"menotte_2",1]call DA3F_fnc_Inv_UpDown_Items;
                    _cursorObj setVariable ["DA3F_GetMenotte","menotte_2",true];
                    false;
                    };
              },{
              systemChat "no local";
                  [player,cursorObject,true] remoteExecCall ["DA3F_fnc_EscoPNJ_Menotte",cursorObject];
          }];
        };
        if (_ctrlKey && cursorObject getVariable "DA3F_isRestain") then {
            if !(_cursorObj isKindOf "Man") exitWith {};
              if (local _cursorObj) then [{
                    _cursorObj switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
                    _cursorObj setVariable ["DA3F_isRestain",false,true];
                    player setVariable ["DA3F_Escorte",false,true];
                    _menotte = cursorObject getVariable ["DA3F_GetMenotte","menotte_1"];
                      if !([true,_menotte,1]call DA3F_fnc_Inv_UpDown_Items) exitWith {
                        [1,"Vous n'avez pas pu récupérer les menottes"]call DA3F_fnc_hint;
                      };
              },{
                  [player,cursorObject,false] remoteExecCall ["DA3F_fnc_EscoPNJ_Menotte",cursorObject];
          }];
            [player,cursorObject,false] remoteExecCall ["DA3F_fnc_EscoPNJ_Menotte",cursorObject];
        };
    };
};
_handled