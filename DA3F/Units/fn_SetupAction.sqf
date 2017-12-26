/*
*
*       Dev'Arma 3 France
*       The Survivors Rp
*       [DA3F] Aroun Le BriCodeur
*       fn_SetupAction.sqf
*
*/
/*
player addAction ["<t color='#EA4300' size='1.2'>add item</t>",
	{
		["Obj_water",2,"add"]call DA3F_fnc_Add_Ret_Items;
		[1,"add items water ??"]call DA3F_fnc_hint;
	},"",0,true,true,"",""];

player addAction ["<t color='#A4300' size='1.2'>del item</t>",
	{
		["Obj_water",2,"del"]call DA3F_fnc_Add_Ret_Items;
		[1,"del items water ??"]call DA3F_fnc_hint;
	},"",0,true,true,"",""];
*/

/*
player addAction ["<t color='#EA4300' size='1.2'>TP</t>",
	{
		openMap true;
		player allowDamage false;
		onMapSingleClick "player setpos _pos;onMapSingleClick ''; true";
		_InitPos = getPos player;
		waitUntil {!(_InitPos isEqualTo (getPos player))};
		openMap false;
	},"",0,true,true,"","(getPlayerUID player) in DA3F_Admin"];
*/