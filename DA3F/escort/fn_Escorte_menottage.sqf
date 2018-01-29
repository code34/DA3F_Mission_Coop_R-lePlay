/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Escorte_menottage.sqf
*
*
*		Arguments :
*
*		0 : unit
*		1 : bool
*
*		[cursorObject,true]call DA3F_fnc_menottage; // menotté
*		[cursorObject,false]call DA3F_fnc_menottage; // démenotté
*
*/

//	DA3F_TarObj switchMove "AmovPercMstpSnonWnonDnon_EaseIn";
//	DA3F_TarObj switchMove "AmovPercMstpSnonWnonDnon_EaseOut";
//	DA3F_TarObj switchMove "AmovPercMstpSsurWnonDnon";
#include "..\..\DA3F_macros.hpp"
params[
	["_unit",objNull,[objNull]],
	["_bool",false,[false]]
];
if (isNull _unit) exitWith {[1,"Regarde correctement ta cible"]call DA3F_fnc_hint ;false;};
_return = false;
	if (_bool) then [{
			if (!(DA3F_Item_menotte_1 >= 1) || !(DA3F_Item_menotte_2 >= 1)) exitWith {
				[1,"Tu ne dispose pas de menotte"]call DA3F_fnc_hint ;
				_return = false;
			};

			_anime = selectRandom(["InBaseMoves_HandsBehindBack2","AmovPercMstpSnonWnonDnon_Ease"]);
			_unit setVariable ["DA3F_isRestain",true,true];
			_unit setVariable ["DA3F_AnimRestain",_anime,true];
			_unit switchMove "AmovPercMstpSnonWnonDnon_EaseIn";
			_return = true;
			/*
			[_unit,_anime]spawn{
			_unit = _this select 0;
			_anime = _this select 1;
			sleep 0.1;
				while {_unit getVariable "DA3F_isRestain"} do {
					if !(animationState _unit isEqualTo _anime) then {
						_unit switchMove _anime;
					};
				};
			};
			*/
		},{
			_unit setVariable ["DA3F_isRestain",false,true];
			_unit switchMove "AmovPercMstpSnonWnonDnon_EaseOut";
			_return = true;
	}];
_return;