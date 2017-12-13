
/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_EjectAir.sqf
*		[]call DA3F_fnc_EjectAir;
*
*/

[]spawn
	{
	if !((vehicle player)isKindOf "Air") exitWith{};
	if ((vehicle player)isKindOf "Air" && (driver vehicle player) == player ) then
			{
			if ((getPosATL player) select 2 < 160) exitWith {
				[1,"Vous êtes trop bas pour vous éjecter"]call DA3F_fnc_hint;
				};
						[player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
						sleep 0.1;
						removeBackpack player;
						player addBackpack "B_parachute";
					 	player action ["GetOUT", vehicle player];
					 	_altitude = (getPosATL player) select 2;
				[1,format ["Ejection effectué<br/>Altitude :<br/>%1m", round _altitude]]call DA3F_fnc_hint;
		diag_log "*******************************************************";
		diag_log "*******************************************************";
		diag_log "***************Dev'Arma3-France Eject******************";
		diag_log format ["%1 à activer le parachute",name player];
		diag_log "*******************************************************";
		diag_log "*******************************************************";
[]spawn
	{
		waitUntil {sleep 1; (getPosATL player) select 2 <= 150};
			player action ["openParachute", vehicle player];
		waitUntil {sleep 1; (getPosATL player) select 2 < 1 || isTouchingGround player};
		sleep 1;
		[1,"Récupération de votre équipement"]call DA3F_fnc_hint;
		[player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
	};
}else{
	[1,"Tu dois être dois un véhicule aérien"]call DA3F_fnc_hint;
	};
};

